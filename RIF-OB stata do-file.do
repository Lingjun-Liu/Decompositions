//*【导入数据】
use http://fmwww.bc.edu/RePEc/bocode/o/oaxaca.dta, clear
gen wage=exp(lnwage)
drop if lnwage==.

//*【分组回归】
* 设置变量
global xvar educ exper tenure age single


* 模型 1：lnwage - iqr (baseline)
local rif iqr(90 10)
rifhdreg lnwage female $xvar, over(female) rif(`rif') robust
estimates store model1

* 模型 2：lnwage - iqr + rwprobit
rifhdreg lnwage female $xvar, over(female) rif(`rif') robust rwprobit($xvar)
estimates store model2

* 模型 3：wage - Gini (baseline)
local rif gini
rifhdreg wage female $xvar, over(female) rif(`rif') robust
estimates store model3

* 模型 4：wage - Gini + rwprobit
rifhdreg wage female $xvar, over(female) rif(`rif') robust rwprobit($xvar)
estimates store model4

* 模型 5：rifhdreg + IQR + rwprobit + Bootstrap
bootstrap, reps(500) seed(101): ///
    rifhdreg lnwage female, ///
    over(female) rif(iqr(90 10)) ///
    robust rwprobit($xvar)
estimates store model5
* 创建比较表
esttab model1 model2 model3 model4 model5 ///
    using rif_models_comparison.rtf, ///
    replace ///
    b(%9.4f) se(%9.4f) ///
    star(* 0.1 ** 0.05 *** 0.01) ///
    label compress ///
    title("RIF Regression Model Comparison") ///
    alignment(D) ///
    mtitles("lnwage IQR" "lnwage IQR + RW" "wage Gini" "wage Gini + RW") ///
    keep(female educ exper tenure age single _cons)
	
// *【RIF+OB分解】

*-------------------------
* 设置变量
*-------------------------
global xvar educ exper tenure

*-------------------------
* 模型 1：oaxaca_rif + IQR(90–10)
*-------------------------
oaxaca_rif lnwage $xvar, rif(iqr(90 10)) by(female) rwlogit($xvar)
estimates store model1

* 模型 2：oaxaca_rif + Gini
oaxaca_rif wage $xvar, rif(gini) by(female) rwlogit($xvar)
estimates store model2

* 模型 3：oaxaca_rif + Variance
oaxaca_rif lnwage $xvar, rif(var) by(female) rwlogit($xvar)
estimates store model3

* 模型 4：oaxaca_rif + IQR + rwlogit + Bootstrap
bootstrap, reps(500) seed(101): ///
    oaxaca_rif lnwage $xvar, rif(iqr(90 10)) by(female) rwlogit($xvar)
estimates store model4

* 导出
esttab model1 model2 model3 model4 using rif_decomp_bootstrap.rtf, ///
    replace ///
    b(%9.4f) se(%9.4f) ///
    star(* 0.1 ** 0.05 *** 0.01) ///
    label compress ///
    title("RIF & Oaxaca_RIF Decomposition with Bootstrap") ///
    mtitles("IQR (ORIF)" "Gini" "Variance" "RIFHDREG+RW+BS" "ORIF+RW+BS") 





