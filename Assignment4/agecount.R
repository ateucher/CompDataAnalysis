agecount <- function(age = NULL) {
  ## Check that "age" is non-NULL; else throw error
  ## Read "homicides.txt" data file
  ## Extract ages of victims; ignore records where no age is
  ## given
  ## Return integer containing count of homicides for that age
  
  if (is.null(age)) {
    stop("you must supply an age")
  }
  
  homicides <- readLines("homicides.txt")
  
  r <- regexec("(\\d+) years old</dd>", homicides)
  m <- regmatches(homicides, r)
  ages <- as.integer(sapply(m, function(x) x[2]))
  
  ages <- ages[!is.na(ages)]
  
  length(ages[ages == age])
}