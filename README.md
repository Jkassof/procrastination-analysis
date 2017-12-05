# JWJK Analytics
### Global Procrastination & Human Development
#### Prepared for: United Nations Development Programme
#### Prepared by: Jeffrey Weltman, Jordan Kassof  

***

This repository contains all data, analysis, and related documents for JWJK Analytic's work for the UN Development Programme.

#### Repository Structure  

- Report is contained in main project directory
    - Report is saved in 3 formats, Rmarkdown, markdown, and HTML
- `/data` directory contains data files, script for data retrieval, cleaning, and merging
- `/analysis` directory contains R scripts for analysis components of report
- `/write-up_files` directory contains files for HTML report
- The `.Rproj` file is an RStudio project file, if you clone the repo locally, open that project file in RStudio to insure the documents can rerun smoothly

#### Commentary on viewing report

- This report and analysis requires a number of R packages. See .bib file for details of packages/versions used.
- Click link at bottom of readme to view HTML report

***

### Codebook for data files

#### Field specifications for TidyProcrastination.csv

#### Field specifications for hdi_table.csv
- CntryOfRes (character): Country the HDI score is for
- HDI (numeric): The Human Development Index score, during the creation of this report the values are estimated in 2016 for the year 2015
- hdi_group (character): This is a low/middle/high/very-high variable, this ranges are standardized since 2014. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

***

#### Contact

If there are any questions about the content of this analysis, please contact [Jeff Weltman](mailto:jweltman@smu.edu) or [Jordan Kassof](mailto:jkassof@smu.edu).

## [Click Here to view fully rendered HTML report](http://htmlpreview.github.io/?https://raw.githubusercontent.com/Jkassof/procrastination-analysis/master/write-up.html)