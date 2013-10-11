rankhospital <- function(state, outcome, num="best") {

  outcome.names <- c("heart attack", "heart failure", "pneumonia")
  
  # check validity of outcome
  if (!outcome %in% outcome.names) {
    stop("invalid outcome")
  }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  # check validity of state
  if (!state %in% unique(data$State)) {
    stop("invalid state")
  }

  # rename outcome columns so can reference easily
  names(data)[c(11,17,23)] <- outcome.names

  # create a vector of hospitals and death rates for the state
  hosp <- data[data$State == state,"Hospital.Name"]
  rates <- suppressWarnings(as.numeric(data[data$State == state,outcome]))

  # get rid of noes with NA death rates
  hosp <- hosp[!is.na(rates)]
  rates <- rates[!is.na(rates)]

  # order hospitals by rates, then hospital name
  hospitalranks <- hosp[order(rates, hosp)]

  # convert num to numeric and check for validity
  if (!is.numeric(num)) {
    if (num == "best") {
      num <- 1
    } else if (num == "worst") {
      num <- length(hospitalranks)
    } else {
      stop("invalid num")
    } 
  }
  
  # return the hospital with the rank of num
  return(hospitalranks[num])
}
