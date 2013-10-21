homicides.file <- "http://spark-public.s3.amazonaws.com/compdata/data/Baltimore_homicides.zip"
zipfile <- "Baltimore_homicides.zip"
download.file(homicides.file, destfile=zipfile, mode="wb")

homicides <- readLines(unzip(zipfile))

# Lecture notes

i <- grep("Cause: [Ss]hooting", homicides)
j <- grep("[Ss]hooting", homicides)

setdiff(i,j)
setdiff(j,i)

homicides[setdiff(j,i)]

grep("^New", state.name, value=TRUE)
# [1] "New Hampshire" "New Jersey"    "New Mexico"    "New York" ]

regexpr("<dd>[Ff]ound(.*)</dd>", homicides[1:10])
substr(homicides[1], start=177, stop=177+93-1)

regexpr("<dd>[Ff]ound(.*?)</dd>", homicides[1:10]) # ? makes .* lazy
substr(homicides[1], start=177, stop=177+93-1)

r <- regexpr("<dd>[Ff]ound(.*?)</dd>", homicides[1:10])
x <- regmatches(homicides[1:10],r)

d <- gsub("<dd>[Ff]ound on |</dd>", "", x)

as.Date(d, "%B %d, %Y")

# The regexec function works like regexpr except it aslo gives you indices for 
# parenthesized sub-expressions

regexec("<dd>[Ff]ound on (.*?)</dd>", homicides[1])
substr(homicides[1], 190, 190+15-1)

r <- regexec("<dd>[Ff]ound on (.*?)</dd>", homicides)
m <- regmatches(homicides, r)
dates <- sapply(m, function(x) x[2])
dates <- as.Date(dates, "%B %d, %Y")
hist(dates, "month", freq=TRUE) # hist on dates requires an interval ("month" in this case)

## Submit:
source("http://spark-public.s3.amazonaws.com/compdata/scripts/submitscript4.R")
