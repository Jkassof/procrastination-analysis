library(ggplot2)
library(dplyr)
library(knitr)
library(kableExtra)

# reading in data

all_data <- read.csv("./data/all_data.csv",header=TRUE)
hdi_table <- read.csv("./data/hdi_table.csv",header=TRUE)

# obtaining top 15 average AIP scores
top15_aip <- all_data %>%
  filter(!is.na(CntryOfRes)) %>%
  select(CntryOfRes,AIPMean) %>%
  group_by(CntryOfRes) %>%
  summarise(CntryMeanAIP = mean(AIPMean)) %>%
  top_n(15) %>%
  arrange(order(desc(CntryMeanAIP)))

top15_aip_hdi <- merge(top15_aip,hdi_table,by="CntryOfRes")

ggplot(top15_aip_hdi,aes(x=CntryOfRes, y=CntryMeanAIP,fill=hdi_group))+
  geom_bar(aes(reorder(CntryOfRes,CntryMeanAIP)), stat="identity")+
  ggtitle("Top 15 Most Procrastinating Nations (By Average AIP Score)")+
  xlab("Country")+ylab("Average AIP Score")+
  scale_fill_brewer(palette="Dark2")+
  coord_flip()

top15_gp <- all_data %>%
  filter(!is.na(CntryOfRes)) %>%
  select(CntryOfRes,GPMean) %>%
  group_by(CntryOfRes) %>%
  summarise(CntryMeanGP = mean(GPMean)) %>%
  top_n(15) %>%
  arrange(order(desc(CntryMeanGP)))

top15_gp_hdi <- merge(top15_gp,hdi_table,by="CntryOfRes")

ggplot(top15_gp_hdi,aes(x=CntryOfRes, y=CntryMeanGP,fill=hdi_group))+
  geom_bar(aes(reorder(CntryOfRes,CntryMeanGP)), stat="identity")+
  ggtitle("Top 15 Most Procrastinating Nations (By Average GP Score)")+
  xlab("Country")+ylab("Average GP Score")+
  scale_fill_brewer(palette="Accent")+
  coord_flip()

# which countries are in the top 15 across both tests
top_procrastinators <- top15_aip %>%
  inner_join(top15_gp) %>%
  arrange(order(CntryOfRes))

knitr::kable(top_procrastinators,"html",row.names=FALSE) %>%
  kableExtra::kable_styling(bootstrap_options = c("striped","condensed"), 
                            full_width=F, 
                            position="left")

# Is there a relationship between age and income?

ggplot(data = all_data, aes(x=AnnualIncome, y=Age, color = Gender))+
  geom_point(size=2)+
  xlab("Annual Income in USD")+ylab("Age In Years")+
  ggtitle("Examining Relationship Between Age and Income")

paste("There is no apparent relationship between Age and Income.")

# Is there a relationship between life satisfaction (SWLS) and HDI?

ggplot(data = all_data, aes(x=HDI, y=SWLSMean, color = Gender))+
  geom_point(size=2)+
  xlab("Human Development Index")+ylab("Mean Satisfaction With Life Score")+
  ggtitle("Examining Relationship Between HDI and Satisfaction With Life")

# Sure does not look to be a linear relationship at all.

cor_results <- cor.test(all_data$HDI,all_data$SWLSMean)

paste("With an estimated R-squared of ",round(cor_results$estimate,2),", we confirm that no linear relationship exists between human development index and mean satisfaction-with-life score.",sep="")

# Examining relationship between SWLS and HDI category via barplot

ggplot(all_data,aes(x=hdi_group,y=SWLSMean,fill=hdi_group))+
  geom_bar(aes(reorder(SWLSMean,hdi_group)), stat="identity")+
  ggtitle("Satisfaction With Life Score by Human Development Index Category")+
  xlab("Mean Satisfaction With Life Score")+ylab("Number of People")+
  scale_fill_brewer(palette="Dark2")