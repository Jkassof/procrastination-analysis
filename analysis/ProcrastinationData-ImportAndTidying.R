# Data Tidying for Procrastination Data

library(knitr)
library(kableExtra)
library(dplyr)
library(stringr)
library(readr)

#2a - Importing data set and outputting number of rows and columns

Procrastination <- read_csv("C:/users/jeffw/downloads/MSDS/6306/Case Study 2/Procrastination.csv")
# I could set check.names=FALSE to not force correct names with the periods
procrastination_row <- nrow(Procrastination)
procrastination_col <- ncol(Procrastination)
procrastination_str <- data.frame(procrastination_row,procrastination_col)
names(procrastination_str) <- c("Number Of Rows","Number Of Columns")
#kable(procrastination_str,"html",row.names=FALSE) %>%
#  kable_styling(bootstrap_options = c("striped","condensed"), full_width=F, position="left")

#2b
# Initial column name cleanup
#names(Procrastination) <- gsub(x=names(Procrastination),pattern="â",replacement="") # removes weird apostrophe conversion
#names(Procrastination) <- gsub(x=names(Procrastination),pattern="æ",replacement="") # removes weird apostrophe conversion
#names(Procrastination) <- gsub(x=names(Procrastination),pattern="o",replacement="") # removes weird apostrophe conversion
#names(Procrastination) <- gsub(x=names(Procrastination),pattern="\\.",replacement=" ")
#names(Procrastination) <- gsub(x=names(Procrastination),pattern="ï",replacement=" ")
# replaces the periods from name.check with spaces
#names(Procrastination) <- gsub("(?<=\\b)([a-z])", "\\U\\1", tolower(names(Procrastination)), perl=TRUE) # capitalizes each word
#names(Procrastination) <- gsub(x=names(Procrastination),pattern=" ",replacement="") # collapses the spaces

# Renaming columns
Procrastination <- Procrastination %>%
  rename(EduLvl = Edu,
         HasKids = Kids,
         WorkStatus = `Work Status`,
         AnnualIncome = `Annual Income`,
         Occupation = `Current Occupation`,
         YrsJobHeld = `How long have you held this position?: Years`,
         MosJobHeld = `How long have you held this position?: Months`,
         CommunitySz = `Community size`,
         CntryOfRes = `Country of residence`,
         MaritalStat = `Marital Status`,
         NumSons = `Number of sons`,
         NumDaughters = `Number of daughters`,
         DP1 = `(DP 1) I waste a lot of time on trivial matters before getting to the final decisions`,
         DP2 = `(DP 2) Even after I make a decision I delay acting upon it`,
         DP3 = `(DP 3) I don't make decisions unless I really have to`,
         DP4 = `(DP 4) I delay making decisions until it's too late`,
         DP5 = `(DP 5) I put off making decisions until it's too late`,
         AIP1 = `(AIP 1) I pay my bills on time`,
         AIP2 = `(AIP 2)I am prompt and on time for most appointments.`,
         AIP3 = `(AIP 3)I lay out my clothes the night before I have an important appointment, so I won't be late`,
         AIP4 = `(AIP 4) I find myself running later than I would like to be`,
         AIP5 = `(AIP 5) I don't get things done on time`,
         AIP6 = `(AIP 6) If someone were teaching a course on how to get things done on time, I would attend`,
         AIP7 = `(AIP 7) My friends and family think I wait until the last minute.`,
         AIP8 = `(AIP 8) I get important things done with time to spare`,
         AIP9 = `(AIP 9) I am not very good at meeting deadlines`,
         AIP10 = `(AIP 10) I find myself running out of time.`,
         AIP11 = `(AIP 11) I schedule doctor's appointments when I am supposed to without delay`,
         AIP12 = `(AIP 12) I am more punctual than most people I know`,
         AIP13 = `(AIP 13) I do routine maintenance (e.g., changing the car oil) on things I own as often as I should`,
         AIP14 = `(AIP 14)When I have to be somewhere at a certain time my friends expect me to run a bit late`,
         AIP15 = `(AIP 15)Putting things off till the last minute has cost me money in the past`,
         GP1 = `(GP 1)I often find myself performing tasks that I had intended to do days before`,
         GP2 = `(GP2) I often miss concerts, sporting events, or the like because I don't get around to buying tickets on time`,
         GP3 = `(GP 3) When planning a party, I make the necessary arrangements well in advance`,
         GP4 = `(GP 4) When it is time to get up in the morning, I most often get right out of bed`,
         GP5 = `(GP 5) A letter may sit for days after I write it before mailing it possible`,
         GP6 = `(GP 6) I generally return phone calls promptly`,
         GP7 = `(GP 7) Even jobs that require little else except sitting down and doing them, I find that they seldom get done for days`,
         GP8 = `(GP 8) I usually make decisions as soon as possible`,
         GP9 = `(GP 9) I generally delay before starting on work I have to do`,
         GP10 = `(GP 10) When traveling, I usually have to rush in preparing to arrive at the airport or station at the appropriate time`,
         GP11 = `(GP 11) When preparing to go out, I am seldom caught having to do something at the last minute`,
         GP12 = `(GP 12) In preparation for some deadlines, I often waste time by doing other things`,
         GP13 = `(GP 13) If a bill for a small amount comes, I pay it right away`,
         GP14 = `(GP 14) I usually return a "RSVP" request very shortly after receiving it`,
         GP15 = `(GP 15) I often have a task finished sooner than necessary`,
         GP16 = `(GP 16) I always seem to end up shopping for birthday gifts at the last minute`,
         GP17 = `(GP 17) I usually buy even an essential item at the last minute`,
         GP18 = `(GP 18) I usually accomplish all the things I plan to do in a day`,
         GP19 = `(GP 19) I am continually saying "I'll do it tomorrow"`,
         GP20 = `(GP 20) I usually take care of all the tasks I have to do before I settle down and relax for the evening`,
         SWLS1 = `(SWLS 1) In most ways my life is close to my ideal`,
         SWLS2 = `(SWLS 2)The conditions of my life are excellent`,
         SWLS3 = `(SWLS 3) I am satisfied with my life.`,
         SWLS4 = `(SWLS 4) So far I have gotten the important things I want in life`,
         SWLS5 = `(SWLS 5) If I could live my life over, I would change almost nothing`,
         SelfLabeled = `Do you consider yourself a procrastinator?`,
         OthersLabel = `Do others consider you a procrastinator?`)

