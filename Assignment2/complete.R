complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ids <- formatC(as.integer(id), width=3, flag=0)
  files <- paste0("specdata/", ids, ".csv")
  
  outdata <- data.frame(id=integer(length(files))
                        , nobs=integer(length(files)))
  row=1
  for (file in files) {
    data <- read.csv(file)
    outdata[row,"id"] <- data[1,"ID"]
    outdata[row,"nobs"] <- length(which(complete.cases(data)))
    row=row+1
  }
  
  outdata
      
}