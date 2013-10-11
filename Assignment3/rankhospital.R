rankhospital <- function(state, outcome, num="best") {

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

  hosp <- hosp[!is.na(out)]
  out <- out[!is.na(out)]
  
  hospitalranks <- hosp[order(out, hosp)]

  if (!is.numeric(num)) {
    if (num == "best") {
      num <- 1
    } else if (num == "worst") {
      num <- length(hospitalranks)
    } else {
      stop("invalid num")
    } 
  }
  
  hospitalranks[num]
}
