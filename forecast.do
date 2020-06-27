** MGA


use forecast.dta, clear


** Data Cleaning

* Date Formatting
gen date1  = date(date, "MDY", 2020)
gen yqdate =yq(year(date1),quarter(date1))
format yqdate %tq

tsset yqdate
drop if date1 == 21915

* Variable Generation
gen loggdpc1  = log(gdpc1)
gen logunrate = log(unrate)


** B.1

* GDP Time Series
twoway line loggdpc1 yqdate, bgcolor(white) ///
	xtitle("Date") ytitle("log(GDP USD billions 2012)") lcolor(midblue) ///
	lwidth(1) graphregion(color(white)) xlabel(#5, format(%tq))

* Unemployment Time Series
twoway line logunrate yqdate, bgcolor(white) ///
	xtitle("Date") ytitle("log(Unemployment %)") lcolor(midblue) ///
	lwidth(1) graphregion(color(white)) xlabel(#5, format(%tq))


** B.2

* First Difference Transformation - GDP
twoway line d.loggdpc1 yqdate, bgcolor(white) ///
	xtitle("Date") ytitle("FD log(GDP USD billions 2012)") lcolor(midblue) ///
	lwidth(1) graphregion(color(white)) xlabel(#5, format(%tq))

dfuller loggdpc1, lags(5)
dfuller d.loggdpc1, lags(5)

* Deterministic Trend - GDP
gen time   = _n
gen timesq = time^2
reg d.loggdpc1 time
reg d.loggdpc1 time timesq

* First Difference Transformation - Unemployment
twoway line d.logunrate yqdate, bgcolor(white) ///
	xtitle("Date") ytitle("FD log(Unemployment %)") lcolor(midblue) ///
	lwidth(1) graphregion(color(white)) xlabel(#5, format(%tq))

dfuller logunrate, lags(5)
dfuller d.logunrate, lags(5)

* Deterministic Trend - GDP
reg d.logunrate time
reg d.logunrate time timesq


** B.3

* Persistence
corrgram d.loggdpc1, lags(5)
corrgram d.logunrate, lags(5)

* AR(?) - GDP
reg d.loggdpc1 l(1/8).d.loggdpc1 time timesq
reg d.loggdpc1 l(1/7).d.loggdpc1 time timesq
reg d.loggdpc1 l(1/6).d.loggdpc1 time timesq
reg d.loggdpc1 l(1/5).d.loggdpc1 time timesq
reg d.loggdpc1 l(1/4).d.loggdpc1 time timesq
reg d.loggdpc1 l(1/3).d.loggdpc1 time timesq
reg d.loggdpc1 l(1/2).d.loggdpc1 time timesq
reg d.loggdpc1 l.d.loggdpc1 time timesq

varsoc d.loggdpc1

* AR(?) - Unemployment
reg d.logunrate l(1/8).d.logunrate time timesq
reg d.logunrate l(1/7).d.logunrate time timesq
reg d.logunrate l(1/6).d.logunrate time timesq
reg d.logunrate l(1/5).d.logunrate time timesq
reg d.logunrate l(1/4).d.logunrate time timesq
reg d.logunrate l(1/3).d.logunrate time timesq
reg d.logunrate l(1/2).d.logunrate time timesq
reg d.logunrate l.d.logunrate time timesq

varsoc d.logunrate


** B.4

* More Variable Generation & Formatting
gen dloggdpc1    = d.loggdpc1
gen ldloggdpc1   = l.d.loggdpc1
gen l2dloggdpc1  = ldloggdpc1[_n-1]
gen l3dloggdpc1  = ldloggdpc1[_n-2]
gen l4dloggdpc1  = ldloggdpc1[_n-3]
gen dlogunrate   = d.logunrate
gen ldlogunrate  = l.d.logunrate
gen l2dlogunrate = ldlogunrate[_n-1]
gen l3dlogunrate = ldlogunrate[_n-2] /// most of these are leftover from previous attempts at B.5
gen l4dlogunrate = ldlogunrate[_n-3] /// a lot of them are useless

tsappend, add(4)

sum time if date1 == 21823
scalar lastperiod =  r(mean)

replace time   = _n
replace timesq = time^2

gen gdp5       = gdpc1  if time > 100
gen unrate5    = unrate  if time > 100
gen yqdate5    = yqdate if time > 100

* Forecasting - GDP
gen ldloggdpc1_sim = l.d.loggdpc1 if time==`=scalar(lastperiod+1)'
gen l2dloggdpc1_sim = ldloggdpc1[_n-2] if time==`=scalar(lastperiod+1)'
reg dloggdpc1 ldloggdpc1 l2dloggdpc1 time timesq
gen dloggdpc1_sim  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[ldloggdpc1]*ldloggdpc1_sim + _b[l2dloggdpc1]*l2dloggdpc1_sim ///
	if time==`=scalar(lastperiod+1)'


forvalues I=`=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace ldloggdpc1_sim = l.dloggdpc1_sim if time==`I'
replace l2dloggdpc1_sim = ldloggdpc1_sim[_n-2] if time==`I'
replace l2dloggdpc1_sim = ldloggdpc1[_n-2] if time == 122
replace dloggdpc1_sim  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[ldloggdpc1]*ldloggdpc1_sim + _b[l2dloggdpc1]*l2dloggdpc1_sim ///
	if time==`I'
}

gen loggdpc1_sim = loggdpc1[_n-1] + dloggdpc1_sim if time == `=scalar(lastperiod+1)'
forvalues I = `=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace loggdpc1_sim = loggdpc1_sim[_n-1] + dloggdpc1_sim if time == `I'
}

gen gdp_sim = exp(loggdpc1_sim)

twoway line gdpc1 gdp_sim yqdate, lcolor(midblue midblue) ///
	lpatter(solid dash) lwidth(1 1)
	
twoway line gdp5 gdp_sim yqdate5, lcolor(midblue midblue) ///
	lpatter(solid dash) lwidth(1 1)
	
* Forecasting - Unemployment
gen ldlogunrate_sim = l.d.logunrate if time==`=scalar(lastperiod+1)'
gen l2dlogunrate_sim = ldlogunrate[_n-2] if time==`=scalar(lastperiod+1)'
reg dlogunrate ldlogunrate l2dlogunrate time timesq
gen dlogunrate_sim  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[ldlogunrate]*ldlogunrate_sim + _b[l2dlogunrate]*l2dlogunrate_sim ///
	if time==`=scalar(lastperiod+1)'


forvalues I=`=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace ldlogunrate_sim = l.dlogunrate_sim if time==`I'
replace l2dlogunrate_sim = ldlogunrate_sim[_n-2] if time==`I'
replace l2dlogunrate_sim = ldlogunrate[_n-2] if time == 122
replace dlogunrate_sim  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[ldlogunrate]*ldlogunrate_sim + _b[l2dlogunrate]*l2dlogunrate_sim ///
	if time==`I'
}

gen logunrate_sim = logunrate[_n-1] + dlogunrate_sim if time == `=scalar(lastperiod+1)'
forvalues I = `=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace logunrate_sim = logunrate_sim[_n-1] + dlogunrate_sim if time == `I'
}

gen unrate_sim = exp(logunrate_sim)

twoway line unrate unrate_sim yqdate, lcolor(midblue midblue) ///
	lpatter(solid dash) lwidth(1 1)

twoway line unrate5 unrate_sim yqdate5, lcolor(midblue midblue) ///
	lpatter(solid dash) lwidth(1 1)
	

** B.5

* Lags 3 & 4
gen l3dloggdpc1_sim = ldloggdpc1[_n-3] if time > 120
replace l3dloggdpc1_sim = ldloggdpc1_sim[_n-3] if time == 124 /// probably wrong
gen l4dloggdpc1_sim = ldloggdpc1[_n-4] if time > 120

gen l3dlogunrate_sim = ldlogunrate[_n-3] if time > 120
replace l3dlogunrate_sim = ldlogunrate_sim[_n-3] if time == 124 /// probably wrong
gen l4dlogunrate_sim = ldlogunrate[_n-4] if time > 120

* ADL(4,4) - GDP
ardl dloggdpc1 dlogunrate, exog(time timesq) lags(4)
gen dloggdp_adl  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[L1.dloggdpc1]*ldloggdpc1_sim + _b[L2.dloggdpc1]*l2dloggdpc1_sim + ///
	_b[L3.dloggdpc1]*l3dloggdpc1_sim + _b[L3.dloggdpc1]*l3dloggdpc1_sim + ///
	_b[L1.dlogunrate]*ldlogunrate_sim + _b[L2.dlogunrate]*l2dlogunrate_sim + ///
	_b[L3.dlogunrate]*l3dlogunrate_sim + _b[L4.dlogunrate]*l4dlogunrate_sim + ///
	_b[dlogunrate]*dlogunrate_sim if time==`=scalar(lastperiod+1)'

forvalues I=`=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace dloggdp_adl  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[L1.dloggdpc1]*ldloggdpc1_sim + _b[L2.dloggdpc1]*l2dloggdpc1_sim + ///
	_b[L3.dloggdpc1]*l3dloggdpc1_sim + _b[L3.dloggdpc1]*l3dloggdpc1_sim + ///
	_b[L1.dlogunrate]*ldlogunrate_sim + _b[L2.dlogunrate]*l2dlogunrate_sim + ///
	_b[L3.dlogunrate]*l3dlogunrate_sim + _b[L4.dlogunrate]*l4dlogunrate_sim + ///
	_b[dlogunrate]*dlogunrate_sim if time==`I'
}	

gen loggdp_adl = loggdpc1[_n-1] + dloggdp_adl if time == `=scalar(lastperiod+1)'
forvalues I = `=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace loggdp_adl = loggdp_adl[_n-1] + dloggdp_adl if time == `I'
}

gen gdp_adl = exp(loggdp_adl)

twoway line gdpc1 gdp_adl gdp_sim yqdate, lcolor(midblue midblue red) ///
	lpatter(solid dash dash) lwidth(1 1 0.25)
	
twoway line gdp5 gdp_adl gdp_sim yqdate5, lcolor(midblue midblue red) ///
	lpatter(solid dash dash) lwidth(1 1 0.25)

* ADL(4,4) - Unemployment
ardl dlogunrate dloggdpc1, exog(time timesq) lags(4)
gen dlogunrate_adl  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[L1.dloggdpc1]*ldloggdpc1_sim + _b[L2.dloggdpc1]*l2dloggdpc1_sim + ///
	_b[L3.dloggdpc1]*l3dloggdpc1_sim + _b[L3.dloggdpc1]*l3dloggdpc1_sim + ///
	_b[L1.dlogunrate]*ldlogunrate_sim + _b[L2.dlogunrate]*l2dlogunrate_sim + ///
	_b[L3.dlogunrate]*l3dlogunrate_sim + _b[L4.dlogunrate]*l4dlogunrate_sim + ///
	_b[dloggdpc1]*dlogunrate_sim if time==`=scalar(lastperiod+1)'

forvalues I=`=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace dlogunrate_adl  = _b[_cons] + _b[time]*time + _b[timesq]*timesq + ///
	_b[L1.dloggdpc1]*ldloggdpc1_sim + _b[L2.dloggdpc1]*l2dloggdpc1_sim + ///
	_b[L3.dloggdpc1]*l3dloggdpc1_sim + _b[L3.dloggdpc1]*l3dloggdpc1_sim + ///
	_b[L1.dlogunrate]*ldlogunrate_sim + _b[L2.dlogunrate]*l2dlogunrate_sim + ///
	_b[L3.dlogunrate]*l3dlogunrate_sim + _b[L4.dlogunrate]*l4dlogunrate_sim + ///
	_b[dloggdpc1]*dlogunrate_sim if time==`I'
}	

gen logunrate_adl = logunrate[_n-1] + dlogunrate_adl if time == `=scalar(lastperiod+1)'
forvalues I = `=scalar(lastperiod+2)'/`=scalar(lastperiod+4)' {
replace logunrate_adl = logunrate_adl[_n-1] + dlogunrate_adl if time == `I'
}

gen unrate_adl = exp(logunrate_adl)

twoway line unrate unrate_adl unrate_sim yqdate, lcolor(midblue midblue gray) ///
	lpatter(solid dash dash) lwidth(1 1 1)
	
twoway line unrate5 unrate_adl unrate_sim yqdate5, lcolor(midblue midblue gray) ///
	lpatter(solid dash dash) lwidth(1 1 1)

* Difference
gen gdp_diff    = gdp_sim    - gdp_adl
gen unrate_diff = unrate_sim - unrate_adl

sum gdp_diff unrate_diff












