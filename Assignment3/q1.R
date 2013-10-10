setwd("./Assignment3")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[,11])
hist(outcome[,11], main="", xlab="") # could specify title and xlab here
title(main="Heart Attack 30-day Death Rate", xlab="30-day Death Rate")
