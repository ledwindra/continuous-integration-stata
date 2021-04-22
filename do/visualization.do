********************************************************************************
* PURPOSE: Provide a do-file example to visualize data in a batch mode
********************************************************************************

clear

set obs 1000
generate x = rnormal(0, 1)
histogram x, bin(30)

clear
exit
