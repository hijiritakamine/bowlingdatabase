/* 01 Croosstabulation
	本編の表２〜４までを書き出すためのコードです。
	table1_mcは自分でインストールしてください。
 */
 
 
* ファイルの読み込み
* 作業フォルダーへのルートは自分で設定すること
* cd ""
use "./Datasets/AnalysisWide.dta", replace

* 男女別のクロス集計
* 表２と表３をこっちではまとめてやっています。
table1_mc, by(gender) ///
	vars( ///
		dominant_hand_cat1 cat \ ///
		dominant_hand_cat cat \ ///
		license_type__cat2 cat\ ///
		seed_hold_status1 cat \ ///
		career_cat cat \ ///
		participation contn \ ///
		total_avg_1 contn \ ///
		total_avg_2 contn \ ///
		total_avg_3 contn \ ///
		total_avg_4 contn \ ///
		total_avg_5 contn \ ///
		total_avg_6 contn \ ///
		total_avg_7 contn \ ///
		total_avg_8 contn \ ///
		total_avg_9 contn \ ///
		total_avg_10 contn \ ///
		total_avg_11 contn \ ///
		total_avg_12 contn \ ///
		total_avg_13 contn \ ///
		total_avg_14 contn \ ///
		total_avg_15 contn \ ///
		total_avg_16 contn \ ///
		total_avg_17 contn \ ///
		total_avg_18 contn \ ///
	) ///
	
	
* 表４のコード
* 男
table1_mc if gender == 1 ///
	, by(dominant_hand_cat1) ///
	vars( ///
		total_avg_1 contn \ ///
		total_avg_2 contn \ ///
		total_avg_3 contn \ ///
		total_avg_4 contn \ ///
		total_avg_5 contn \ ///
		total_avg_6 contn \ ///
		total_avg_7 contn \ ///
		total_avg_8 contn \ ///
		total_avg_9 contn \ ///
		total_avg_10 contn \ ///
		total_avg_11 contn \ ///
		total_avg_12 contn \ ///
		total_avg_13 contn \ ///
		total_avg_14 contn \ ///
		total_avg_15 contn \ ///
		total_avg_16 contn \ ///
		total_avg_17 contn \ ///
		total_avg_18 contn \ ///
	) ///
	format(%5.2f)  percformat(%5.2f) 
	
* 女
table1_mc if gender == 2 ///
	, by(dominant_hand_cat1) ///
	vars( ///
		total_avg_1 contn \ ///
		total_avg_2 contn \ ///
		total_avg_3 contn \ ///
		total_avg_4 contn \ ///
		total_avg_5 contn \ ///
		total_avg_6 contn \ ///
		total_avg_7 contn \ ///
		total_avg_8 contn \ ///
		total_avg_9 contn \ ///
		total_avg_10 contn \ ///
		total_avg_11 contn \ ///
		total_avg_12 contn \ ///
		total_avg_13 contn \ ///
		total_avg_14 contn \ ///
		total_avg_15 contn \ ///
		total_avg_16 contn \ ///
		total_avg_17 contn \ ///
		total_avg_18 contn \ ///
	) ///
	format(%5.2f)  percformat(%5.2f) 
