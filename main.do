********************************************************************************
* PURPOSE:
*   - Trigger all of the available do-file
*   - This should be put in the entrypoint.sh so it can be reusable
********************************************************************************

clear

// 1. Basic do-file
do do/basic.do

// 2. Regression table
do do/regression_latex.do

// 3. Data visualization
do do/visualization.do

// 4 Execute Jupyter notebook using Stata kernel
shell jupyter nbconvert --to notebook --execute main.ipynb
shell mv main.nbconvert.ipynb main.ipynb

// 5, ..., N -> depends on user's needs

/*
********************************************************************************
* PURPOSE: reproduce results from an open source paper
* https://github.com/adviksh/when-guidance-changes
********************************************************************************
clear

// list packages that we may want to install related
local packages = "unique reghdfe ritest estout ivreghdfe ftools ivreg2 ranktest"

foreach i of local packages {
	capture which `i'
	if _rc != 0 {
		display _rc
		ssc install `i', replace
	}
}

// install softwares
shell apt install python3 -y
shell apt-get install texlive-latex-base -y
shell apt-get install git-all -y

// clone repo
shell git clone https://github.com/adviksh/when-guidance-changes.git
cd when-guidance-changes
cd stata

shell mkdir -p out
shell mkdir -p log

do code/make_shifty.do

clear
exit
*/
