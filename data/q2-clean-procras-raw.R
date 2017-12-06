# Data Tidying for Procrastination Data
suppressPackageStartupMessages({
library(dplyr)
library(stringr)
library(readr)
library(tidyr)
})
#2a - Importing data set and outputting number of rows and columns

Procrastination <- read_csv("./data/Procrastination.csv", col_names = FALSE, skip=1)
procrastination_row <- nrow(Procrastination)
procrastination_col <- ncol(Procrastination)
procrastination_dims <- data.frame(procrastination_row,procrastination_col)
names(procrastination_dims) <- c("Number of Rows","Number of Columns")

# 2b Renaming columns

clean_names <-   c('Age', 'Gender', 'HasKids','EduLvl', "WorkStatus", "AnnualIncome", "Occupation", 'YrsJobHeld', 'MosJobHeld',
                   'CommunitySz','CntryOfRes','MaritalStat','NumSons', 'NumDaughters','DP1',
                   'DP2','DP3','DP4','DP5','AIP1','AIP2','AIP3','AIP4','AIP5','AIP6','AIP7',
                   'AIP8','AIP9','AIP10','AIP11','AIP12','AIP13','AIP14','AIP15','GP1','GP2',
                   'GP3','GP4','GP5','GP6','GP7','GP8','GP9','GP10','GP11','GP12','GP13','GP14',
                   'GP15','GP16','GP17','GP18','GP19','GP20','SWLS1','SWLS2','SWLS3','SWLS4',
                   'SWLS5','SelfLabeled','OthersLabel')
Procrastination <- setNames(Procrastination, clean_names)


# 2c

procras <- Procrastination %>%
  mutate(
    # Convert HasKids column from string to simple boolean integer
    HasKids = if_else(HasKids == "Yes Kids", 1, 0),
    # If EduLvl is blank, convert to proper NA, otherwise leave as-is
    EduLvl = if_else(EduLvl == "", NA_character_, EduLvl),
    # If WorkStatus is blank or 0, conver to proper NA, otherwise leave as-is
    WorkStatus = if_else(
      WorkStatus %in% c("", 0),
      NA_character_,
      WorkStatus
    ),
    # Convert bad values to NA's, consolidate various common jobs by replacing
    Occupation = case_when(
      Occupation %in% c("", "0", "abc", "please specify") ~ NA_character_,
      str_detect(tolower(Occupation), "teacher|professor|faculty") ~ "Education",
      str_detect(tolower(Occupation), "writ") ~ "Writer",
      str_detect(tolower(Occupation), "account") ~ "Accountant",
      str_detect(tolower(Occupation), "attorney|counsel") ~ "Attorney",
      str_detect(tolower(Occupation), "student") ~ "Student",
      str_detect(tolower(Occupation), "^sales") ~ "Sales",
      str_detect(tolower(Occupation), "^doctor|nurse|clinic") ~ "Healthcare",
      str_detect(tolower(Occupation), "^artist") ~ "Artist",
      str_detect(tolower(Occupation), "systems|programmer|software|^it") ~ "Software & IT",
      str_detect(tolower(Occupation), "ologist|scientist") ~ "Science",
      TRUE ~ Occupation
    ),
    # If YrsJobHeld absurdldy large, convert to NA, otherwise round to whole number
    YrsJobHeld = if_else(YrsJobHeld > 100, NA_real_, round(YrsJobHeld)),
    # Convert bad values to NAs
    CntryOfRes = if_else(CntryOfRes == "0", NA_character_, CntryOfRes),
    # Convert bad values to NAs, leave rest as is
    CommunitySz = if_else(
      str_detect(CommunitySz, "[:digit:]"), 
      NA_character_, 
      CommunitySz),
    # Replace bad values with NA, otherwise leave as-is
    MaritalStat = if_else(
      MaritalStat %in% c("0", ""),
      NA_character_,
      MaritalStat
    ),
    # Convert character values to simple boolean integers
    SelfLabeled = case_when(
      tolower(SelfLabeled) == "yes" ~ 1,
      tolower(SelfLabeled) == "no" ~ 0,
      TRUE ~ NA_real_
    ),
    # Convert character values to simple boolean integers
    OthersLabel = case_when(
      tolower(OthersLabel) == "yes" ~ 1,
      tolower(OthersLabel) == "no" ~ 0,
      TRUE ~ NA_real_
    ),
    NumSons = case_when(
      NumSons == "Male" ~ 1,
      NumSons == "Female" ~ 0,
      TRUE ~ as.double(NumSons)
    )
  )

# Some other cleanup
procras$Occupation[which(str_detect(tolower(procras$Occupation),"^(?=.*admin)(?=.*assist)"))] <- "Administrative Assistant"
procras$CntryOfRes <- gsub(x=procras$CntryOfRes,pattern="Isreal",replacement="Israel")
procras$AnnualIncome <- as.numeric(procras$AnnualIncome)

# 2d Correcting column data types


# 2e Creating means columns for each test

# Select out columns that begin with DP, get rounded rowMeans for all rows,
# we'll do the same thing for the other 3 Question types, the column-bind
# everything together
dpmeans <- procras %>%
  select(starts_with("DP")) %>%
  transmute(DPMean = round(rowMeans(.), 2))

aipmeans <- procras %>%
  select(starts_with("AIP")) %>%
  transmute(AIPMean = round(rowMeans(.), 2))

gpmeans <- procras %>%
  select(starts_with("GP")) %>%
  transmute(GPMean = round(rowMeans(.), 2))

swlsmeans <- procras %>%
  select(starts_with("SWLS")) %>%
  transmute(SWLSMean = round(rowMeans(.), 2))

final_procras <- bind_cols(procras, dpmeans, aipmeans, gpmeans, swlsmeans)

write_csv(final_procras,"./data/TidyProcrastination.csv")