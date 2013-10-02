corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- list.files(directory, full.names=TRUE)
  
  compcases <- data.frame(id=integer(length(files))
                        , no=integer(length(files)))
  row=1
  for (file in files) {
    data <- read.csv(file)
    compcases[row,"id"] <- data[1,"ID"]
    compcases[row,"nobs"] <- length(which(complete.cases(data)))
    row=row+1
  }
  
  useIDs <- compcases$id[compcases$nobs > threshold]
  
  correlations <- numeric(length(useIDs))
  
  if (length(correlations) == 0) {
    
    correlations
    
  } else {
  
    ids <- formatC(as.integer(useIDs), width=3, flag=0)
    usefiles <- paste0("specdata/", ids, ".csv")
    
    row=1
    for (file in usefiles) {
      data <- read.csv(file)
      correlations[row] <- cor(data$sulfate,data$nitrate, use="complete.obs")
      row = row+1    
    }
  
    correlations
  }
  
}