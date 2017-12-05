---
title: "Codebook"
output: 
  html_document:
    keep_md: true
    toc: true
    toc_float: true
    theme: flatly
    highlight: textmate
---



# Codebook - Procrastination Analysis
***

## Introduction

This data folder contains the following:

#### Data files

* all_data.csv - a data frame containing merged demographic data, procrastination data, and human development index (HDI) data.
* hdi_table.csv - a data frame containing the scraped HDI data.
* occupation_counts.csv - a data frame containing the counts of occupations per survey participants
* participants_by_country.csv - a data frame containing the counts of participants per country
* Procrastination.csv - the raw procrastination data obtained from Qualtrics
* TidyProcrastination.csv - a tidied data frame of the procrastination data

#### Scripts

* q2-clean-procras-raw.R - an R script for ingesting the raw demographic and procrastination data (Procrastination.csv), tidying the data, and outputting the tidy data file (TidyProcrastination.csv)
* q3-hdi-wiki-scrape.R - an R script for scraping the HDI data from Wikipedia.
* q3-merging-hdi-and-procrastination.R - an R script for merging the demographic and procrastination data (TidyProcrastination.csv) with the scraped HDI data (hdi_table.csv) and outputting the merged file (all_data.csv)

## **all_data.csv**

A collection of demographic information and Procrastination survey responses, merged with human development index (HDI) information from the particpant's country of residence.

* Type: Comma-separated value file
* Dimensions: 4036 observations X 67 variables

Variable Information:

* CntryOfRes (character): The participant's country of residence
* Age (numeric): The participant's age 
* Gender (character): The participant's gender
* HasKids (numeric): A binary variable for whether or not the participant has children
* EduLvl (character): The participant's education level (deg, dip, grade, high, lthigh, ltuni, ma, phd, or NA)
* WorkStatus (character): The participant's employment status (full-time, part-time, retired, student, unemployed, or NA)
* AnnualIncome (numeric): The participant's annual income in USD
* Occupation (character): The participant's occupation
* YrsJobHeld (numeric): The length of time in years that the participant has held their current job
* MosJobHeld (numeric): The length of time in months that the participant has held their current job
* CommmunitySz (character): The size of the participant's community (Large-City, Large-Town, Medium-Sized, Rural/Country, Small City, Small Town, Village, or NA)
* MaritalStat (character): The participant's marital status (Divorced, Married, Separated, Single, Widowed, or NA)
* NumSons (numeric): The number of the participant's sons
* NumDaughters (numeric) : The number of the participant's daughters
* DP1 through DP5 (numeric): The Decisional Procrastination Scale (Mann, 1982)
* AIP1 through AIP15 (numeric): The Adult Inventory of Procrastination (McCown & Johnson, 1989)
* GP1 through GP20 (numeric): The General Procrastination scale (Lay, 1986)
* SWLS1 through SWLS5 (numeric): The Satisfaction with Life Scale (Diener et al., 1985)
* SelfLabeled (numeric): A binary variable for whether or not the participant considers themselves to be a procrastinator
* OthersLabel (numeric): A binary variable for whether or not the participants thinks others consider themselves to be a procrastinator
* DPMean (numeric): The participant's mean score across the Decisional Procrastination Scale
* AIPMean (numeric): The participant's mean score across the Adult Inventory of Procrastination
* GPMean (numeric): The participant's mean score across the General Procrastination scale
* SWLSMean (numeric): The participant's mean score across the Satisfaction with Life Scale
* HDI (numeric): HDI (numeric): The Human Development Index score (during the creation of this report the values are estimated in 2016 for the year 2015)
* hdi_group (character) : This variable uses standardized ranges to categorize a country's HDI in to groups of low, middle, high, or very-high. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

## **hdi_table.csv**

* Type: Comma-separated value file
* Dimensions: 189 observations X 3 variables

A collection of Human Development Index data for 189 countries. The Human Development Index (HDI) is a statistic created and distributed by the United Nations. It is a composite statistic derived using indicators for education, life expectancy, and income per capita. This score can be viewed as the potential for human development and prosperity in a given country.

Variable Information:

* CntryOfRes (character): The participant's country of residence
* HDI (numeric): The Human Development Index score (during the creation of this report the values are estimated in 2016 for the year 2015)
* hdi_group (character): This variable uses standardized ranges to categorize a country's HDI in to groups of low, middle, high, or very-high. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

## **occupation_counts.csv**

This data set contains the counts of occupations for the participants of this survey. Some of the values have been grouped in to more general categories, e.g. "ESL teacher" and "Art Teacher" have been generalized to "Teacher". This grouping reduced the number of unique responses from 676 to 512. Further refining is beyond the scope of the present analysis and was not determined to be critical to the research questions.

* Type: Comma-separated value file
* Dimensions: 512 observations X 2 variables

Variable Information:

* Occupation (character): The participant's occupation
* n (numeric): The count of participants for each occupation

## **participants_by_country.csv**

This data set contains the countries of residence identified by the survey participants and the number of participants who reside therein.

* Type: Comma-separated value file
* Dimensions: 91 observations x 2 variables

Variable Information:

* CntryOfRes (character): The participant's country of residence
* n (numeric): The count of participants for each country

## Scripts

For information regarding the scripts, please refer to the [README](https://raw.githubusercontent.com/Jkassof/procrastination-analysis/master/README.md) and/or [Write-up](https://raw.githubusercontent.com/Jkassof/procrastination-analysis/master/write-up.Rmd).
