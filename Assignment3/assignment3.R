setwd("./Assignment3")

instrfile <- "http://spark-public.s3.amazonaws.com/compdata/documents/ProgAssignment3.pdf"
datafile <- "http://spark-public.s3.amazonaws.com/compdata/data/ProgAssignment3-data.zip"

dir.create("doc")
download.file(instrfile, "./doc/ProgAssignment3.pdf", mode="wb")
download.file(datafile, "ProgAssignment3-data.zip")

unzip("ProgAssignment3-data.zip")
system("mv Hospital_Revised_Flatfiles.pdf doc/Hospital_Revised_Flatfiles.pdf")

# Read in data

outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
head(outcome)

## 1: Hist of 30-day death rates
outcome[, 11] <- as.numeric(outcome[,11])
hist(outcome[,11], main="", xlab="") # could specify title and xlab here
title(main="Heart Attack 30-day Death Rate", xlab="30-day Death Rate")

## 2: 

# 1)
Drate.HA <- 11 # Heart attack 30-day death rate column
Drate.HF <- 17 # Heart failure 30-day death rate column
Drate.PN <- 23 # Pneumonia 30-day death rate column

# 2)
outcome[,c(11,17,23)] <- as.data.frame(sapply(outcome[,c(11,17,23)]
                                              , as.numeric))

# 3)

death.rates <- outcome[,c(11,17,23)]
names(death.rates) <- c("Heart Attack","Heart Failure","Pneumonia")

plot.new()
par(mfrow = c(1,3))
x.label <- "30-day Death Rate"
x.lim <- range(death.rates, na.rm=TRUE)

lapply(seq_along(death.rates), function (i) {
  title <- expression(paste0(names(death.rates)[i], " (", bar(X), "="
                  , round(mean(death.rates[,i], na.rm=TRUE),2), ")"))
  hist(death.rates[,i], main=title, xlab=x.label, xlim=x.lim)
  abline(v=median(death.rates[,i], na.rm=TRUE))
})

