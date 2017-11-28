library(rvest)
library(dplyr)
library(purrr)

# Read the content of the url of the wiki page and assign it to a variable
site <- read_html("https://en.wikipedia.org/wiki/List_of_countries_by_Human_Development_Index#Complete_list_of_countries")

# Use rvest functions to grab the .wikitable css-class tags, and turn it into a
# list of data frames
tmp_all_tbls <- site %>%
  html_nodes(".wikitable") %>%
  html_table(fill=TRUE)

# After inspecting the R objects output from rvest scraping, the below function
# was written to clean up each table from wikipedia
cleaner_fun <- function(tbl) {
  tbl %>%
    set_names(nm = c("rank", "rank_delta", "country", "hdi", "hdi_delta_1yr")) %>%
    select(country, hdi) %>%
    slice(-1)
}

# Below the {purrr} function map_dfr is used to apply the cleaner_fun to the
# first 8 raw scraped tables, and row-bind the outputs into a single dataframe.
# After that we create an hdi_group column which uses HDI groupings introduced
# 2014
hdi_clean <- tmp_all_tbls[1:8] %>%
  map_dfr(cleaner_fun) %>%
  mutate_at("hdi", as.numeric) %>%
  mutate(hdi_group = case_when(
    hdi >= 0.8 ~ "very high",
    hdi >= 0.7 & hdi <= .799 ~ "high",
    hdi >= 0.55 & hdi <= 0.699 ~ "medium",
    hdi < 0.55 ~ "low"
  ))

# Finally write the data to a csv file in the data directory
write.csv(hdi_clean, file = "data/hdi_table.csv", row.names = FALSE)
