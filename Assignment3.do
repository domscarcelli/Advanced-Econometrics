use housingplswork.dta

* Relevant Summary Statistics
sum tanf rent govexcl income agua kids rooms employed


* OLS Regression
reg tanf lrent yr*
est store estimates1
reg tanf lrent govexcl lincome employed yr*
est store estimates2
reg tanf lrent govexcl lincome employed age kids rooms yr*
est store estimates3
reg tanf lrent govexcl lincome employed age kids rooms white female black hispan natamer asian otherrace yr*
est store estimates4
reg tanf lrent govexcl lincome employed age kids rooms white female black hispan natamer asian otherrace dstate* yr*
est store estimates5

esttab estimates1 estimates2 estimates3 estimates4 estimates5, ar2 se(4) mtitles(Baseline Wage_Control Apartment_Control Demo_Control State_Control)


* First Stage IV
reg lrent agua yr*
est store estimates6
reg lrent agua govexcl lincome employed yr*
est store estimates7
reg lrent agua govexcl lincome employed age kids rooms yr*
est store estimates8
reg lrent agua govexcl lincome employed age kids rooms female white black hispan natamer asian otherrace yr*
est store estimates9
reg lrent agua govexcl lincome employed age kids rooms female white black hispan natamer asian otherrace dstate* yr*
est store estimates10

esttab estimates6 estimates7 estimates8 estimates9 estimates10, ar2 se(4) mtitles(Baseline Wage_Control Apartment_Control Demo_Control State_Control)


* Reduced Form Equation
reg tanf agua yr*
est store estimates11
reg tanf agua govexcl lincome employed yr*
est store estimates12
reg tanf agua govexcl lincome employed age kids rooms yr*
est store estimates13
reg tanf agua govexcl lincome employed age kids rooms female white black hispan natamer asian otherrace yr*
est store estimates14
reg tanf agua govexcl lincome employed age kids rooms female white black hispan natamer asian otherrace dstate* yr*
est store estimates15

esttab estimates11 estimates12 estimates13 estimates14 estimates15, ar2 se(4) mtitles(Baseline Wage_Control Apartment_Control Demo_Control State_Control)


* 2SLS Equation
ivreg tanf yr* (lrent=agua)
est store estimates16
ivreg tanf govexcl lincome employed yr* (lrent=agua)
est store estimates17
ivreg tanf govexcl lincome employed age kids rooms yr* (lrent=agua)
est store estimates18
ivreg tanf govexcl lincome employed age kids rooms female white black hispan natamer asian otherrace yr* (lrent=agua)
est store estimates19
ivreg tanf govexcl lincome employed age kids rooms female white black hispan natamer asian otherrace dstate* yr* (lrent=agua)
est store estimates20

esttab estimates16 estimates17 estimates18 estimates19 estimates20, ar2 se(4) mtitles(Baseline Wage_Control Apartment_Control Demo_Control State_Control)

