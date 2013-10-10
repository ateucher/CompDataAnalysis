setwd("./Assignment3")

outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
outcome[,c(11,17,23)] <- as.data.frame(sapply(outcome[,c(11,17,23)]
                                              , as.numeric))

death.rates <- outcome[,c(11,17,23)]
names(death.rates) <- c("Heart Attack","Heart Failure","Pneumonia")

plot.new()
par(mfrow = c(1,3))
x.label <- "30-day Death Rate"
x.lim <- range(death.rates, na.rm=TRUE)

lapply(seq_along(death.rates), function (i) {
  title <- substitute(y * " (" * bar(X) == z * ")"
                      , list(y=names(death.rates)[i]
                             , z=round(mean(death.rates[,i], na.rm=TRUE),2)))
  hist(death.rates[,i], main=title, xlab=x.label, xlim=x.lim)
  abline(v=median(death.rates[,i], na.rm=TRUE))
})
