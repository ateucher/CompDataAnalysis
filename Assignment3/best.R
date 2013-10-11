best <- function(state, outcome) {
  
  outcome.names <- c("heart attack", "heart failure", "pneumonia")
  
  # Check for validity of outcome
  if (!outcome %in% outcome.names) {
    stop("invalid outcome")
  }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  # check for validity of state
  if (!state %in% unique(data$State)) {
    stop("invalid state")
  }
  
  # rename the outcome columns so easy to refernce
  names(data)[c(11,17,23)] <- outcome.names

  # create a vector of hospitals and death rates for the state
  hosp <- data[data$State == state,"Hospital.Name"]
  rates <- suppressWarnings(as.numeric(data[data$State == state,outcome]))

  # sort the hospitals by rates, then by hospital name
  hospitalranks <- hosp[order(rates, hosp)]
  
  # return the first hospital in the list
  return(hospitalranks[1])

# could also sort by hospital and then use which(min) or which.min, but
# that seems more complicated to me
}
