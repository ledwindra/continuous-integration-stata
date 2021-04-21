********************************************************************************
* PURPOSE: Run a regression and export the table into LaTeX
********************************************************************************

// list installed packages
ado

// list packages that we may want to install related to LaTeX
local packages = "outreg2"

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
outreg2 using latex-table/regression-table.tex, replace cttop(full)
	
exit, clear
