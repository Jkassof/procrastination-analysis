# Part 4A: Below we read the merged data from the previous step, then filter for
# participants 18 and older per client requirements
all_data <- read.csv("./data/all_data.csv",header=TRUE)
filt_data <- filter(all_data, Age >= 18)


# Part 4B: Create a vector of columns we want summary statistics for
summary_cols <- c("Age", "AnnualIncome", "HDI", "DPMean", "AIPMean", "GPMean", "SWLSMean")

# Part 4B: Select the designated columns above, map the summary function across
# each column, then map the tidy function from the {broom} package and return
# a data frame, last add a column with the variable names. This dataframe is
# displayed in the report
summary_list <- filt_data %>%
  select(summary_cols) %>%
  map(summary) %>%
  map_dfr(broom::tidy) %>%
  tibble::add_column(summary_cols, .before = 1)

# Part 4C: Get frequency counts of a few interesting variables. These tables
# will be displayed in the report
gender_freqs <- filt_data %>%
  count(Gender)  %>%
  arrange(desc(n))

workstatus_freqs <- filt_data %>%
  count(WorkStatus)  %>%
  arrange(desc(n))

occu_freqs <- filt_data %>%
  count(Occupation)  %>%
  arrange(desc(n))

# Part 4D: Get a frequency count by country of residence, this table will be
# displayed in the report.
pcpts_per_country <- filt_data %>%
  count(CntryOfRes)  %>%
  arrange(desc(n))

# Part 4E: Below we select out the two columns that represent self identifying
# and others identifying the participant as a procrastinator. We filter for
# complete cases (an answer for both questions) and for where the two answers
# match. Next we group by both columns and get a count for each combination of 
# the two columns. Last, we convert the binary integer answers to yes/no, set
# cleaner names, and add a column with total observation count for reference. 
# This dataframe will be displayed in the report.
matching_perception <- filt_data %>%
  select(SelfLabeled, OthersLabel) %>%
  filter(complete.cases(.) & SelfLabeled == OthersLabel) %>%
  group_by_all() %>%
  tally() %>%
  ungroup() %>%
  mutate(SelfLabeled = if_else(SelfLabeled==0, "No", "Yes"),
         OthersLabel = if_else(OthersLabel==0, "No", "Yes")) %>%
  set_names(c("Self Labeled", "Others would Label", "Observations")) %>%
  tibble::add_column("Total Obs" = rep(nrow(filt_data), 2))