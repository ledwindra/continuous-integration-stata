clear
shell whoami
shell cat /etc/os-release
set obs 1000
generate x = rnormal(0, 1)
save tmp.dta, replace
export delimited tmp.csv, delimiter(",") novarnames replace
