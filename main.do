********************************************************************************
* PURPOSE:
*   - Trigger all of the available do-file
*   - This should be put in the entrypoint.sh so it can be reusable
********************************************************************************

// 1. Basic do-file
do do/basic.do

// 2. Regression table
do do/regression_latex.do

// 3. Data visualization
do do/visualization.do

// 4, 5, ..., N -> depends on user's needs
