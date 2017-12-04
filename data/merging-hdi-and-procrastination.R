# Importing tidy data and hdi_table
final_procras <- read.csv("./data/TidyProcrastination.csv",header=TRUE)
hdi_table <- read.csv("./data/hdi_table.csv",header=TRUE)

# Merging Data

all_data <- merge(x=final_procras,y=hdi_table, by="CntryOfRes")
write.csv(all_data,"./data/all_data.csv",row.names=FALSE)