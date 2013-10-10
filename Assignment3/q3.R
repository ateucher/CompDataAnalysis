setwd("./Assignment3")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
outcome[, 11] <- as.numeric(outcome[,11])
states <- table(outcome$State)

outcome2 <- outcome[outcome$State %in% names(states)[states >= 20],]

death <- outcome2[,11]
state <- outcome2$State

plot.new()
par(mfrow = c(1,1))
par(las=2) # number 4
boxplot(death ~ state)
title(main="Heart Attack 30-day Death Rate by State", ylab="30-day Death Rate")


## Challenge
state.death.list <- split(death,state)
states.medians <- sapply(state.death.list, median, na.rm=TRUE)
state.death.list <- state.death.list[order(states.medians)]

plot.new()
par(las=2) # number 4
boxplot(state.death.list, xaxt="n")
title(main="Heart Attack 30-day Death Rate by State", ylab="30-day Death Rate")
axis(side=1, at=1:length(state.death.list)
     , labels=paste0(names(state.death.list), " ("
                     , sapply(state.death.list, length), ")"))
