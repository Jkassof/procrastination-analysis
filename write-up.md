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
library(knitr)
library(kableExtra)
source("analysis/ProcrastinationData-ImportAndTidying.R")
kable(procrastination_dims,"html",row.names=FALSE) %>%
  kable_styling(bootstrap_options = c("striped","condensed"), 
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
```


The below codechunk merges the two datasets and saves a copy to the /data directory.
The saving step has been commented out, remove the # sign if data is updated and a new
copy of the clean and merged data is required.

```r
source("data/merging-hdi-and-procrastination.R")
```

# Preliminary Analysis
***

Below we source our preliminary analysis script.

```r
source("analysis/q4-analysis.R")
```

#### Summary Statistics


```r
# Print display friendly table of summary statistics for key variables
kable(summary_list, 
             col.names = c("Variable", "Min Value", "1st Quartile",
                           "Median", "Mean", "3rd Quartile", 
                           "Max Value", "Missing Count"), 
             digits = 2, 
             format = "html",
             format.args = list(scientific = FALSE)) %>%
  kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> Variable </th>
   <th style="text-align:right;"> Min Value </th>
   <th style="text-align:right;"> 1st Quartile </th>
   <th style="text-align:right;"> Median </th>
   <th style="text-align:right;"> Mean </th>
   <th style="text-align:right;"> 3rd Quartile </th>
   <th style="text-align:right;"> Max Value </th>
   <th style="text-align:right;"> Missing Count </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Age </td>
   <td style="text-align:right;"> 19.00 </td>
   <td style="text-align:right;"> 28.00 </td>
   <td style="text-align:right;"> 37.50 </td>
   <td style="text-align:right;"> 38.28 </td>
   <td style="text-align:right;"> 45.00 </td>
   <td style="text-align:right;"> 80.00 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AnnualIncome </td>
   <td style="text-align:right;"> 10000.00 </td>
   <td style="text-align:right;"> 15000.00 </td>
   <td style="text-align:right;"> 45000.00 </td>
   <td style="text-align:right;"> 59879.87 </td>
   <td style="text-align:right;"> 87500.00 </td>
   <td style="text-align:right;"> 250000.00 </td>
   <td style="text-align:right;"> 415 </td>
  </tr>
<tr>
<td style="text-align:left;"> HDI </td>
   <td style="text-align:right;"> 0.48 </td>
   <td style="text-align:right;"> 0.92 </td>
   <td style="text-align:right;"> 0.92 </td>
   <td style="text-align:right;"> 0.91 </td>
   <td style="text-align:right;"> 0.92 </td>
   <td style="text-align:right;"> 0.95 </td>
   <td style="text-align:right;"> 173 </td>
  </tr>
<tr>
<td style="text-align:left;"> DPMean </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.40 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 3.05 </td>
   <td style="text-align:right;"> 3.80 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> AIPMean </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.40 </td>
   <td style="text-align:right;"> 2.93 </td>
   <td style="text-align:right;"> 2.96 </td>
   <td style="text-align:right;"> 3.53 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> GPMean </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.80 </td>
   <td style="text-align:right;"> 3.25 </td>
   <td style="text-align:right;"> 3.24 </td>
   <td style="text-align:right;"> 3.75 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
<tr>
<td style="text-align:left;"> SWLSMean </td>
   <td style="text-align:right;"> 1.00 </td>
   <td style="text-align:right;"> 2.40 </td>
   <td style="text-align:right;"> 3.00 </td>
   <td style="text-align:right;"> 3.05 </td>
   <td style="text-align:right;"> 3.80 </td>
   <td style="text-align:right;"> 5.00 </td>
   <td style="text-align:right;"> NA </td>
  </tr>
</tbody>
</table>

### Frequency Tables

##### Gender

```r
kable(gender_freqs, format = "html", col.names = c("Gender", "Participants")) %>%
    kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> Gender </th>
   <th style="text-align:right;"> Participants </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Female </td>
   <td style="text-align:right;"> 2309 </td>
  </tr>
<tr>
<td style="text-align:left;"> Male </td>
   <td style="text-align:right;"> 1721 </td>
  </tr>
<tr>
<td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
</tbody>
</table>

##### Work Status


```r
kable(workstatus_freqs, format = "html", col.names = c("Work Status", "Participants")) %>%
    kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> Work Status </th>
   <th style="text-align:right;"> Participants </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> full-time </td>
   <td style="text-align:right;"> 2260 </td>
  </tr>
<tr>
<td style="text-align:left;"> student </td>
   <td style="text-align:right;"> 837 </td>
  </tr>
<tr>
<td style="text-align:left;"> part-time </td>
   <td style="text-align:right;"> 465 </td>
  </tr>
<tr>
<td style="text-align:left;"> unemployed </td>
   <td style="text-align:right;"> 258 </td>
  </tr>
<tr>
<td style="text-align:left;"> retired </td>
   <td style="text-align:right;"> 174 </td>
  </tr>
<tr>
<td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 42 </td>
  </tr>
</tbody>
</table>

##### Occupation


```r
kable(occu_freqs, format = "html", col.names = c("Occupation", "Participants")) %>%
    kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> Occupation </th>
   <th style="text-align:right;"> Participants </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 2662 </td>
  </tr>
<tr>
<td style="text-align:left;"> Education </td>
   <td style="text-align:right;"> 150 </td>
  </tr>
<tr>
<td style="text-align:left;"> Software &amp; IT </td>
   <td style="text-align:right;"> 66 </td>
  </tr>
<tr>
<td style="text-align:left;"> Attorney </td>
   <td style="text-align:right;"> 62 </td>
  </tr>
<tr>
<td style="text-align:left;"> Writer </td>
   <td style="text-align:right;"> 45 </td>
  </tr>
<tr>
<td style="text-align:left;"> engineer </td>
   <td style="text-align:right;"> 32 </td>
  </tr>
<tr>
<td style="text-align:left;"> manager </td>
   <td style="text-align:right;"> 32 </td>
  </tr>
<tr>
<td style="text-align:left;"> Medicine </td>
   <td style="text-align:right;"> 32 </td>
  </tr>
<tr>
<td style="text-align:left;"> Science </td>
   <td style="text-align:right;"> 30 </td>
  </tr>
<tr>
<td style="text-align:left;"> retired </td>
   <td style="text-align:right;"> 28 </td>
  </tr>
<tr>
<td style="text-align:left;"> Student </td>
   <td style="text-align:right;"> 24 </td>
  </tr>
<tr>
<td style="text-align:left;"> Editor </td>
   <td style="text-align:right;"> 21 </td>
  </tr>
<tr>
<td style="text-align:left;"> Marketing </td>
   <td style="text-align:right;"> 20 </td>
  </tr>
<tr>
<td style="text-align:left;"> Unemployed </td>
   <td style="text-align:right;"> 18 </td>
  </tr>
<tr>
<td style="text-align:left;"> houswife </td>
   <td style="text-align:right;"> 16 </td>
  </tr>
<tr>
<td style="text-align:left;"> Sales </td>
   <td style="text-align:right;"> 14 </td>
  </tr>
<tr>
<td style="text-align:left;"> Accountant </td>
   <td style="text-align:right;"> 13 </td>
  </tr>
<tr>
<td style="text-align:left;"> consultant </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> Financial Advisor </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
<tr>
<td style="text-align:left;"> home maker </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
<tr>
<td style="text-align:left;"> Administrator </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
<tr>
<td style="text-align:left;"> director </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
<tr>
<td style="text-align:left;"> Graphic Designer </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
<tr>
<td style="text-align:left;"> Server </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
<tr>
<td style="text-align:left;"> Artist </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
<tr>
<td style="text-align:left;"> Customer Service </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
<tr>
<td style="text-align:left;"> Librarian </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
<tr>
<td style="text-align:left;"> Administrative Assistant </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research Assistant </td>
   <td style="text-align:right;"> 8 </td>
  </tr>
<tr>
<td style="text-align:left;"> Business Owner </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> President </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> psychologis </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> Social Worker </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> Journalist </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
<tr>
<td style="text-align:left;"> Project Manager </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
<tr>
<td style="text-align:left;"> Translator </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
<tr>
<td style="text-align:left;"> clerk </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Finance </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Graduate Assistant </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Market Analyst </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Nanny </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Pastor ; Life coach  clergy </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Tutor </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Analyst </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Architect </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> operations manager </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> project manager </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research Associate </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Retail </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> RN </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> secretary </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Web Designer </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bank Teller </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> ceo </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Computer Consultant </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Deputy Director </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Human Resource Manager </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Insurance Agent </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> law enforcement </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Legal Assistant </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Musician </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> na </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Pharmacist </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> psychotherapist </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Receptionist </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> researcher </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Academic </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Academic Assistant </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Art Director </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> associate </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> banker </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Chief of Staff </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Clutter clearer,  video editor, caterer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Communications </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Consumer Case Coordinator </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Creative Director </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> dentist </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> designer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Designer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Diplomat </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Driver </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Executive Assistant </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Executive Director </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Graduate Research Assistant </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Information Technology Consultant </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Insurance </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Internship </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> journalist (freelance) </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> laboratory technician </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Law clerk </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> lecturer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> letter carrier </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Library technician </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Market Research Analyst </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Network Engineer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Owner </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Paralegal </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Paraprofessional </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> policy analyst </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Postdoc </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Press Officer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Self Employed </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> self-employed Photographer </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> stocker </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Supervisor </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> university faculty </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> veterinarian </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> vice-president </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> acounting analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Activities Leader </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Actress </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> acupuncturist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> adjunct faculty / University + communit </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Administrative Asistant for Jewelry Stor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Administrative Officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> adult care </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> advocate </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Agronomist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> airline </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> airport ground handler </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Antique Dealer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Assoc. Governmental Program Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Associate / investment banking </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> associate at law firm </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Associate Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Associate director/ marketing communicat </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Associate Producer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> asst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Asst. Prof. </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Astrohysicist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> audio engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Aviation Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bar &amp; Restaurant Owner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bartender </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> bookkeeper </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> bookkeeper/ actor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> bookseller </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Box Office Representative </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Braillist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Budget analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> business </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Business / Test Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> BUSINESS CONSULTA </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> business consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> business manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> businesswoman </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> buyer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> C E O/ M D </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> CAD operator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> CAD Technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Camera Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Campus Planner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Capstone Golf Course </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Career Placement Associate </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Case Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Casting Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> cataloguer /  freelance artist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> chairman of the board </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> chauffeur </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Chief Financial Officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Chiefe Development Engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> chiropractor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> civil servant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Civil servant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Client Relationship Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Clinical Dietitian </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Clinical Research Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Clinical Trial Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Co-Proprietor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Collection management specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> College Administrator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> college faculty </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Communications &amp; Publishing </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> company director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Computer Instructor (Continuing Educatio </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Computer Operator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Computer Science </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Computers </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Consultant and entrepreneur (small busin </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Consulting Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Controller </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Contsuruction Management </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Coordinator of International Programs </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> coordinatore operativo </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> copy supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Corporate instructor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Corporate Trainer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Corporation President </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Corrections </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Country Style Employee </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Creative Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> CRNA </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Data Warehouse Engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dealer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dental &amp; Disability Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dept. Director (Non-profit) </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Deputy Chief of Public Information for t </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Deputy Chieif Information Officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> deputy practice manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> detail checker </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Developer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dietitian </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director / information technology </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director of a language program </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director of Academic Affairs </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director of business development </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director of Contract Management </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director of non-profit organization </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director Operations </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Director,social Dvelopment </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Disability Allowance </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dish Washer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Divisional Manager of a large cosmetics </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Ecology technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Economist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Economy </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> education </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Education (at a university) </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> education administration </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Education Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> EHS Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> election services </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Electrical Technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> electronic technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> employed by a church </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> EMT </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> energy therapist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> entertainer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> entrepreneur </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Entrepreneur &amp; Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Environmental Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> environmental education non profit direc </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Environmental Engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Environmental Senior Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> EOD </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Executive </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Executive officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Executive Vice President / Senior Lender </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Facilitator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Facilities Management </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Farm Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> federal excise tax auditor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Field Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> film editor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Film Industry/Miscelanious </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Film maker </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> financial analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Financial Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Financial Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Financial Controller </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> financial officer / small career-trainin </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> financial risk manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Fitness Assistant / wellness mentor / ca </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Fitness Instructor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> flight surgeon </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Food Department Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Food Service Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Foreign Affairs Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Framer/Sales Associate </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> free lance bookkeeper </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Free lance editor and tutor--in theory </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> free professionist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Freelance </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Freelance musician / part time EMT / pri </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Freelance Project Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Full-Time Mother / Part-Time Editor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> fulltime office assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> furniture maker, home restorer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Gender/Public Health Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Geophysicist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Gove service </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Graduate Researcher </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Grants Administrator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Grocery Store Salesman </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Groundskeeper </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Head - Operations &amp; QA </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> health care </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Healthcare Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> host </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> hostess </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Hotel Desk Clerk </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Housekeeping </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> HR generalist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Human Resource Manger </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> HVAC Tech </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> ICT Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> information assisstant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Information Developer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Information Management </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Information technology </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> innkeeper </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Instructional Assistant Online </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> instructor / coach </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> insurance agent </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> insurance broker's assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Insurance Claims Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Insurance Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> intern </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Internet &amp; media consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> interpreter </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Investigative Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Investment Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> investment banker </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> ISTraining Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Janitor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> jewelry artist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Juvenile Corrections Officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Lab Services Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Labor Relations Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> laborer (construction) </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> land use planner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> landscape designer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Language Service Provider </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> language trainer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Legal Assistant / Office Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Legal Secretary </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Legislation Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Library Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> library paraprofessional </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Life Guard </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> LPN </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> maintenance tech. </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Management consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Management Consultant &amp; Entrepreneur </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Manager - Analytical and Environmental S </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> manager IT </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Manager,Interacitve Media </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> manufacturing </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Massage Therapist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Master Control Operator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> md </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Mechanical Engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Media Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Media Relations Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Medical </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Medical / Public Health Educator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Medical Laboratory </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Medical Practitioner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> medical sonographer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> medical transcriptionist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Mentor/Special Events intern </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Military </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> mktg </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Mover </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Multimedia Developer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> museum docent </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Network Services Engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> new realtor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> newspaper carrier </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Night Dispatch Supervisor  (it's just a </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Non-profit Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> nursing home </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> office </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Office Admin </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Office Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Office Services Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Online Media Buyer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Organic Grocery Store Cashier/shift lead </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> ouh </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Outdoor Recreation Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> owner - private practice physical therap </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> P-T College Faculty &amp; P-T Self-Employed </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Page Designer for a newspaper </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Parent Educator/Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Partner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> pathology </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> PCA for a quadrapilegic and a PCA for a </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Pharmaceutical Merchandiser </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> pharmacy tech. </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> photo profucer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Physical Science Technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> physician (internist) </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Physicist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Physiotherapst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> pjublic relations director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Plant Engineering Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Please specify title Manager for Regulat </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Post Grad Physician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Postdoctoral Researcher </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> pr and communications firm owner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> President Nongovernmental organization </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> president/CEO </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Private Equity Principal </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> pro poker player /   website owner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Probation Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Process Engineer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Procrastinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Produce Associate </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> producer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Product Field Test Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Production Operations Support Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Professional Organizer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program director at a non-profit organiz </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program Manager and Acting Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Program Specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Proofreader </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Proposal Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Psychiatrist in Private Practice </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Public Health </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> public relations </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Publishing </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Quality Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Quotations specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> real estate </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> real estate agent </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Real Estate Appraiser </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> real estate broker </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Real estate developer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> realtor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Reasearch assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Recreational Staff </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Regional Sales Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Registered Respiratory Therapist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> regulatory affairs </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research / GIS analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> research coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research intern </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research Scholar </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> research specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> research technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Research/Teaching Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Researcher - Physician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Residence Don </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> resident physician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Residential Services Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Respiratory Therapist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Restaurant operations manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> retired/adjunct </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> RN - Medical Sales </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Secretary </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> self employed </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Self employed Public Relations </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> self employeed </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Self-Employed / personal trainer / stren </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Self-employed Family Therapist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> self-employed translator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> selfemplyed renovator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> senior consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Senior Grant Officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Senior Human Resources Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Senior Policy Advisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> senior project manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Senior Records Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Service co-ordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Service Registrar/English Instructor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> set designer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> set lighting technician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Shipping/receiving/warehouse mgnt </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Social Media consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Social Policy Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Social Work Intern </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Speaker Author Consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Speaker/Actor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Special Projects Editor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> specialist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Speech and language Assistant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Sr. Drug Safety Associate </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Statistician </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Stay-at-home dad </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> steamship agent </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Studey </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> supervising program development speciali </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> supervisor shelderd workshop for handcap </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Surgeon </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Surgical Resident </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> System Analyst </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> system manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> tax consultant </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Tax Examiner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Tech Analyst/GIS </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Tech Support </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technical Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technical director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technical officer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technical support rep </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technical Trainer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technology (CTO) </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Technology Curriculum Developer Science </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> television director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Television Producer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Temp </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> temporary office </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Theater General Manager </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Tour Guide </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Town Clerk </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Town Planner </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> trader </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Traffic Reporter-Radio </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> trainee </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> training Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Training Coordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> treatment support co-ordinator </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> TV BROADCAST TECHNICIAN </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> TV News Executive Producer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> University Staff </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Urban Planner/Economic Development Plann </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Vetrans Representative </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> vice president </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Vice President / program office </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> vidoe </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> visual artist </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> VMD </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Volunteer Director </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> volunteer mental health worker </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> VP Scientific Affairs / pharmaceutical c </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> warehouse </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Warehouse Supervisor </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Web Communications </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Webmaster / Print Designer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> wig designer </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

##### Participants by Country


```r
kable(pcpts_per_country, format = "html") %>%
    kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> CntryOfRes </th>
   <th style="text-align:right;"> n </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> United States </td>
   <td style="text-align:right;"> 2785 </td>
  </tr>
<tr>
<td style="text-align:left;"> Canada </td>
   <td style="text-align:right;"> 243 </td>
  </tr>
<tr>
<td style="text-align:left;"> United Kingdom </td>
   <td style="text-align:right;"> 177 </td>
  </tr>
<tr>
<td style="text-align:left;"> NA </td>
   <td style="text-align:right;"> 160 </td>
  </tr>
<tr>
<td style="text-align:left;"> Australia </td>
   <td style="text-align:right;"> 99 </td>
  </tr>
<tr>
<td style="text-align:left;"> India </td>
   <td style="text-align:right;"> 78 </td>
  </tr>
<tr>
<td style="text-align:left;"> Italy </td>
   <td style="text-align:right;"> 62 </td>
  </tr>
<tr>
<td style="text-align:left;"> Germany </td>
   <td style="text-align:right;"> 36 </td>
  </tr>
<tr>
<td style="text-align:left;"> Brazil </td>
   <td style="text-align:right;"> 20 </td>
  </tr>
<tr>
<td style="text-align:left;"> Ireland </td>
   <td style="text-align:right;"> 19 </td>
  </tr>
<tr>
<td style="text-align:left;"> Israel </td>
   <td style="text-align:right;"> 19 </td>
  </tr>
<tr>
<td style="text-align:left;"> Netherlands </td>
   <td style="text-align:right;"> 18 </td>
  </tr>
<tr>
<td style="text-align:left;"> Sweden </td>
   <td style="text-align:right;"> 15 </td>
  </tr>
<tr>
<td style="text-align:left;"> Norway </td>
   <td style="text-align:right;"> 14 </td>
  </tr>
<tr>
<td style="text-align:left;"> France </td>
   <td style="text-align:right;"> 13 </td>
  </tr>
<tr>
<td style="text-align:left;"> Japan </td>
   <td style="text-align:right;"> 13 </td>
  </tr>
<tr>
<td style="text-align:left;"> Spain </td>
   <td style="text-align:right;"> 13 </td>
  </tr>
<tr>
<td style="text-align:left;"> China </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> Finland </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> Mexico </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> New Zealand </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> South Africa </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> Switzerland </td>
   <td style="text-align:right;"> 12 </td>
  </tr>
<tr>
<td style="text-align:left;"> Philippines </td>
   <td style="text-align:right;"> 11 </td>
  </tr>
<tr>
<td style="text-align:left;"> Greece </td>
   <td style="text-align:right;"> 10 </td>
  </tr>
<tr>
<td style="text-align:left;"> Belgium </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
<tr>
<td style="text-align:left;"> Denmark </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
<tr>
<td style="text-align:left;"> Turkey </td>
   <td style="text-align:right;"> 9 </td>
  </tr>
<tr>
<td style="text-align:left;"> Hong Kong </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> Portugal </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> Slovenia </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
<tr>
<td style="text-align:left;"> Poland </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Romania </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Afghanistan </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Chile </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Croatia </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Malaysia </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Singapore </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Algeria </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Argentina </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Austria </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Czech Republic </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Ecuador </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Puerto Rico </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Uruguay </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Albania </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Andorra </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bermuda </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bulgaria </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Columbia </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Ghana </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Iran </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Malta </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Peru </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Saudi Arabia </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> South Korea </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Thailand </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Ukraine </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Venezuela </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Yugoslavia </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Antigua </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bahamas </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Barbados </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Bolivia </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Botswana </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Brunei </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Cyprus </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dominican Republic </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Egypt </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> El Salvador </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Guam </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Guyana </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Hungary </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Iceland </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Jamaica </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Kazakhstan </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Kenya </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Lithuania </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Luxembourg </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Macao </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Macedonia </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Morocco </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Myanmar </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Nicaragua </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Pakistan </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Panama </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Qatar </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Russia </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Sri Lanka </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Taiwan </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
<tr>
<td style="text-align:left;"> Vietnam </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

##### Internal vs External Perception


```r
kable(matching_perception, format = "html") %>%
    kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> Self Labeled </th>
   <th style="text-align:left;"> Others would Label </th>
   <th style="text-align:right;"> Observations </th>
   <th style="text-align:right;"> Total Obs </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> No </td>
   <td style="text-align:left;"> No </td>
   <td style="text-align:right;"> 482 </td>
   <td style="text-align:right;"> 4036 </td>
  </tr>
<tr>
<td style="text-align:left;"> Yes </td>
   <td style="text-align:left;"> Yes </td>
   <td style="text-align:right;"> 2358 </td>
   <td style="text-align:right;"> 4036 </td>
  </tr>
</tbody>
</table>

# Deep Dive
***
