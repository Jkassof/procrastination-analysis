suppressPackageStartupMessages({
library(ggplot2)
library(dplyr)
library(readr)
})

# reading in data

all_data <- read_csv("./data/all_data.csv")
hdi_table <- read_csv("./data/hdi_table.csv")

# Part 5b: obtaining top 15 average AIP scores.
# This plot will be displayed in the report.
top15_aip <- all_data %>%
  filter(!is.na(CntryOfRes)) %>%
  select(CntryOfRes,AIPMean) %>%
  group_by(CntryOfRes) %>%
  summarise(CntryMeanAIP = mean(AIPMean)) %>%
  top_n(15) %>%
  arrange(order(desc(CntryMeanAIP)))

top15_aip_hdi <- top15_aip %>%
  select(CntryOfRes,CntryMeanAIP) %>%
  inner_join(hdi_table) %>%
  select(-HDI)

# Part 5c: obtaining top 15 average GP scores.
# This plot will be displayed in the report.

top15_gp <- all_data %>%
  filter(!is.na(CntryOfRes)) %>%
  select(CntryOfRes,GPMean) %>%
  group_by(CntryOfRes) %>%
  summarise(CntryMeanGP = mean(GPMean)) %>%
  top_n(15) %>%
  arrange(order(desc(CntryMeanGP)))

top15_gp_hdi <- top15_gp %>%
  select(CntryOfRes,CntryMeanGP) %>%
  inner_join(hdi_table) %>%
  select(-HDI)

# Part 5c: How many countries are in the top 15 across both tests?
# Which countries are in the top 15 across both tests?
# This table will be included in the report.
top_procrastinators <- top15_aip_hdi %>%
  select(CntryOfRes,CntryMeanAIP,hdi_group) %>%
  inner_join(top15_gp_hdi) %>%
  arrange(CntryOfRes)

top_procrastinators <- top_procrastinators[,c(1,2,4,3)]

# Melting top procrastinators for side-by-side comparison of GP and AIP scores.
# This plot will be included in the report.
top_procrastinators.long <- reshape2::melt(top_procrastinators)
top_procrastinators.long <- top_procrastinators.long %>% arrange(order(desc(value)))

# Stacked bar chart of national mean scores (AIP and GP)
ggplot(top_procrastinators.long,aes(x=CntryOfRes, y=value,fill=factor(variable)))+
  geom_bar(aes(reorder(CntryOfRes,value)), stat="identity", position="dodge")+
  ggtitle("Top 8 Nations With Highest Mean AIP and GP Scores)")+
  xlab("Country")+ylab("Mean Score")+
  scale_fill_brewer(palette="Accent",name="Mean Scores",labels=c("AIP","GP"))+
  coord_flip()+
  geom_bar_interactive(stat="identity",position="dodge")


# Part 5d: Run linear model to check relationship between AnnualIncome and age.
# The plot will be included in the report.

inc_vs_age.mod <- lm(AnnualIncome ~ Age, data = all_data)

cor_results <- cor.test(all_data$HDI,all_data$SWLSMean)

paste("With an estimated R-squared of ",round(cor_results$estimate,2),", we confirm that no linear relationship exists between human development index and mean satisfaction-with-life score.",sep="")

# Part 5e: Examining relationshpip between SWLS and HDI - scatterplot in report.
# Examining relationship between SWLS and HDI category via barplot

ggplot(all_data,aes(x=hdi_group,y=SWLSMean,fill=hdi_group))+
  geom_bar(aes(reorder(SWLSMean,hdi_group)), stat="identity")+
  ggtitle("Satisfaction With Life Score by Human Development Index Category")+
  xlab("Mean Satisfaction With Life Score")+ylab("Number of People")+
  scale_fill_brewer(palette="Dark2")

# No apparent relationship between HDI category and SWLS
# Not surprising since ~91 of this population has an HDI category of 'Very High'
# The table will be included in the report.

cat_count <- all_data %>%
  select(hdi_group) %>%
  group_by(hdi_group) %>%
  count() %>%
  summarise(percentage = (n/nrow(all_data)) * 100) %>%
  arrange(order(desc(percentage)))

