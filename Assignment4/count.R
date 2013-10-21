count <- function(cause = NULL) {
  ## Check that "cause" is non-NULL; else throw error
  ## Check that specific "cause" is allowed; else throw error
  ## Read "homicides.txt" data file
  ## Extract causes of death
  ## Return integer containing count of homicides for that cause
  
  causelist <- c("asphyxiation", "blunt force", "other", "shooting",
              "stabbing", "unknown")
  
  if (is.null(cause)) {
    stop("you must specify a cause of death")
  } else {
    cause <- tolower(cause)
  }
      
  if ( !cause %in% causelist) {
    stop("the cause you supplied is not in the database")
  }
      
  homicides <- readLines("homicides.txt")
  
  r <- regexec("Cause: (.*?)</dd>", homicides)
  m <- regmatches(homicides, r)
  causes <- sapply(m, function(x) x[2])
  
  length(grep(cause, causes, ignore.case=TRUE))
  
}
