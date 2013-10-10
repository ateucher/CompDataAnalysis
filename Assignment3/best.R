best <- function(state, outcome) {
  
  outcome.names <- c("heart attack", "heart failure", "pneumonia")
  
  if (!outcome %in% outcome.names) {
    stop("invalid outcome")
  }
  
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  if (!state %in% unique(data$State)) {
    stop("invalid state")
  }
  
  names(data)[c(11,17,23)] <- outcome.names

  hosp <- data[data$State == state,"Hospital.Name"]
  out <- suppressWarnings(as.numeric(data[data$State == state,outcome]))
  
  hospitalranks <- hosp[order(out, hosp)]
  
  best <- hospitalranks[1]
  
  return(best)
}