# 2c

Procrastination$HasKids <- as.character(Procrastination$HasKids)
Procrastination$HasKids[which(str_detect(Procrastination$HasKids,"Yes Kids"))] <- "1"
Procrastination$HasKids[which(str_detect(Procrastination$HasKids,"No Kids"))] <- "0"
Procrastination$EduLvl[which(Procrastination$EduLvl=="")] <- NA
Procrastination$WorkStatus[which(Procrastination$WorkStatus=="")] <- NA
Procrastination$WorkStatus[which(Procrastination$WorkStatus=="0")] <- NA
Procrastination$Occupation[which(Procrastination$Occupation=="")] <- NA
Procrastination$Occupation[which(str_detect(tolower(Procrastination$Occupation),"teacher"))] <- "Teacher"
Procrastination$Occupation[which(str_detect(tolower(Procrastination$Occupation),"professor"))] <- "Professor"
Procrastination$Occupation[which(str_detect(tolower(Procrastination$Occupation),"^(?=.*admin)(?=.*assist)"))] <- "Administrative Assistant"
Procrastination$YrsJobHeld <- as.integer(round(Procrastination$YrsJobHeld))
Procrastination$YrsJobHeld <- as.integer(Procrastination$YrsJobHeld)
Procrastination$YrsJobHeld[which(str_detect(Procrastination$YrsJobHeld,"999"))] <- 0
Procrastination$CntryOfRes <- gsub(x=Procrastination$CntryOfRes,pattern="0",replacement=NA)
Procrastination$Occupation <- gsub(x=Procrastination$Occupation,pattern="please specify",replacement=NA)
Procrastination$Occupation <- gsub(x=Procrastination$Occupation,pattern="0",replacement=NA)
Procrastination$NumSons <- as.character(Procrastination$NumSons)
Procrastination$NumSons[which(str_detect(Procrastination$NumSons,"Male"))] <- "1"
Procrastination$NumSons[which(str_detect(Procrastination$NumSons,"Female"))] <- "2"
Procrastination$CommunitySz[which(str_detect(Procrastination$CommunitySz,"[:digit:]"))] <- NA
Procrastination$CntryOfRes <- gsub(x=Procrastination$CntryOfRes,pattern="Isreal",replacement="Israel")
Procrastination$MaritalStat[which(str_detect(Procrastination$MaritalStat,"0"))] <- NA
Procrastination$MaritalStat[which(Procrastination$MaritalStat=="")] <- NA
Procrastination$SelfLabeled <- as.character(Procrastination$SelfLabeled)
Procrastination$SelfLabeled[which(str_detect(Procrastination$SelfLabeled,"yes"))] <- "1"
Procrastination$SelfLabeled[which(str_detect(Procrastination$SelfLabeled,"no"))] <- "0"
Procrastination$SelfLabeled[which(Procrastination$SelfLabeled=="")] <- NA
Procrastination$OthersLabel <- as.character(Procrastination$OthersLabel)
Procrastination$OthersLabel[which(str_detect(Procrastination$OthersLabel,"yes"))] <- "1"
Procrastination$OthersLabel[which(str_detect(Procrastination$OthersLabel,"no"))] <- "0"
Procrastination$OthersLabel[which(Procrastination$OthersLabel=="")] <- NA

# 2d Correcting column data types

Procrastination$HasKids <- as.factor(Procrastination$HasKids)
Procrastination$NumSons <- as.numeric(Procrastination$NumSons)
Procrastination$SelfLabeled <- as.factor(Procrastination$SelfLabeled)
Procrastination$OthersLabel <- as.factor(Procrastination$OthersLabel)

# 2e Creating means columns for each test

DPMean <- round(rowMeans(Procrastination[,15:19]),2)
AIPMean <- round(rowMeans(Procrastination[,20:34]),2)
GPMean <- round(rowMeans(Procrastination[,35:54]),2)
SWLSMean <- round(rowMeans(Procrastination[,55:59]),2)

# Do we just want the means columns at the end?
Procrastination2 <- data.frame(Procrastination,DPMean,AIPMean,GPMean,SWLSMean)
# Or do we want to add the mean for each test following that test's questions?
Procrastination2 <- Procrastination2[c(1:19,62,20:34,63,35:54,64,55:59,65,61:62)]
