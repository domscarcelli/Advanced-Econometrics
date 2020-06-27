use housingvulnerability

reshape long release inter state age female kids rooms rent heat water furniture gov employed headsalary headtanf spousesalary spousetanf hispan raceone racetwo, i(numid) j(year)
drop release inter

gen yr2013 = 1 if year == 2013
replace yr2013 = 0 if yr2013 == .
gen yr2015 = 1 if year == 2015
replace yr2015 = 0 if yr2015 == .
gen yr2017 = 1 if year == 2017
replace yr2017 = 0 if yr2017 == .

tab state, gen(dstate)

drop if age > 120
replace female = 0 if female == 1
replace female = 1 if female == 2

drop if headsalary > 9999990
drop if spousesalary > 9999990
gen income = headsalary + spousesalary
gen lincome = log(income)
drop if employed == 99
replace employed = 0 if employed > 1

drop if rooms > 20
drop if rent > 99990
drop if rent == 0
gen lrent = log(rent)

gen perks = .
replace perks = 0 if heat == 5 | water == 5 | furniture == 5
replace perks = 1 if heat == 1 | water == 1 | furniture == 1
gen agua = .
replace agua = 1 if water == 1
replace agua = 0 if water == 5 | water == 0

gen tanf = .
replace tanf = 0 if headtanf == 0
replace tanf = 0 if spousetanf == 0
replace tanf = 1 if headtanf == 1
replace tanf = 1 if spousetanf == 1

drop if gov > 5
gen govincl = .
replace govincl = 1 if gov == 1 | gov == 0
replace govincl = 0 if gov == 5
gen govexcl = .
replace govexcl = 1 if gov == 1 
replace govexcl = 0 if gov == 5 | gov == 0

drop if raceone == 9
gen white = 0
replace white = 1 if raceone == 1 | racetwo == 1
gen black = 0
replace black = 1 if raceone == 2 | racetwo == 2
gen natamer = 0
replace natamer = 1 if raceone == 3 | raceone == 5 | racetwo == 3 | racetwo == 5
gen asian = 0
replace asian = 1 if raceone == 4 | racetwo == 4
gen otherrace = 0
replace otherrace = 1 if raceone == 7 | racetwo == 7
drop if hispan == 9
replace hispan = 1 if hispan > 1
