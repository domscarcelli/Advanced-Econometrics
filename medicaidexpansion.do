use medicaid.dta, clear


** Data Cleaning & formatting

* Metropolitan Area
replace metro2013 = 1 if metro2013 > 0 & metro2013 < 4
replace metro2013 = 2 if metro2013 > 3 & metro2013 < 99

replace metro2011 = 1 if metro2011 > 0 & metro2011 < 4
replace metro2011 = 2 if metro2011 > 3 & metro2011 < 99

* Reshape
gen numid = _n
reshape long re inter state hasbills billsamt insured hispan ///
raceone racetwo income hasdebt debtamt povline metro educ, i(numid) j(year)
drop re inter

* For State Effects
tab state, gen(state)
label variable state1  "foreign territory"
label variable state2  "Alabama"
label variable state3  "Arizona"
label variable state4  "Arkansas"
label variable state5  "California"
label variable state6  "Colorado"
label variable state7  "Connecticut"
label variable state8  "Delaware"
label variable state9  "DC"
label variable state10 "Florida"
label variable state11 "Georgia"
label variable state12 "Idaho"
label variable state13 "Illinois"
label variable state14 "Indiana"
label variable state15 "Iowa"
label variable state16 "Kansas"
label variable state17 "Kentucky"
label variable state18 "Louisiana"
label variable state19 "Maine"
label variable state20 "Maryland"
label variable state21 "Massachusetts"
label variable state22 "Michigan"
label variable state23 "Minnesota"
label variable state24 "Mississippi"
label variable state25 "Missouri"
label variable state26 "Montana"
label variable state27 "Nebraska"
label variable state28 "Nevada"
label variable state29 "New Hampshire"
label variable state30 "New Jersey"
label variable state31 "New Mexico"
label variable state32 "New York"
label variable state33 "North Carolina"
label variable state34 "North Dakota"
label variable state35 "Ohio"
label variable state36 "Oklahoma"
label variable state37 "Oregon"
label variable state38 "Pennsylvania"
label variable state39 "Rhode Island"
label variable state40 "South Carolina"
label variable state41 "South Dakota"
label variable state42 "Tennessee"
label variable state43 "Texas"
label variable state44 "Utah"
label variable state45 "Vermont"
label variable state46 "Virginia"
label variable state47 "Washington"
label variable state48 "West Virginia"
label variable state49 "Wisconsin"
label variable state50 "Wyoming"
label variable state51 "Alaska"
label variable state52 "Hawaii"

* For Year Effects
tab year, gen(year)
label variable year1 "2011"
label variable year2 "2013"
label variable year3 "2015"
label variable year4 "2017"
replace year = 1 if year == 2011
replace year = 2 if year == 2013
replace year = 3 if year == 2015
replace year = 4 if year == 2017

* Cleaning out bad data
drop if hasbills > 6
replace hasbills = 0 if hasbills == 5
drop if billsamt > 9999990
drop if insured  > 6
drop if educ     > 20
replace insured  = 0 if insured == 5
drop if metro    > 5
replace metro    = . if metro == 0
replace metro    = 0 if metro == 2

* For Race Effects
drop if hispan   > 7
replace hispan   = 1 if hispan > 0
rename hispan race7

drop if raceone  == 9
tab raceone, gen(race)
label variable race1 "White"
replace race1 = 1 if racetwo == 1
label variable race2 "Black"
replace race2 = 1 if racetwo == 2
label variable race3 "Native American"
replace race3 = 1 if racetwo == 3
label variable race4 "Asian"
replace race4 = 1 if racetwo == 4
label variable race5 "Pacific Islander"
replace race5 = 1 if racetwo == 5
label variable race6 "Other"
replace race6 = 1 if racetwo == 7
drop raceone racetwo

* Eligibility and Income Variables
gen lincome       = log(income)
gen incomepov     = income/povline
gen eligible      = 0
replace eligible  = 1 if incomepov <= 1
gen expansion     = 0
replace expansion = 1 if incomepov <= 1.38 & incomepov > 1

* Expansion Variables
gen adopt1     = 1
replace adopt1 = 0 if state1  == 1
replace adopt1 = 0 if state2  == 1
replace adopt1 = 0 if state10 == 1
replace adopt1 = 0 if state11 == 1
replace adopt1 = 0 if state12 == 1
replace adopt1 = 0 if state14 == 1
replace adopt1 = 0 if state16 == 1
replace adopt1 = 0 if state18 == 1
replace adopt1 = 0 if state19 == 1
replace adopt1 = 0 if state24 == 1
replace adopt1 = 0 if state25 == 1
replace adopt1 = 0 if state26 == 1
replace adopt1 = 0 if state27 == 1
replace adopt1 = 0 if state33 == 1
replace adopt1 = 0 if state36 == 1
replace adopt1 = 0 if state38 == 1
replace adopt1 = 0 if state40 == 1
replace adopt1 = 0 if state41 == 1
replace adopt1 = 0 if state42 == 1
replace adopt1 = 0 if state43 == 1
replace adopt1 = 0 if state44 == 1
replace adopt1 = 0 if state46 == 1
replace adopt1 = 0 if state49 == 1
replace adopt1 = 0 if state50 == 1
replace adopt1 = 0 if state51 == 1

gen adopt2     = 0
replace adopt2 = 1 if state14 == 1
replace adopt2 = 1 if state18 == 1 
replace adopt2 = 1 if state26 == 1 
replace adopt2 = 1 if state38 == 1
replace adopt2 = 1 if state51 == 1 

gen control     = 0
replace control = 1 if adopt1 == 0 & adopt2 == 0

