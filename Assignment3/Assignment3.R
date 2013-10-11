## Download the data, metadata, and instructions
setwd("./Assignment3")
instrfile <- "http://spark-public.s3.amazonaws.com/compdata/documents/ProgAssignment3.pdf"
datafile <- "http://spark-public.s3.amazonaws.com/compdata/data/ProgAssignment3-data.zip"

dir.create("doc")
download.file(instrfile, "./doc/ProgAssignment3.pdf", mode="wb")
download.file(datafile, "ProgAssignment3-data.zip")

unzip("ProgAssignment3-data.zip")
system("mv Hospital_Revised_Flatfiles.pdf doc/Hospital_Revised_Flatfiles.pdf")


## Get the submit script:
source("http://spark-public.s3.amazonaws.com/compdata/scripts/submitscript.R")
