# Project: HCUP data base  #
# Started January 25, 2017 #
############################

# Installing necessary packages - One time thing
install.packages('Hmisc')
install.packages('pastecs')
install.packages('gmodels')
install.packages('Quartz')
install.packages('nnet')

# Loading necessary packages - every time you start a session
library(Hmisc)
library(pastecs)
library(gmodels)
library(Quartz)
library(nnet)


#Set Work directory

setwd("~/Dropbox/HCUP/2005") ## Samuel
###

# Loading data
`2005_core_data` <- read.csv("~/Dropbox/HCUP/2005/2005_core_data.csv", quote="", stringsAsFactors=FALSE)

data_small <- read.table("~/Dropbox/HCUP/2005/2005_core_data_brief.txt", header = TRUE, sep =  ",")
###


# Removing the quotes
data_new<-`2005_core_data`


# Keeping adults
data2 <- data_new[data_new$AGE>=18,] ## more than 18 year (18 is included) 

# removing columns

drops <- c("covariateA","covariateB")
OURDATA[ , !(names(OURDATA) %in% drops)]

#test for GITHub

# Recoding variables as numeric
data_new$age <- as.numeric(data_new$AGE)

# Descriptive stats
names(data_new)

table(data_new$RACE_X)
table(data_new$DIED)
CrossTable(data_new$age)
table(data2$DISP_X)


# Figures

hist(data_new$AGE)
hist(data2$AGE)
hist(data_small$AGE)

#### It is not working

class(data_new$AGE) ## what class is AGE? --> it is character we have to change
data_new$AGE <- as.numeric(data_new$AGE) ### force into numeric


# Decriptive stats - Continuous covariates
stat.desc(data$variable)

# Decriptive stats - Discrete covariates
CrossTable(data$variable)


## Table 1
#E.g.
stat.desc(data_new$AGE)

CrossTable(data_new$FEMALE)
