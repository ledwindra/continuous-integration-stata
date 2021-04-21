********************************************************************************
* PURPOSE:
*   - Trigger all of the available do-file
*   - This should be put in the entrypoint.sh so it can be reusable
********************************************************************************

// 1. Basic do-file
do do/basic.do

// 2. Regression table
do do/regression_latex.do

// 3. Make a git commit
shell git status
shell git add regression-table.tex
shell git commit -m "Added regression table tex file"
shell git push origin main
