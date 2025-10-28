*===== 需要画图的分解模型

oaxaca_rif $y $micro $meso $macro, by(city) rif(gini) 
estimates store ob_gini1

coefplot ///
(ob_gini1, keep(explained:*) label("Explained")) ///
(ob_gini1, keep(unexplained:*) label("Unexplained")), ///
drop(*:_cons) recast(bar) barwidth(0.5) ///
citop ciopts(recast(rcap) color(black)) ///
ylabel(, angle(0)) xline(0, lcolor(gs10)) ///
graphregion(color(white))
graph export "gini_decomp_2020.pdf", replace

coefplot ///
(ob_gini1, keep(explained:*) label("Explained") ///
 rename(explained:sex = "Sex" ///
        explained:age = "Age" ///
        explained:edu = "Education Level" ///
        explained:hunyin = "Marital Status" ///
        explained:fangchan = "Property Assets" ///
        explained:manbing = "Chronic Disease" ///
        explained:qushi = "Bereavement" ///
        explained:shecan = "Social participation" ///
        explained:ziqian = "Financial Support for Children" ///
        explained:jianmian = "Visit Frequently of Children" ///
        explained:lngdp = "GDP" ///
        explained:fuyangbi = "Old-Age Dependency Ratio")) ///
(ob_gini1, keep(unexplained:*) label("Unexplained") ///
 rename(unexplained:sex = "Sex" ///
        unexplained:age = "Age" ///
        unexplained:edu = "Education Level" ///
        unexplained:hunyin = "Marital Status" ///
        unexplained:fangchan = "Property Assets" ///
        unexplained:manbing = "Chronic Disease" ///
        unexplained:qushi = "Bereavement" ///
        unexplained:shecan = "Social participation" ///
        unexplained:ziqian = "Financial Support for Children" ///
        unexplained:jianmian = "Visit Frequently of Children" ///
        unexplained:lngdp = "GDP" ///
        unexplained:fuyangbi = "Old-Age Dependency Ratio")), ///
drop(*:_cons) recast(bar) barwidth(0.5) ///
citop ciopts(recast(rcap) color(black)) ///
ylabel(, angle(0)) xline(0, lcolor(gs10)) ///
graphregion(color(white))

graph export "gini_decomp_1420.pdf", replace