gen interact1 = adopt1 * year3
gen interact2 = adopt1 * year4
gen interact3 = adopt2 * year4
replace interact1 = 1 if interact3 == 1
drop interact3

gen adopt1trend  = adopt1  * year
gen adopt2trend  = adopt2  * year
gen controltrend = control * year


** Summary Statistics
sum insured hasbills debtamt income if expansion == 1
tab interact1 if expansion == 1
tab interact2 if expansion == 1


** Parallel Trends & DiD

* Parallel(ish)
sum insured if adopt1 == 1 & year1 == 1 & expansion == 1
scalar ins_group1_2011 = r(mean)
sum insured if adopt1 == 1 & year2 == 1 & expansion == 1
scalar ins_group1_2013 = r(mean)
scalar delta_pretreat_G1 = ins_group1_2013 - ins_group1_2011
di delta_pretreat_G1

sum insured if adopt2 == 1 & year1 == 1 & expansion == 1
scalar ins_group2_2011 = r(mean)
sum insured if adopt2 == 1 & year2 == 1 & expansion == 1
scalar ins_group2_2013 = r(mean)
scalar delta_pretreat_G2 = ins_group2_2013 - ins_group2_2011
di delta_pretreat_G2

sum insured if adopt1 == 0 & adopt2 == 0 & year1 == 1 & expansion == 1
scalar ins_control_2011 = r(mean)
sum insured if adopt1 == 0 & adopt2 == 0 & year2 == 1 & expansion == 1
scalar ins_control_2013 = r(mean)
scalar delta_pretreat_ct = ins_control_2013 - ins_control_2011
di delta_pretreat_ct

* First Treatment Period
sum insured if adopt1 == 1 & year3 == 1 & expansion == 1
scalar ins_group1_2015 = r(mean)
scalar delta_treat1_G1 = ins_group1_2015 - ins_group1_2013
di delta_treat1_G1

sum insured if adopt2 == 1 & year3 == 1 & expansion == 1
scalar ins_group2_2015 = r(mean)
scalar delta_treat1_G2 = ins_group2_2015 - ins_group2_2013
di delta_treat1_G2

sum insured if adopt1 == 0 & adopt2 == 0 & year3 == 1 & expansion == 1
scalar ins_control_2015 = r(mean)
scalar delta_treat1_ct = ins_control_2015 - ins_control_2013
di delta_treat1_ct

* Second Treatment Period
sum insured if adopt1 == 1 & year4 == 1 & expansion == 1
scalar ins_group1_2017 = r(mean)
scalar delta_treat2_G1 = ins_group1_2017 - ins_group1_2015
di delta_treat2_G1

sum insured if adopt2 == 1 & year4 == 1 & expansion == 1
scalar ins_group2_2017 = r(mean)
scalar delta_treat2_G2 = ins_group2_2017 - ins_group2_2015
di delta_treat2_G2

sum insured if adopt1 == 0 & adopt2 == 0 & year4 == 1 & expansion == 1
scalar ins_control_2017 = r(mean)
scalar delta_treat2_ct = ins_control_2017 - ins_control_2015
di delta_treat2_ct

** Graphing
matrix dataforgraph=J(4,3,.)
matrix dataforgraph[1,1]=ins_group1_2011
matrix dataforgraph[2,1]=ins_group1_2013
matrix dataforgraph[3,1]=ins_group1_2015
matrix dataforgraph[4,1]=ins_group1_2017
matrix dataforgraph[1,2]=ins_group2_2011
matrix dataforgraph[2,2]=ins_group2_2013
matrix dataforgraph[3,2]=ins_group2_2015
matrix dataforgraph[4,2]=ins_group2_2017
matrix dataforgraph[1,3]=ins_control_2011
matrix dataforgraph[2,3]=ins_control_2013
matrix dataforgraph[3,3]=ins_control_2015
matrix dataforgraph[4,3]=ins_control_2017
svmat dataforgraph
gen timeperiod=_n if dataforgraph1!=.
twoway connected dataforgraph* timeperiod, lcolor(blue%30 red%30 green%30) mcolor(blue%50 red%50 green%50) msymbol(square square square) ///
legend(label(1 "Automatic Expansion") label(2 "Later Expansion") label(3 "No Expansion")) ytitle("Insured Rate") xtitle("Time period")


** Regressions

* OLS
reg insured interact* year* if expansion == 1, r
est store ols1
reg insured interact* lincome educ year* if expansion == 1, r
est store ols2
reg insured interact* lincome educ race* metro year* if expansion == 1, r
est store ols3
esttab ols1 ols2 ols3, ar2 se(4) star(* .10 ** .05 *** .01) mtitles(Baseline Income Demographics)

* Rate of insurance
areg insured interact* year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est1
areg insured interact* lincome educ year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est2
areg insured interact* lincome educ race* metro year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est3
esttab est1 est2 est3, ar2 se(4) star(* .10 ** .05 *** .01) mtitles(Baseline Income Demographics)

* Whether household has medical bills
areg hasbills interact* year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est4
areg hasbills interact* lincome educ year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est5
areg hasbills interact* lincome educ race* metro year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est6
esttab est4 est5 est6, ar2 se(4) star(* .10 ** .05 *** .01) mtitles(Baseline Income Demographics)

* Household medical debt
areg debtamt interact* year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est7
areg debtamt interact* lincome educ year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est8
areg debtamt interact* lincome educ race* metro year* adopt1trend adopt2trend controltrend ///
	 if expansion == 1, absorb(state) vce(cluster state)
est store est9
esttab est7 est8 est9, ar2 se(4) star(* .10 ** .05 *** .01) mtitles(Baseline Income Demographics)
