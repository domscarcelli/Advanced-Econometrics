use Medicaid.dta, clear

** Data Cleaning

* Making variable names comprehensible
rename racea race
rename educyr educ
rename ftotval income
rename nouslyexp expensive
rename unmtndrx nomed
rename himachip medicaid
rename chgtot medbills
rename adilcr gotsick
rename adilww gotcare

* Removing unnecessary variables from dataset
keep year mepsid age sex race educ income povlev expensive nomed ///
	medicaid covertype medbills gotsick gotcare
	
* Reformatting and cleaning variables
drop if age == 99
drop if age == 0
gen over85          = 1 if age == 85
replace over85      = 0 if age <  85

replace sex         = 0 if sex == 1
replace sex         = 1 if sex == 2
rename sex female

replace educ        = . if educ >= 96

gen white           = 0
replace white       = 1 if race == 100
gen black           = 0
replace black       = 1 if race == 200
gen AN_AI           = 0
replace AN_AI       = 1 if race == 310
gen asian           = 0
replace asian       = 1 if race == 410
gen multiple        = 0
replace multiple    = 1 if race >  410

replace expensive   = . if expensive == 0
replace expensive   = 0 if expensive == 1
replace expensive   = 1 if expensive == 2

replace nomed       = . if nomed     == 0 | nomed     > 2
replace nomed       = 0 if nomed     == 1
replace nomed       = 1 if nomed     == 2

replace medicaid    = 0 if medicaid  == 1
replace medicaid    = 1 if medicaid  == 2

gen insured         = 0
replace insured     = 1 if covertype == 1 | covertype == 2
label variable insured "has medical insurance"

gen medicare        = 1 if age       >  65
replace medicare    = 0 if covertype == 1 | covertype == 3 | medicaid == 1

gen lincome         = log(income)

gen lmedbills       = log(medbills)
label variable lmedbills "log of medbills"
gen billdummy       = 1 if medbills  >  0
replace billdummy   = 0 if medbills  == 0

gen catastrophe     = 0
replace catastrophe = 1 if medbills  >  income * 0.3

replace gotsick     = . if gotsick   == 0 | gotsick   >  2
replace gotsick     = 0 if gotsick   == 1
replace gotsick     = 1 if gotsick   == 2

replace gotcare     = . if gotcare   == 0 | gotcare   >  5
replace gotcare     = 0 if gotcare   <= 2 
replace gotcare     = 1 if gotcare   == 3 | gotcare   == 4

gen eligible        = 0
replace eligible    = 1 if povlev    <= 100 & year    <  2014
replace eligible    = 1 if povlev    <= 138 & year    >= 2014
label variable eligible "qualifies for medicaid"


** Summary Statistics

sum age female educ income povlev
sum insured medicaid if eligible == 1 & year <= 2013
sum insured medicaid if eligible == 1 & year >  2013
sum expensive nomed medbills gotsick gotcare catastrophe


** Regressions

* OLS

destring mepsid, replace
xtset mepsid year

xtreg catastrophe insured medicaid i.year, fe
estimates store est1
xtreg catastrophe insured medicaid lincome age i.year, fe
predict cat_hat
estimates store est2
esttab est1 est2, r2 se(3) mtitles(Restricted Controls)

xtreg gotcare insured medicaid i.year if gotsick == 1, fe
estimates store est3
xtreg gotcare insured medicaid lincome age i.year if gotsick == 1, fe
predict care_hat
estimates store est4
esttab est3 est4, r2 se(3) mtitles(Restricted Controls)

xtreg nomed insured medicaid i.year, fe
estimates store est5
xtreg nomed insured medicaid lincome age i.year, fe
predict med_hat
estimates store est6
esttab est5 est6, r2 se(3) mtitles(Restricted Controls)

esttab est2 est4 est6, r2 se(3) mtitles(Catastrophe GotCare NoMed)

kdensity cat_hat, xline(0) xline(1)
kdensity care_hat, xline(0) xline(1)
kdensity med_hat, xline(0) xline(1)

* Logit

xtlogit catastrophe insured medicaid i.year, fe
estimates store est7
margins , dydx(insured medicaid) atmeans post
estimates store est8
xtlogit catastrophe insured medicaid lincome age i.year, fe
estimates store est9
margins , dydx(insured medicaid) atmeans post
estimates store est10
esttab est7 est9, r2 se(3) mtitles(Restricted Controls)

xtlogit gotcare insured medicaid i.year if gotsick == 1, fe
estimates store est11
margins , dydx(insured medicaid) atmeans post
estimates store est12
xtlogit gotcare insured medicaid lincome age i.year if gotsick == 1, fe
estimates store est13
margins , dydx(insured medicaid) atmeans post
estimates store est14
esttab est11 est13, r2 se(3) mtitles(Restricted Controls)

xtlogit nomed insured medicaid i.year, fe
estimates store est15
margins , dydx(insured medicaid) atmeans post
estimates store est16
xtlogit nomed insured medicaid lincome age i.year, fe
estimates store est17
margins , dydx(insured medicaid) atmeans post
estimates store est18
esttab est15 est17, r2 se(3) mtitles(Restricted Controls)

esttab est2 est10 est4 est14 est6 est18, r2 se(3) mtitles(Catastrophe_OLS ///
	Catastrophe_Logit GotCare_OLS GotCare_Logit NoMed_OLS NoMed_Logit)
	
* Truncated Data

xtreg medbills insured medicaid income age i.year, fe
estimates store est19
xttobit medbills insured medicaid income age i.year, ll(0)
estimates store est20
esttab est19 est20, r2 se(3) mtitles(OLS Tobit)

* Censored Data

hist age, width(1)
xtreg medbills insured medicaid income age i.year if age < 85, fe
estimates store est21
xttobit medbills insured medicaid income age i.year if age < 85, ul(85)
estimates store est22
esttab est21 est22, r2 se(3) mtitles(OLS Tobit)

* Truncated Data (Non-Panel)

reg medbills insured medicaid lincome age female i.race gotsick gotcare i.year
estimates store est19
tobit medbills insured medicaid lincome age female i.race gotsick gotcare i.year, ll(0)
estimates store est20
esttab est19 est20, r2 se(3) mtitles(OLS Tobit)

* Censored Data (Non-Panel)

hist age, width(1)
reg medbills insured medicaid lincome age female i.race gotsick gotcare i.year if age < 85
estimates store est21
tobit medbills insured medicaid lincome age female i.race gotsick gotcare i.year if age < 85, ul(85)
estimates store est22
esttab est21 est22, r2 se(3) mtitles(OLS Tobit)



