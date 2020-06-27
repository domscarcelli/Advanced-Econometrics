use unions.dta

* Summary Statistics for 
sum wage union rtw education experience female year 

* OLS Estimates
reg lwage union
est store estimates1
reg lwage union rtw
est store estimates2
reg lwage union rtw education experience experiencesq eightyfive ninetyfive ohfive 
est store estimates3
reg lwage union rtw education experience experiencesq professional managers clerical craftsmen operators service farm other unemployed eightyfive ninetyfive ohfive 
est store estimates4
reg lwage union rtw education experience experiencesq professional managers clerical craftsmen operators service farm other unemployed female white black hispanic nativeamerican asian otherrace eightyfive ninetyfive ohfive 
est store estimates5
esttab estimates1 estimates2 estimates3 estimates4 estimates5, ar2 se(4) mtitles(Baseline RTW Mincerian Controls1 Controls2)

* Testing Robustness of Standard Errors
reg lwage union rtw education experience experiencesq professional managers clerical craftsmen operators service farm other unemployed female white black hispanic nativeamerican asian otherrace eightyfive ninetyfive ohfive , r
est store estimates6
reg lwage union rtw education experience experiencesq professional managers clerical craftsmen operators service farm other unemployed female white black hispanic nativeamerican asian otherrace eightyfive ninetyfive ohfive [aweight=1/experience]
est store estimates7
esttab estimates5 estimates6 estimates7, ar2 se(4) mtitles(OLS White Weights)

* Estimation with Different Panel Data Models
xtset id year
xtreg lwage union rtw education experience experiencesq female white black hispanic nativeamerican asian otherrace
est store estimates8
areg lwage union rtw education experience experiencesq female white black hispanic nativeamerican asian otherrace, vce(cluster id) absorb(id)
est store estimates9
xtreg lwage union rtw education experience experiencesq female white black hispanic nativeamerican asian otherrace, fe vce(cluster id)
est store estimates10
*(No observations) reg s2.lwage s2.union s2.rtw s2.education s2.experience s2.experiencesq s2.female s2.white s2.black s2.hispanic s2.nativeamerican s2.asian s2.otherrace, vce(cluster id)
*(No observations) est store estimates11
xtreg lwage union rtw education experience experiencesq female white black hispanic nativeamerican asian otherrace, be
est store estimates12
esttab estimates8 estimates9 estimates10 estimates12, ar2 se(4) mtitles(OLS Dummy Within Between)

* Non-Paramentric Effect of Unionization
qreg lwage union rtw education experience experiencesq eightyfive ninetyfive ohfive, vce(robust)
grqreg union, ci ols olsci
