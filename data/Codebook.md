---
title: "Codebook - Procrastination Analysis"
output: 
  html_document:
    keep_md: true
    toc: true
    toc_float: 
      collapsed: false
    toc_depth: 3
    theme: flatly
    highlight: textmate
---



## Introduction

This data folder contains the following:

#### Data files

* all_data.csv - a data frame containing merged demographic data, procrastination data, and human development index (HDI) data, filtered to only include participants 18 years of age or older
* hdi_table.csv - a data frame containing the scraped HDI data
* occupation_counts.csv - a data frame containing the counts of occupations per survey participants
* participants_by_country.csv - a data frame containing the counts of participants per country
* Procrastination.csv - the raw procrastination data obtained from Qualtrics
* TidyProcrastination.csv - a tidied data frame of the procrastination data
* top15_aip_hdi.csv - a data frame containing HDI data and mean Adult Inventory of Procrastination scores for the 15 highest scoring nations
* top15_gp_hdi.csv - a data frame containing HDI data and mean General Procrastination scale scores for the 15 highest scoring nations 

#### Scripts

* q2-clean-procras-raw.R - an R script for ingesting the raw demographic and procrastination data (Procrastination.csv), tidying the data, and outputting the tidy data file (TidyProcrastination.csv)
* q3-hdi-wiki-scrape.R - an R script for scraping the HDI data from Wikipedia. 
    + Note that scores have been scraped only for nations whose scores were included in the latest report
* q3-merging-hdi-and-procrastination.R - an R script for merging the demographic and procrastination data (TidyProcrastination.csv) with the scraped HDI data (hdi_table.csv) and outputting the merged file (all_data.csv)

## **all_data.csv**

A collection of demographic information and Procrastination survey responses, merged with human development index (HDI) information from the particpant's country of residence.

* Type: Comma-separated value file
* Dimensions: 4036 observations X 67 variables

### Variable Information

#### Demographic Information

* CntryOfRes (character): The participant's country of residence
* Age (numeric): The participant's age 
* Gender (character): The gender the participant identifies as (Male or Female)
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

* HDI (numeric): HDI (numeric): The Human Development Index score (during the creation of this report the values are estimated in 2016 for the year 2015)
* hdi_group (character) : This variable uses standardized ranges to categorize a country's HDI in to groups of low, middle, high, or very-high. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

### Procrastination Variables (Instruments, Summary Statistics, and Identification Questions)

#### Decisional Procrastination Scale

DP1 through DP5 (numeric): The Decisional Procrastination Scale (Mann, 1982). Answer values have been recoded from the original likert scale - (Not true for me; Often untrue for me; Sometimes true/false for me; Often true for me; True for me) - to numeric (1-5).

* DP1: I waste a lot of time on trivial matters before getting to the final decision
* DP2: Even after I make a decision I delay acting on it
* DP3: I don't make decisions unless I really have to
* DP4: I delay making decisions until it's too late
* DP5: I put off making decisions
    
#### Adult Inventory of Procrastination

AIP1 through AIP15 (numeric): The Adult Inventory of Procrastination (McCown & Johnson, 1989). Answer values have been recoded from the original likert scale - (Strongly disagree; disagree; sometimes disagree/sometimes agree; agree; strongly agree) - to numeric (1-5).

