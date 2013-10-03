corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- list.files(directory, full.names=TRUE)
  
  meetThreshold <- function(x, threshold) {
    data <- read.csv(x)
    length(which(complete.cases(data))) > threshold
  }
  
  useIDs <- sapply(files, meetThreshold, threshold=threshold, USE.NAMES=FALSE)
  
  doCorr <- function(x) {
    data <- read.csv(x)
    cor(data$sulfate, data$nitrate, use="complete.obs")
  }
  
  correlations <- as.numeric(sapply(files[useIDs], doCorr, simplify=FALSE
                                    , USE.NAMES=FALSE))
  correlations
}