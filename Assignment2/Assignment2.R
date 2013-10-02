data_url <- "http://spark-public.s3.amazonaws.com/compdata/data/specdata.zip"
zipfile <- "./Assignment2/specdata.zip"


download.file(data_url, destfile=zipfile)

unzip(zipfile, exdir="./data")

setwd("./Assignment2")

## Test the three functions:

## Part 1
rm(list=ls())
source("http://spark-public.s3.amazonaws.com/compdata/scripts/getmonitor-test.R")
getmonitor.testscript()

## Part 2
rm(list=ls())
source("http://spark-public.s3.amazonaws.com/compdata/scripts/complete-test.R")
complete.testscript()

## Part 3
rm(list=ls())
source("http://spark-public.s3.amazonaws.com/compdata/scripts/corr-test.R")
corr.testscript()