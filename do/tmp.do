********************************************************************************
* PURPOSE: Provide a do-file example to run on GitHub Actions
********************************************************************************

// see the user name and operating system used
shell whoami
shell cat /etc/os-release

// bla-bla-bla
set obs 1000
generate x = rnormal(0, 1)

// save data stata and csv
save data/tmp.dta, replace
export delimited data/tmp.csv, delimiter(",") novarnames replace
