/* 02 Multilevel analysis
	表５と６、図３を出すためのコードです。
 */

* ファイルの読み込み
* 作業フォルダーへのルートは自分で設定すること
* cd ""
use "./Datasets/AnalysisLong.dta", replace


* null model
mixed total_avg || _all: R.tournament_id || name:,baselevels
estat ic


* model1: 左右のみ
mixed total_avg i.dominant_hand_cat1 || _all: R.tournament_id || name:,baselevels

* グラフの作成と書き出し
margins dominant_hand_cat1
marginsplot, ///
	title("利き手別の推定平均スコア（Model 1）") ///
    recast(scatter) ///
    recastci(rcap) ///
    xlabel(10 "右利き" 20 "左利き") ///
    xscale(range(8 22)) ///
	plotopts(msize(huge) mcolor(black)) ///
	ciopts(lwidth(vthick) lcolor(black)) ///
    ytitle("推定平均スコア") ///
    xtitle("利き手") ///
    ylabel(, angle(horizontal)) ///
    legend(off)
	
graph export "model1.png", ///
    as(png) ///
    width(4300) ///
    replace
	
estat ic


* model2: model1に男女を追加
mixed total_avg i.dominant_hand_cat1 ///
		i.gender ///
	|| _all: R.tournament_id || name: ///
	,baselevels
	
* グラフの作成と書き出し
margins dominant_hand_cat1
marginsplot, ///
	title("利き手別の推定平均スコア（Model 2）") ///
    recast(scatter) ///
    recastci(rcap) ///
    xlabel(10 "右利き" 20 "左利き") ///
    xscale(range(8 22)) ///
	plotopts(msize(huge) mcolor(black)) ///
	ciopts(lwidth(vthick) lcolor(black)) ///
    ytitle("推定平均スコア") ///
    xtitle("利き手") ///
    ylabel(, angle(horizontal)) ///
    legend(off)
	
graph export "model2.png", ///
    as(png) ///
    width(4300) ///
    replace

estat ic


* model3: model2へシード経験の有無を追加
mixed total_avg i.dominant_hand_cat1 ///
		i.gender i.seed_hold_status1 ///
	|| _all: R.tournament_id || name: ///
	,baselevels

* グラフの作成と書き出し
margins dominant_hand_cat1
marginsplot, ///
	title("利き手別の推定平均スコア（Model 3）") ///
    recast(scatter) ///
    recastci(rcap) ///
    xlabel(10 "右利き" 20 "左利き") ///
    xscale(range(8 22)) ///
	plotopts(msize(huge) mcolor(black)) ///
	ciopts(lwidth(vthick) lcolor(black)) ///
    ytitle("推定平均スコア") ///
    xtitle("利き手") ///
    ylabel(, angle(horizontal)) ///
    legend(off)
	
graph export "model3.png", ///
    as(png) ///
    width(4300) ///
    replace
	
estat ic
