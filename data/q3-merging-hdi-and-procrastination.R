# Importing tidy data and hdi_table
final_procras <- read_csv("./data/TidyProcrastination.csv")
hdi_table <- read_csv("./data/hdi_table.csv")

# Merging Data

all_data <- merge(x=final_procras,y=hdi_table, by="CntryOfRes", all.x = TRUE)

filt_data <- filter(all_data, Age >= 18)

write_csv(filt_data,"./data/all_data.csv")