# JWJK Analytics
### Global Procrastination & Human Development
#### Prepared for: United Nations Development Programme
#### Prepared by: Jeffrey Weltman, Jordan Kassof  

***

This repository contains all data, analysis, and related documents for JWJK Analytic's work for the UN Development Programme.

#### Repository Structure  

- Report is contained in main project directory
    - Report is saved in 3 formats, Rmarkdown, markdown, and HTML
- `/data` directory contains a codebook, data files, scripts for data retrieval, cleaning, and merging
- `/analysis` directory contains R scripts for analysis components of report
- `/write-up_files` directory contains files for HTML report
- The `.Rproj` file is an RStudio project file, if you clone the repo locally, open that project file in RStudio to insure the documents can rerun smoothly

#### Comments on viewing report

- [Click Here to view fully rendered HTML report](http://htmlpreview.github.io/?https://raw.githubusercontent.com/Jkassof/procrastination-analysis/master/write-up.html)

- This report and analyses requires a number of R packages to run. If you wish to clone this repo and re-run locally, you can run the below code in your R terminal to make sure you have necessary dependencies.

```
report_deps <- c("dplyr", "ggplot2", "stringr", "tidyr", "purrr", "rvest", "reshape2")
install.packages(report_deps)
```

***

### Codebook for data files

To view detailed information regarding the data files, pleae refer to the [Codebook](http://htmlpreview.github.io/?https://github.com/Jkassof/procrastination-analysis/blob/master/data/Codebook.html)

***

#### Contact

If there are any questions about the content of this analysis, please contact [Jeff Weltman](mailto:jweltman@smu.edu) or [Jordan Kassof](mailto:jkassof@smu.edu).