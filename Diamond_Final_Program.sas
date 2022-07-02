
/* Accessing Data */
%LET inpath=/home/u49852218/STATS/Assignment/Input;
LIBNAME STATDATA "/home/u49852218/STATS/Assignment/Output";

data STATDATA.DiamondImport;
	infile "&inpath/diamonds.csv" dsd
		   dlm=',' firstobs=2;
    input id $ carat cut $ color $ clarity $ depthpercent table
    	  price length width depth;
run;

/*Exploring data*/
proc contents data=STATDATA.DiamondImport varnum;
Run;

proc print data=STATDATA.DiamondImport (obs=5);
Run;

/* Encode categorical data into numeric value */
data STATDATA.DiamondNumbered;
	set STATDATA.DiamondImport;
	if cut = 'Fair' then cut = 1;
		else if cut = 'Good' then cut = 2;
		else if cut = 'Very Goo' then cut = 3;
		else if cut = 'Premium' then cut = 4;
		else if cut = 'Ideal' then cut = 5;
	
	if color = 'J' then color = 1;
		else if color = 'I' then color = 2;
		else if color = 'H' then color = 3;
		else if color = 'G' then color = 4;
		else if color = 'F' then color = 5;
		else if color = 'E' then color = 6;
		else if color = 'D' then color = 7;
	
	if clarity = 'I1' then clarity = 1;
		else if clarity = 'SI2' then clarity = 2;
		else if clarity = 'SI1' then clarity = 3;
		else if clarity = 'VS2' then clarity = 4;
		else if clarity = 'VS1' then clarity = 5;
		else if clarity = 'VVS2' then clarity = 6;
		else if clarity = 'VVS1' then clarity = 7;
		else if clarity = 'IF' then clarity = 8;
	
	cutNo = input(cut, comma9.);
	colorNo = input(color, comma9.);
	clarityNo = input(clarity, comma9.);
	
	drop cut color clarity;
run;

/* Frequency Table for variable cutNo colorNo clarityNo */
title 'Frequency Table for variable cutNo colorNo clarityNo'; 
proc freq data=statdata.DiamondNumbered;
	tables cutNo colorNo clarityNo / missing nocum;
run;

/* Summary Statistics */
ods noproctitle;
ods graphics / imagemap=on;
proc means data=STATDATA.DiamondNumbered maxdec=2
				chartype mean median range std min max n vardef=df;
	var carat cutNo colorNo clarityNo depthpercent 
		table length width depth price;
title 'Summary Statistics for each variable'; 
run;

/* Univariate Analysis on all continious variable*/
proc univariate data=statdata.DiamondNumbered plot;
	title 'Univariate Analysis of each variable';
	id id;
run;

/* Remove outlier 1st time */
data STATDATA.DiamondNoOutlier1;
	set STATDATA.DiamondNumbered;
	if length = 0 then delete;
	if width = 0 then delete;
	if depth = 0 then delete;
	if depthpercent < 45 or depthpercent > 75 then delete;
	if table > 90 then delete;
	
run;

/* Scatter Plot Matrix */
proc sgscatter data=STATDATA.DiamondNoOutlier1;
			   matrix carat depthpercent table length width depth price;
	title 'Scatter Plot matrix';
run;

/* Multiple Linear Regression Analysis */
proc reg data=STATDATA.DiamondNoOutlier1;
		model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width depth/ clb vif;
    	id id;
run;

/* Model Selection with Forward Selection */
ods graphics on;
proc reg data=STATDATA.DiamondNoOutlier1 PLOTS(MAXPOINTS=none);
	model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width depth / selection=forward;
	title 'Diamond data: Forward selection results'; 
run;
ods graphics off;

/* Backward Elimination*/
ods graphics on;
proc reg data=STATDATA.DiamondNoOutlier1 PLOTS(MAXPOINTS=none);
	model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width depth/ selection=backward;
	title 'Diamond data: Backward elimination results'; 
run;
ods graphics off;

/* Stepwise Selection */
ods graphics on;
proc reg data=STATDATA.DiamondNoOutlier1 PLOTS(MAXPOINTS=none);
	model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width depth/ selection=stepwise;
title 'Diamond data: Stepwise selection results'; 
run;
title;
ods graphics off;

/*  Diagnostics Plots  */
ods graphics on;
proc reg data = STATDATA.DiamondNoOutlier1 PLOTS(MAXPOINTS=none)
	plots(only label) = rstudentbypredicted
	plots(only label) = cooksd
	plots(only label) = dffits
	plots(only label) = dfbetas
;
model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width depth; 
id id;
run;

/*  Print observations that has potential outliers  */
proc print data= STATDATA.DiamondNoOutlier1 noobs;
	where id = '48411' or id = '24068';
run;

/* Remove outlier 2nd time */
data STATDATA.DiamondNoOutlier2;
	set STATDATA.DiamondNoOutlier1;
	if id = 24068 then delete;
	if id = 48411 then delete;
run;

************** Diagnostics Plots ***************;
ods graphics on;
proc reg data = STATDATA.DiamondNoOutlier2 PLOTS(MAXPOINTS=none)
	plots(only label) = rstudentbypredicted
	plots(only label) = cooksd
	plots(only label) = dffits
	plots(only label) = dfbetas
;

model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width depth; 
id id;
run;

/*  Print observations that has potential outliers  */
proc print data= STATDATA.DiamondNoOutlier1 noobs;
	where id = '49190' or 
		  id = '20695' or
		  id = '14636' or
		  id = '21655' or
		  id = '27416';
run;

/* Remove outlier 3rd time */
data STATDATA.DiamondNoOutlier2;
	set STATDATA.DiamondNoOutlier1;
	if id = 49190 then delete;
run;

/* Multiple Linear Regression Analysis (removed outlier)*/
proc reg data=STATDATA.DiamondNoOutlier2 PLOTS(MAXPOINTS=none);
		model price = carat cutNo colorNo clarityNo depthpercent 
					  table length width/ clb vif;
    	id id;
run;
