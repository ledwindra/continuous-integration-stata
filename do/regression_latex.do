********************************************************************************
* PURPOSE: Run a regression and export the table into LaTeX
********************************************************************************

// list installed packages
ado

// list packages that we may want to install related to LaTeX
local packages = "outreg estout"

foreach i of local packages {
	capture which `i'
	display _rc
	if _rc != 0 {
		display _rc
		ssc install `i', replace
	}
}

// load data
sysuse auto, clear

// run a regression model
regress mpg foreign weight turn

// export to a tex file
outreg using latex-table/regression-table, bdec(2 5 3 2) varlabels replace tex starlevels(10 5 1) ///
	sigsymbols(+,*,**) summstat(F \ r2_a) summtitle(F statistic \ Adjusted R-squared) ///
	summdec(1 2)
	
exit, clear
