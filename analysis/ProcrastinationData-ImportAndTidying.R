# Data Tidying for Procrastination Data

library(knitr)
library(kableExtra)
library(dplyr)
library(stringr)

#2a - Importing data set and outputting number of rows and columns

Procrastination <- read.csv("/data/Procrastination.csv",header=TRUE)
# I could set check.names=FALSE to not force correct names with the periods
procrastination_row <- nrow(Procrastination)
procrastination_col <- ncol(Procrastination)
procrastination_str <- data.frame(procrastination_row,procrastination_col)
names(procrastination_str) <- c("Number Of Rows","Number Of Columns")
#kable(procrastination_str,"html",row.names=FALSE) %>%
#  kable_styling(bootstrap_options = c("striped","condensed"), full_width=F, position="left")

#2b
# Initial column name cleanup
names(Procrastination) <- gsub(x=names(Procrastination),pattern="â",replacement="") # removes weird apostrophe conversion
names(Procrastination) <- gsub(x=names(Procrastination),pattern="æ",replacement="") # removes weird apostrophe conversion
names(Procrastination) <- gsub(x=names(Procrastination),pattern="o",replacement="") # removes weird apostrophe conversion
names(Procrastination) <- gsub(x=names(Procrastination),pattern="\\.",replacement=" ")
names(Procrastination) <- gsub(x=names(Procrastination),pattern="ï",replacement=" ")
# replaces the periods from name.check with spaces
names(Procrastination) <- gsub("(?<=\\b)([a-z])", "\\U\\1", tolower(names(Procrastination)), perl=TRUE) # capitalizes each word
names(Procrastination) <- gsub(x=names(Procrastination),pattern=" ",replacement="") # collapses the spaces