* AIP1*: I pay my bills on time
* AIP2*: I am prompt and on time for most appointments
* AIP3*: I lay out my clothes the night before I have an appointment so I won't be late
* AIP4: I find myself running later than I would like to be
* AIP5: I don't get things done on time
* AIP6: If someone were teaching a course on how to get things done on time I would attend
* AIP7: My friends and family think I wait until the last minute
* AIP8*: I get important things done with time to spare
* AIP9: I am not very good at meeting deadlines
* AIP10: I find myself running out of time
* AIP11*: I schedule doctor's appointments when I am supposed to without delay
* AIP12*: I am more punctual than most people I know
* AIP13*: I do routine maintenance (e.g., changing the car's oil) on things I own as often as I should
* AIP14: When I have to be somewhere at a certain time my friends expect me to run a bit late
* AIP15: Putting things off until the last minute has cost me money in the past year
    
    *- Items are reverse-scored

#### General Procrastination scale

GP1 through GP20 (numeric): The General Procrastination scale (Lay, 1986). Answer values have been recoded from the original likert scale - (Extremely uncharacteristic; moderately uncharacteristic; neutral; moderately characteristic; extremely characteristic) - to numeric (1-5)

* GP1: I often find myself performing tasks that I had intended to do days before
* GP2: I often miss concerts, sporting events, or the like because I don’t get around to buying tickets on time
* GP3: When planning a party, I make the necessary arrangements well in advance
* GP4: When it is time to get up in the morning, I most often get right out of bed
* GP5: A letter may sit for days after I write it before mailing it
* GP6: I generally return phone calls promptly
* GP7: Even with jobs that require little else except sitting down and doing them, I find they seldom get done for days
* GP8: I usually make decisions as soon as possible
* GP9: I generally delay before starting on work I have to do
* GP10: When traveling, I usually have to rush in preparing to arrive at the airport or station at the appropriate time
* GP11: When preparing to go out, I am seldom caught having to do something at the last minute
* GP12: In preparing for some deadline, I often waste time by doing other things
* GP13: If a bill for a small amount comes, I pay it right away
* GP14: I usually return a “RSVP” request very shortly after receiving it
* GP15: I often have a task finished sooner than necessary
* GP16: I always seem to end up shopping for birthday or Christmas gifts at the last minute
* GP17: I usually buy even an essential item at the last minute
* GP18: I usually accomplish all the things I plan to do in a day
* GP19: I am continually saying "I'll do it tomorrow."
* GP20: I usually take care of all the tasks I have to do before I settle down and relax for the evening

#### Satisfaction with Life Scale

SWLS1 through SWLS5 (numeric): The Satisfaction with Life Scale (Diener et al., 1985). Answer values have been recoded from the original 7-point likert scale which assigned the following point values:


```r
library(knitr)
library(kableExtra)
Scale <- c("Strongly agree","Agree","Slightly agree","Neither agree nor disagree","Slightly disagree","Disagree","Strongly disagree")
Points <- c(7,6,5,4,3,2,1)
SWLS <- data.frame(Scale,Points)
kable(SWLS,"html",row.names=FALSE) %>%
  kable_styling(bootstrap_options = c("striped","condensed"), 
                full_width=F, position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> Scale </th>
   <th style="text-align:right;"> Points </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Strongly agree </td>
   <td style="text-align:right;"> 7 </td>
  </tr>
<tr>
<td style="text-align:left;"> Agree </td>
   <td style="text-align:right;"> 6 </td>
  </tr>
<tr>
<td style="text-align:left;"> Slightly agree </td>
   <td style="text-align:right;"> 5 </td>
  </tr>
<tr>
<td style="text-align:left;"> Neither agree nor disagree </td>
   <td style="text-align:right;"> 4 </td>
  </tr>
<tr>
<td style="text-align:left;"> Slightly disagree </td>
   <td style="text-align:right;"> 3 </td>
  </tr>
<tr>
<td style="text-align:left;"> Disagree </td>
   <td style="text-align:right;"> 2 </td>
  </tr>
<tr>
<td style="text-align:left;"> Strongly disagree </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table>

A participant's results were scored as follows:


```r
library(knitr)
library(kableExtra)
ResultsScale <- c("Extremely satisfied","Satisfied","Slightly satisfied","Neutral","Slightly dissatisfied","Dissatisfied","Extremely dissatisfied")
PointTotal <- c("31-35","26-30","21-25","20","15-19","10-14","5-9")
SWLSresults <- data.frame(ResultsScale,PointTotal)
kable(SWLSresults,"html",row.names=FALSE) %>%
  kable_styling(bootstrap_options = c("striped","condensed"), 
                full_width=F, position="left")
```

<table class="table table-striped table-condensed" style="width: auto !important; ">
<thead><tr>
<th style="text-align:left;"> ResultsScale </th>
   <th style="text-align:left;"> PointTotal </th>
  </tr></thead>
<tbody>
<tr>
<td style="text-align:left;"> Extremely satisfied </td>
   <td style="text-align:left;"> 31-35 </td>
  </tr>
<tr>
<td style="text-align:left;"> Satisfied </td>
   <td style="text-align:left;"> 26-30 </td>
  </tr>
<tr>
<td style="text-align:left;"> Slightly satisfied </td>
   <td style="text-align:left;"> 21-25 </td>
  </tr>
<tr>
<td style="text-align:left;"> Neutral </td>
   <td style="text-align:left;"> 20 </td>
  </tr>
<tr>
<td style="text-align:left;"> Slightly dissatisfied </td>
   <td style="text-align:left;"> 15-19 </td>
  </tr>
<tr>
<td style="text-align:left;"> Dissatisfied </td>
   <td style="text-align:left;"> 10-14 </td>
  </tr>
<tr>
<td style="text-align:left;"> Extremely dissatisfied </td>
   <td style="text-align:left;"> 5-9 </td>
  </tr>
</tbody>
</table>

These scores were adjusted to a five-point numeric scale (1-5) as in Kobau (2010). Please see the article referenced below for further information.

* SWLS1: In most ways my life is close to my ideal
* SWLS2: The conditions of my life are excellent
* SWLS3: I am satisfied with my life
* SWLS4: So far I have gotten the important things I want in life
* SWLS5: If I could live my life over, I would change almost nothing
    
### Summary Statistics

* DPMean (numeric): The participant's mean score across the Decisional Procrastination Scale
* AIPMean (numeric): The participant's mean score across the Adult Inventory of Procrastination
* GPMean (numeric): The participant's mean score across the General Procrastination scale
* SWLSMean (numeric): The participant's mean score across the Satisfaction with Life Scale

### Identification Questions

* SelfLabeled (numeric): A binary variable for whether or not the participant considers themselves to be a procrastinator
* OthersLabel (numeric): A binary variable for whether or not the participants thinks others consider themselves to be a procrastinator

## **hdi_table.csv**

* Type: Comma-separated value file
* Dimensions: 189 observations X 3 variables

A collection of Human Development Index data for 189 countries. The Human Development Index (HDI) is a statistic created and distributed by the United Nations. It is a composite statistic derived using indicators for education, life expectancy, and income per capita. This score can be viewed as the potential for human development and prosperity in a given country.

Variable Information

* CntryOfRes (character): The participant's country of residence
* HDI (numeric): The Human Development Index score (during the creation of this report the values are estimated in 2016 for the year 2015)
* hdi_group (character): This variable uses standardized ranges to categorize a country's HDI in to groups of low, middle, high, or very-high. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

## **occupation_counts.csv**

This data set contains the counts of occupations for the participants of this survey. Some of the values have been grouped in to more general categories, e.g. "ESL teacher" and "Art Teacher" have been generalized to "Teacher". This grouping reduced the number of unique responses from 676 to 512. Further refining is beyond the scope of the present analysis and was not determined to be critical to the research questions.

* Type: Comma-separated value file
* Dimensions: 512 observations X 2 variables

Variable Information

* Occupation (character): The participant's occupation
* n (numeric): The count of participants for each occupation

## **participants_by_country.csv**

This data set contains the countries of residence identified by the survey participants and the number of participants who reside therein.

* Type: Comma-separated value file
* Dimensions: 5 observations x 2 variables

Variable Information

* CntryOfRes (character): The participant's country of residence
* n (numeric): The count of participants for each country

## **Procrastination.csv**

Procrastination.csv are the raw demographic and procrastination data. Detailed information regarding each of the procrastination instruments have been omitted in this section, as it is present above. Please see the appropriate section in **all_data**.

* Type: Comma-separated value file
* Dimensions: 4264 observations X 61 variables

### Variable Information

#### Demographic Information

* Age (numeric): The participant's age 
* Gender (character): The gender the participant identifies as (Male or Female)
* Kids (character): A binary variable for whether or not the participant has children ('Yes Kids' or 'No Kids')
* Edu (character): The participant's education level (deg, dip, grade, high, lthigh, ltuni, ma, phd, or NA)
* Work Status (character): The participant's employment status (full-time, part-time, retired, student, unemployed, or NA)
* Annual Income (numeric): The participant's annual income in USD
* Current Occupation (character): The participant's occupation
* How long have you held this position?: Years
 (numeric): The length of time in years that the participant has held their current job
* How long have you held this position?: Months
 (numeric): The length of time in months that the participant has held their current job
* Commmunity size (character): The size of the participant's community (Large-City, Large-Town, Medium-Sized, Rural/Country, Small City, Small Town, Village, or NA)
* Country of residence (character): The participant's country of residence
* Marital Status (character): The participant's marital status (Divorced, Married, Separated, Single, Widowed, or NA)
* Number of sons (numeric): The number of the participant's sons
* Number of daughters (numeric) : The number of the participant's daughters

### Procrastination Variables (Instruments, Summary Statistics, and Identification Questions)

#### Decisional Procrastination Scale

DP1 through DP5 (numeric): The Decisional Procrastination Scale (Mann, 1982). Answer values have been recoded from the original likert scale - (Not true for me; Often untrue for me; Sometimes true/false for me; Often true for me; True for me) - to numeric (1-5).

* (DP 1) I waste a lot of time on trivial matters before getting to the final decisions
* (DP 2) Even after I make a decision I delay acting upon it
* (DP 3) I don’t make decisions unless I really have to
* (DP 4) I delay making decisions until it’s too late
* (DP 5) I put off making decisions until it’s too late

#### Adult Inventory of Procrastination

AIP1 through AIP15 (numeric): The Adult Inventory of Procrastination (McCown & Johnson, 1989). Answer values have been recoded from the original likert scale - (Strongly disagree; disagree; sometimes disagree/sometimes agree; agree; strongly agree) - to numeric (1-5).

* (AIP 1)I pay my bills on time
* (AIP 2)I am prompt and on time for most appointments
* (AIP 3)I lay out my clothes the night before I have an appointment so I won't be late
* (AIP 4)I find myself running later than I would like to be
* (AIP 5)I don't get things done on time
* (AIP 6)If someone were teaching a course on how to get things done on time I would attend
* (AIP 7)My friends and family think I wait until the last minute
* (AIP 8)I get important things done with time to spare
* (AIP 9)I am not very good at meeting deadlines
* (AIP 10)I find myself running out of time
* (AIP 11)I schedule doctor's appointments when I am supposed to without delay
* (AIP 12)I am more punctual than most people I know
* (AIP 13)I do routine maintenance (e.g., changing the car's oil) on things I own as often as I should
* (AIP 14)When I have to be somewhere at a certain time my friends expect me to run a bit late
* (AIP 15)Putting things off until the last minute has cost me money in the past year

#### General Procrastination scale

GP1 through GP20 (numeric): The General Procrastination scale (Lay, 1986). Answer values have been recoded from the original likert scale - (Extremely uncharacteristic; moderately uncharacteristic; neutral; moderately characteristic; extremely characteristic) - to numeric (1-5)

* (GP 1)I often find myself performing tasks that I had intended to do days before
* (GP 2) I often miss concerts, sporting events, or the like because I don’t get around to buying tickets on time
* (GP 3) When planning a party, I make the necessary arrangements well in advance
* (GP 4) When it is time to get up in the morning, I most often get right out of bed
* (GP 5) A letter may sit for days after I write it before mailing it possible
* (GP 6) I generally return phone calls promptly
* (GP 7) Even jobs that require little else except sitting down and doing them, I find that they seldom get done for days
* (GP 8) I usually make decisions as soon as possible
* (GP 9) I generally delay before starting on work I have to do
* (GP 10) When traveling, I usually have to rush in preparing to arrive at the airport or station at the appropriate time
* (GP 11) When preparing to go out, I am seldom caught having to do something at the last minute
* (GP 12) In preparation for some deadlines, I often waste time by doing other things
* (GP 13) If a bill for a small amount comes, I pay it right away
* (GP 14) I usually return a “RSVP” request very shortly after receiving it
* (GP 15) I often have a task finished sooner than necessary
* (GP 16) I always seem to end up shopping for birthday gifts at the last minute
* (GP 17) I usually buy even an essential item at the last minute
* (GP 18) I usually accomplish all the things I plan to do in a day
* (GP 19) I am continually saying “I’ll do it tomorrow”
* (GP 20) I usually take care of all the tasks I have to do before I settle down and relax for the evening

#### Satisfaction with Life Scale

SWLS1 through SWLS5 (numeric): The Satisfaction with Life Scale (Diener et al., 1985). Answer values have been recoded from the original 7-point likert scale to numeric (1-5).

* (SWLS 1) In most ways my life is close to my ideal
* (SWLS 2)The conditions of my life are excellent
* (SWLS 3) I am satisfied with my life.
* (SWLS 4) So far I have gotten the important things I want in life
* (SWLS 5) If I could live my life over, I would change almost nothing

### Identification Questions

* Do you consider yourself a procrastinator? (character): A binary variable for whether or not the participant considers themselves to be a procrastinator (yes or no)
* Do others consider you a procrastinator? (character): A binary variable for whether or not the participants thinks others consider themselves to be a procrastinator (yes or no)

## TidyProcrastination.csv

A tidied version of Procrastination.csv, as outputted from *q2-clean-procras-raw.R*. Information regarding each of the procrastination instruments have been abbreviated in this section, as it is present above.

* Type: Comma-separated value file
* Dimensions: 4264 observations X 65 variables

### Variable Information

#### Demographic Information

* CntryOfRes (character): The participant's country of residence
* Age (numeric): The participant's age 
* Gender (character): The gender the participant identifies as (Male or Female)
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

### Procrastination Variables (Instruments, Summary Statistics, and Identification Questions)

#### Decisional Procrastination Scale

DP1 through DP5 (numeric): The Decisional Procrastination Scale (Mann, 1982). Answer values have been recoded from the original likert scale - (Not true for me; Often untrue for me; Sometimes true/false for me; Often true for me; True for me) - to numeric (1-5).

* DP1: I waste a lot of time on trivial matters before getting to the final decision
* DP2: Even after I make a decision I delay acting on it
* DP3: I don't make decisions unless I really have to
* DP4: I delay making decisions until it's too late
* DP5: I put off making decisions
    
#### Adult Inventory of Procrastination

AIP1 through AIP15 (numeric): The Adult Inventory of Procrastination (McCown & Johnson, 1989). Answer values have been recoded from the original likert scale - (Strongly disagree; disagree; sometimes disagree/sometimes agree; agree; strongly agree) - to numeric (1-5).

* AIP1*: I pay my bills on time
* AIP2*: I am prompt and on time for most appointments
* AIP3*: I lay out my clothes the night before I have an appointment so I won't be late
* AIP4: I find myself running later than I would like to be
* AIP5: I don't get things done on time
* AIP6: If someone were teaching a course on how to get things done on time I would attend
* AIP7: My friends and family think I wait until the last minute
* AIP8*: I get important things done with time to spare
* AIP9: I am not very good at meeting deadlines
* AIP10: I find myself running out of time
* AIP11*: I schedule doctor's appointments when I am supposed to without delay
* AIP12*: I am more punctual than most people I know
* AIP13*: I do routine maintenance (e.g., changing the car's oil) on things I own as often as I should
* AIP14: When I have to be somewhere at a certain time my friends expect me to run a bit late
* AIP15: Putting things off until the last minute has cost me money in the past year
    
    *- Items are reverse-scored

#### General Procrastination scale

GP1 through GP20 (numeric): The General Procrastination scale (Lay, 1986). Answer values have been recoded from the original likert scale - (Extremely uncharacteristic; moderately uncharacteristic; neutral; moderately characteristic; extremely characteristic) - to numeric (1-5)

* GP1: I often find myself performing tasks that I had intended to do days before
* GP2: I often miss concerts, sporting events, or the like because I don’t get around to buying tickets on time
* GP3: When planning a party, I make the necessary arrangements well in advance
* GP4: When it is time to get up in the morning, I most often get right out of bed
* GP5: A letter may sit for days after I write it before mailing it
* GP6: I generally return phone calls promptly
* GP7: Even with jobs that require little else except sitting down and doing them, I find they seldom get done for days
* GP8: I usually make decisions as soon as possible
* GP9: I generally delay before starting on work I have to do
* GP10: When traveling, I usually have to rush in preparing to arrive at the airport or station at the appropriate time
* GP11: When preparing to go out, I am seldom caught having to do something at the last minute
* GP12: In preparing for some deadline, I often waste time by doing other things
* GP13: If a bill for a small amount comes, I pay it right away
* GP14: I usually return a “RSVP” request very shortly after receiving it
* GP15: I often have a task finished sooner than necessary
* GP16: I always seem to end up shopping for birthday or Christmas gifts at the last minute
* GP17: I usually buy even an essential item at the last minute
* GP18: I usually accomplish all the things I plan to do in a day
* GP19: I am continually saying "I'll do it tomorrow."
* GP20: I usually take care of all the tasks I have to do before I settle down and relax for the evening

#### Satisfaction with Life Scale

SWLS1 through SWLS5 (numeric): The Satisfaction with Life Scale (Diener et al., 1985). Answer values have been recoded from the original 7-point likert scale to numeric (1-5).

* SWLS1: In most ways my life is close to my ideal
* SWLS2: The conditions of my life are excellent
* SWLS3: I am satisfied with my life
* SWLS4: So far I have gotten the important things I want in life
* SWLS5: If I could live my life over, I would change almost nothing
    
### Summary Statistics

* DPMean (numeric): The participant's mean score across the Decisional Procrastination Scale
* AIPMean (numeric): The participant's mean score across the Adult Inventory of Procrastination
* GPMean (numeric): The participant's mean score across the General Procrastination scale
* SWLSMean (numeric): The participant's mean score across the Satisfaction with Life Scale

### Identification Questions

* SelfLabeled (numeric): A binary variable for whether or not the participant considers themselves to be a procrastinator
* OthersLabel (numeric): A binary variable for whether or not the participants thinks others consider themselves to be a procrastinator

## **top15_aip_hdi.csv**

* Type: Comma-separated value file
* Dimensions: 15 observations X 4 variables

### Variable information

* CntryOfRes (character): The country name. This variable was named to match *CntryOfRes* in the TidyProcrastination.csv file for merging
* CntryMeanAIP (numeric): The mean Adult Inventory of Procrastination score for all participants in the given country
* HDI (numeric): HDI (numeric): The Human Development Index score (during the creation of this report the values are estimated in 2016 for the year 2015)
* hdi_group (character) : This variable uses standardized ranges to categorize a country's HDI in to groups of low, middle, high, or very-high. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

## **top15_gp_hdi.csv**

* Type: Comma-separated value file
* Dimensions: 15 observations X 4 variables

### Variable information

* CntryOfRes (character): The country name. This variable was named to match *CntryOfRes* in the TidyProcrastination.csv file for merging
* CntryMeanGP (numeric): The mean General Procrastination scale score for all participants in the given country
* HDI (numeric): HDI (numeric): The Human Development Index score (during the creation of this report the values are estimated in 2016 for the year 2015)
* hdi_group (character) : This variable uses standardized ranges to categorize a country's HDI in to groups of low, middle, high, or very-high. See the `data/hdi-wiki-scrape.R` file for the range of HDI values each group represents.

## Scripts

For information regarding the scripts, please refer to the [README](https://github.com/Jkassof/procrastination-analysis) and/or [Write-up](http://htmlpreview.github.io/?https://github.com/Jkassof/procrastination-analysis/blob/master/write-up.html).

## References

Diener, E., Emmons, R. A., Larsen, R. J., & Griffin, S. (1985). The Satisfaction with Life Scale. Journal of Personality Assessment, 49, 71-75

Ferrari, J., Johnson, J. & McCown, W. (1995). *Procrastination and task avoidance : theory, research, and treatment.* New York: Plenum Press.

Kobau, R., Sniezek, J., Zack, M. M., Lucas, R. E., & Burns, A. (2010). Well‐being assessment: An evaluation of well‐being scales for public health and population estimates of well‐being among US adults. Applied Psychology: Health and Well-being, 2(3), 272-297.

Lay, C. (1986). *At last, my research article on procrastination.* Journal of Research in Personality, 20, 474-495. 

[List of Countries by Human Development Index](https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries)

Zeisler, L (2011). *Association Between Stress and Decisional Procrastination in Parents of Children With Down Syndrome During Their Developmental Transitions.* Seton Hall University Dissertations and Theses (ETDs). 1361.
