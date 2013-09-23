# Download and load the data
temp <- tempfile()

download.file("http://spark-public.s3.amazonaws.com/compdata/data/hw1_data.zip"
              , destfile=temp)

data <- read.csv(unz(temp, filename="hw1_data.csv"), stringsAsFactors=FALSE)
unlink(temp); rm(temp)

#Save the data
write.csv(data, file="./data/hw1_data.csv", row.names=FALSE)

# Question 1:
colnames(data)

# Question 2:
head(data,2)

# Question 3:
nrow(data)

# Question 4:
tail(data,2)

# Question 5:
data[47,"Ozone"]

# Question 6:
nrow(data[is.na(data$Ozone),])

# Question 7:
mean(data$Ozone,na.rm=TRUE)

# Question 8:
subset.q8 <- data[data$Ozone > 31 & data$Temp > 90,]
mean(subset.q8$Solar.R, na.rm=TRUE)

# Question 9:
mean(data$Temp[data$Month==6], na.rm=TRUE)

# Question 10:
max(data$Ozone[data$Month == 5], na.rm=TRUE)