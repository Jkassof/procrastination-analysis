---
title: "Human Development and Procrastination"
author: "Jeffrey Weltman and Jordan Kassof"
date: "11/26/2017"
output:
  html_document:
    toc: true
    keep_md: true
---

# Introduction
***

Some info about high-level project info and goals

# Data Sources
***

Two primary raw data sources, discussed below.

### Procrastionation Data

Qualtrics data, very rough around the edges, various assumptions made. See codebook for
details of all columns.

### Human Development Index Data

Human Development Index maintained by UN, blah blah some info from Wikipedia. Link to source.
Explanation of which tables. Link to codebook for columns.

# Data Importing & Merging
***

The below codechunk sources the data cleaning script for our procrastination data. There is a 
commented out write.csv statement if source data is updated and you want to get local
clean copies of the new source data

```r
source("analysis/ProcrastinationData-ImportAndTidying.R")
#write.csv()
knitr::kable(procrastination_dims,"html",row.names=FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:right;"> Number of Rows </th>
   <th style="text-align:right;"> Number of Columns </th>
  </tr></thead>
<tbody><tr>
<td style="text-align:right;"> 4264 </td>
   <td style="text-align:right;"> 61 </td>
  </tr></tbody>
</table>

The below codechunk sources the wikipedia scraping script for HDI data. There is a 
commented out write.csv statement if source data is updated and you want to get local
clean copies of the new source data

```r
source("data/hdi-wiki-scrape.R")
# write.csv(hdi_clean, file = "data/hdi_table.csv", row.names = FALSE)
```


The below codechunk merges the two datasets and saves a copy to the /data directory.
The saving step has been commented out, remove the # sign if data is updated and a new
copy of the clean and merged data is required.

```r
all_data <- merge(
  final_procras,
  hdi_clean,
  by.x = "CntryOfRes",
  by.y = "country",
  all.x = TRUE
)
# write.csv()
```

# Preliminary Analysis
***

```r
source("analysis/q4-analysis.R")
knitr::kable(summary_list, col.names = c("Variable", "Min Value", "1st Quartile", "Median", "Mean", "3rd Quartile", "Max Value", "NA Count"), digits = 2)
```



Variable        Min Value   1st Quartile     Median       Mean   3rd Quartile   Max Value   NA Count
-------------  ----------  -------------  ---------  ---------  -------------  ----------  ---------
Age               1.9e+01        2.8e+01      37.50      38.28          45.00     8.0e+01         NA
AnnualIncome      1.0e+04        1.5e+04   45000.00   59879.87       87500.00     2.5e+05        415
hdi               4.8e-01        9.2e-01       0.92       0.91           0.92     9.5e-01        173
DPMean            1.0e+00        2.4e+00       3.00       3.05           3.80     5.0e+00         NA
AIPMean           1.0e+00        2.4e+00       2.93       2.96           3.53     5.0e+00         NA
GPMean            1.0e+00        2.8e+00       3.25       3.24           3.75     5.0e+00         NA
SWLSMean          1.0e+00        2.4e+00       3.00       3.05           3.80     5.0e+00         NA

# Deep Dive
***