# Renaming columns
Procrastination <- Procrastination %>%
  rename(EduLvl = Edu) %>%
  rename(HasKids = Kids) %>%
  rename(Occupation = CurrentOccupation) %>%
  rename(YrsJobHeld = HowLongHaveYouHeldThisPositionYears) %>%
  rename(MosJobHeld = HowLongHaveYouHeldThisPositionMonths) %>%
  rename(CommunitySz = CommunitySize) %>%
  rename(CntryOfRes = CountryOfResidence) %>%
  rename(MaritalStat = MaritalStatus) %>%
  rename(NumSons = NumberOfSons) %>%
  rename(NumDaughters = NumberOfDaughters) %>%
  rename(DP1 = XDp1IWasteALotOfTimeOnTrivialMattersBeforeGettingToTheFinalDecisions) %>%
  rename(DP2 = XDp2EvenAfterIMakeADecisionIDelayActingUponIt) %>%
  rename(DP3 = XDp3IDonTMakeDecisionsUnlessIReallyHaveTo) %>%
  rename(DP4 = XDp4IDelayMakingDecisionsUntilItSTooLate) %>%
  rename(DP5 = XDp5IPutOffMakingDecisionsUntilItSTooLate) %>%
  rename(AIP1 = XAip1IPayMyBillsOnTime) %>%
  rename(AIP2 = XAip2IAmPromptAndOnTimeForMostAppointments) %>%
  rename(AIP3 = XAip3ILayOutMyClothesTheNightBeforeIHaveAnImportantAppointmentSoIWonTBeLate) %>%
  rename(AIP4 = XAip4IFindMyselfRunningLaterThanIWouldLikeToBe) %>%
  rename(AIP5 = XAip5IDonTGetThingsDoneOnTime) %>%
  rename(AIP6 = XAip6IfSomeoneWereTeachingACourseOnHowToGetThingsDoneOnTimeIWouldAttend) %>%
  rename(AIP7 = XAip7MyFriendsAndFamilyThinkIWaitUntilTheLastMinute) %>%
  rename(AIP8 = XAip8IGetImportantThingsDoneWithTimeToSpare) %>%
  rename(AIP9 = XAip9IAmNotVeryGoodAtMeetingDeadlines) %>%
  rename(AIP10 = XAip10IFindMyselfRunningOutOfTime) %>%
  rename(AIP11 = XAip11IScheduleDoctorSAppointmentsWhenIAmSupposedToWithoutDelay) %>%
  rename(AIP12 = XAip12IAmMorePunctualThanMostPeopleIKnow) %>%
  rename(AIP13 = XAip13IDoRoutineMaintenanceEGChangingTheCarOilOnThingsIOwnAsOftenAsIShould) %>%
  rename(AIP14 = XAip14WhenIHaveToBeSomewhereAtACertainTimeMyFriendsExpectMeToRunABitLate) %>%
  rename(AIP15 = XAip15PuttingThingsOffTillTheLastMinuteHasCostMeMoneyInThePast) %>%
  rename(GP1 = XGp1IOftenFindMyselfPerformingTasksThatIHadIntendedToDoDaysBefore) %>%
  rename(GP2 = XGp2IOftenMissConcertsSportingEventsOrTheLikeBecauseIDonTGetAroundToBuyingTicketsOnTime) %>%
  rename(GP3 = XGp3WhenPlanningAPartyIMakeTheNecessaryArrangementsWellInAdvance) %>%
  rename(GP4 = XGp4WhenItIsTimeToGetUpInTheMorningIMostOftenGetRightOutOfBed) %>%
  rename(GP5 = XGp5ALetterMaySitForDaysAfterIWriteItBeforeMailingItPossible) %>%
  rename(GP6 = XGp6IGenerallyReturnPhoneCallsPromptly) %>%
  rename(GP7 = XGp7EvenJobsThatRequireLittleElseExceptSittingDownAndDoingThemIFindThatTheySeldomGetDoneForDays) %>%
  rename(GP8 = XGp8IUsuallyMakeDecisionsAsSoonAsPossible) %>%
  rename(GP9 = XGp9IGenerallyDelayBeforeStartingOnWorkIHaveToDo) %>%
  rename(GP10 = XGp10WhenTravelingIUsuallyHaveToRushInPreparingToArriveAtTheAirportOrStationAtTheAppropriateTime) %>%
  rename(GP11 = XGp11WhenPreparingToGoOutIAmSeldomCaughtHavingToDoSomethingAtTheLastMinute) %>%
  rename(GP12 = XGp12InPreparationForSomeDeadlinesIOftenWasteTimeByDoingOtherThings) %>%
  rename(GP13 = XGp13IfABillForASmallAmountComesIPayItRightAway) %>%
  rename(GP14 = XGp14IUsuallyReturnARsvpRequestVeryShortlyAfterReceivingIt) %>%
  rename(GP15 = XGp15IOftenHaveATaskFinishedSoonerThanNecessary) %>%
  rename(GP16 = XGp16IAlwaysSeemToEndUpShoppingForBirthdayGiftsAtTheLastMinute) %>%
  rename(GP17 = XGp17IUsuallyBuyEvenAnEssentialItemAtTheLastMinute) %>%
  rename(GP18 = XGp18IUsuallyAccomplishAllTheThingsIPlanToDoInADay) %>%
  rename(GP19 = XGp19IAmContinuallySayingILlDoItTomorrow) %>%
  rename(GP20 = XGp20IUsuallyTakeCareOfAllTheTasksIHaveToDoBeforeISettleDownAndRelaxForTheEvening) %>%
  rename(SWLS1 = XSwls1InMostWaysMyLifeIsCloseToMyIdeal) %>%
  rename(SWLS2 = XSwls2TheConditionsOfMyLifeAreExcellent) %>%
  rename(SWLS3 = XSwls3IAmSatisfiedWithMyLife) %>%
  rename(SWLS4 = XSwls4SoFarIHaveGottenTheImportantThingsIWantInLife) %>%
  rename(SWLS5 = XSwls5IfICouldLiveMyLifeOverIWouldChangeAlmostNothing) %>%
  rename(SelfLabeled = DoYouConsiderYourselfAProcrastinator) %>%
  rename(OthersLabel = DoOthersConsiderYouAProcrastinator)

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
