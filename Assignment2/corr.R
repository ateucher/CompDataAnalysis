corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- list.files(directory, full.names=TRUE)
  
  # Create a list of data frames
  data.list <- lapply(files, read.csv)
  
  meetThreshold <- function(x, threshold) {
    length(which(complete.cases(x))) > threshold
  }
  
  # make a logical vector for if the dataset meets the threshold
  useIDs <- sapply(data.list, meetThreshold, threshold=threshold)
  
  doCorr <- function(x) {
    cor(x$sulfate, x$nitrate, use="complete.obs")
  }
  
  # do correlations on datasets that meet the threshold
  correlations <- sapply(data.list[useIDs], doCorr)
  as.numeric(correlations)
}