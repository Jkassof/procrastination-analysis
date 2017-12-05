suppressPackageStartupMessages({
library(ggplot2)
library(dplyr)
library(knitr)
library(kableExtra)
library(highcharter)
library(ggiraph)
})

# reading in data

all_data <- read_csv("./data/all_data.csv")
hdi_table <- read_csv("./data/hdi_table.csv")

# obtaining top 15 average AIP scores
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

# which countries are in the top 15 across both tests
top_procrastinators <- top15_aip_hdi %>%
  select(CntryOfRes,CntryMeanAIP,hdi_group) %>%
  inner_join(top15_gp_hdi) %>%
  arrange(CntryOfRes)


# Run linear model to check relationship between AnnualIncome and age

inc_vs_age.mod <- lm(AnnualIncome ~ Age, data = all_data)


top_procrastinators.long <- reshape2::melt(top_procrastinators)

top_procrastinators.long <- top_procrastinators.long %>% arrange(order(desc(value)))

# interactive plot with tooltips of national mean score
tooltip <- 
  ggplot(top_procrastinators.long,aes(x=CntryOfRes, y=value,fill=factor(variable),tooltip=value))+
  geom_bar(aes(reorder(CntryOfRes,value)), stat="identity", position="dodge")+
  ggtitle("Top 15 Most Procrastinating Nations (By Average Score)")+
  xlab("Country")+ylab("Average Score")+
  scale_fill_brewer(palette="Accent",name="Mean Scores",labels=c("AIP","GP"))+
  coord_flip()+
  geom_bar_interactive(stat="identity",position="dodge")
ggiraph(code= print(tooltip),width=1)

# table output
knitr::kable(top_procrastinators,"html",row.names=FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")

cor_results <- cor.test(all_data$HDI,all_data$SWLSMean)

paste("With an estimated R-squared of ",round(cor_results$estimate,2),", we confirm that no linear relationship exists between human development index and mean satisfaction-with-life score.",sep="")

# Examining relationship between SWLS and HDI category via barplot

ggplot(all_data,aes(x=hdi_group,y=SWLSMean,fill=hdi_group))+
  geom_bar(aes(reorder(SWLSMean,hdi_group)), stat="identity")+
  ggtitle("Satisfaction With Life Score by Human Development Index Category")+
  xlab("Mean Satisfaction With Life Score")+ylab("Number of People")+
  scale_fill_brewer(palette="Dark2")

# No apparent relationship between HDI category and SWLS
# Not surprising since ~87% of this population has an HDI category of 'Very High'

cat_count <- all_data %>%
  select(hdi_group) %>%
  group_by(hdi_group) %>%
  count() %>%
  summarise(percentage = n/nrow(all_data)) %>%
  arrange(order(desc(percentage)))

cat_count


