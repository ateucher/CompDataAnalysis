# Download and load the data
data_url <- "http://spark-public.s3.amazonaws.com/compdata/data/hw1_data.zip"
zipfile <- "./Assignment1/data/hw1_data.zip"

download.file(data_url, destfile=zipfile)

data <- read.csv(unzip(zipfile, exdir="./data"), stringsAsFactors=FALSE)

# These data are from the included 'airquality' dataset:
identical(data,airquality)

# Question 1
names(data)
colnames(data)

# Question 2
head(data,n=2)
data[1:2,]

# Question 3
str(data)
nrow(data)

# Question 4
tail(data,2)
data[(nrow(data)-1):nrow(data),]
data[-(1:(nrow(data)-2)),]

# Question 5
data[47,"Ozone"] # Index by column name
data[47,1] # Index by column number

# Question 6
nrow(data[is.na(data$Ozone),])

# Question 7
mean(data$Ozone, na.rm=TRUE)
mean(data$Ozone[!is.na(data$Ozone)])

# Question 8
data.sub <- data[data$Ozone > 31 & data$Temp > 90,]
mean(data.sub$Solar.R, na.rm=TRUE)
mean(data.sub$Solar.R[!is.na(data.sub$Solar.R)])
mean(data.sub[!is.na(data.sub$Solar.R),"Solar.R"])

# Q 8 - alternate way using subset function
data.sub2 <- subset(data, Ozone > 31 & Temp > 90, drop=TRUE)
mean(data.sub2$Solar.R)

# Question 9
mean(data[data$Month == 6,"Temp"], na.rm=TRUE)
mean(data$Temp[data$Month == 6], na.rm=TRUE)

# Question 10
max(data$Ozone[data$Month == 5], na.rm=TRUE)
