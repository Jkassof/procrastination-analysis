# Import tidy data and hdi_table
final_procras <- read_csv("./data/TidyProcrastination.csv")
hdi_table <- read_csv("./data/hdi_table.csv")

# Merge two data sets by Country, keep all records from the procrastination data 
all_data <- merge(x=final_procras,y=hdi_table, by="CntryOfRes", all.x = TRUE)

# Filter for only of-age (18+) participants as this study is not cleared for
# using data from minors
all_data <- filter(all_data, Age >= 18)

# Save filtered final data to /data directory for reference
write_csv(all_data,"./data/all_data.csv")