filt_data <- filter(all_data, Age >= 18)
summary_cols <- c("Age", "AnnualIncome", "HDI", "DPMean", "AIPMean", "GPMean", "SWLSMean")

summary_list <- filt_data %>%
  select(summary_cols) %>%
  map(summary) %>%
  map_dfr(broom::tidy) %>%
  tibble::add_column(summary_cols, .before = 1)
