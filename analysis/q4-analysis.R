# Part 4A: Below we read the merged data from the previous step, which was
# filtered before being saved in q3-merging-hdi-and-procrastination.R
all_data <- read_csv("./data/all_data.csv")

# Part 4B: Create a vector of columns we want summary statistics for
summary_cols <- c("Age", "AnnualIncome", "HDI", "DPMean", "AIPMean", "GPMean", "SWLSMean")

# Part 4B: Select the designated columns above, use the {skimr} package to get a tidy
# dataframe of summary statistics, drop unneeded columns, spread the data into a wide format,
# and lastly rename variables for eye-friendly printing
summary_list <- all_data %>%
  select(summary_cols) %>%
  skimr::skim() %>%
  select(-type, -level, -value) %>%
  tidyr::spread(stat, formatted) %>%
  select(Variable = var,
         Missing = missing,
         Complete = complete,
         Total = n,
         Mean = mean,
         `Standard Deviation` = sd,
         Minimum = min,
         `25th Percentile` = p25,
         Median = median,
         `75th Percentile` = p75,
         Maximum = max,
         Distribution = hist) %>%
  map_dfr(prettyNum, big.mark = ",")

# Part 4C: Get frequency counts of a few interesting variables. These tables
# will be displayed in the report
gender_freqs <- all_data %>%
  count(Gender)  %>%
  arrange(desc(n))

workstatus_freqs <- all_data %>%
  count(WorkStatus)  %>%
  arrange(desc(n))

occu_freqs <- all_data %>%
  count(Occupation)  %>%
  arrange(desc(n)) %>%
  rename(Occupation = Occupation,
         Participants = n)

readr::write_csv(occu_freqs, path = "./data/occupation_counts.csv")

# Part 4D: Get a frequency count by country of residence, this table will be
# displayed in the report.
pcpts_per_country <- all_data %>%
  count(CntryOfRes)  %>%
  arrange(desc(n)) %>%
  rename("Country of Residence" = CntryOfRes,
         Participants = n)

readr::write_csv(pcpts_per_country, path = "./data/participants_by_country.csv")

# Part 4E: Below we select out the two columns that represent self identifying
# and others identifying the participant as a procrastinator. We filter for
# complete cases (an answer for both questions) and for where the two answers
# match. Next we group by both columns and get a count for each combination of 
# the two columns. Last, we convert the binary integer answers to yes/no, set
# cleaner names, and add a column with total observation count for reference. 
# This dataframe will be displayed in the report.
matching_perception <- all_data %>%
  select(SelfLabeled, OthersLabel) %>%
  filter(complete.cases(.) & SelfLabeled == OthersLabel) %>%
  group_by_all() %>%
  tally() %>%
  ungroup() %>%
  mutate(SelfLabeled = if_else(SelfLabeled==0, "No", "Yes"),
         OthersLabel = if_else(OthersLabel==0, "No", "Yes")) %>%
  set_names(c("Self Labeled", "Others would Label", "Observations")) %>%
  tibble::add_column("Total Obs" = rep(nrow(all_data), 2))