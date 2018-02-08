data<-read.csv(file='C:/Users/Abhinav/Documents/train.csv', header=TRUE)
dim(data)
names(data)

# gives counts in each category of AA7 and AA15 columns
table(data$AA7)
table(data$AA15)

# remove columns where more than 70% data is missing
data.sub<-data[, -which(colMeans(is.na(data)) > 0.7)]
dim(data.sub)

# see which columns have missing values
names(which(colSums(is.na(data.sub))>0)) 

# how many unique values in each column
sapply(data.sub, function(col) length(unique(col)))

# which columns with more than 50 categories
data.sub.sub<-data.sub[, sapply(data.sub, function(col) length(unique(col))) > 50]
names(data.sub.sub)

# Any missing values in columns with more than 50 categories
names(which(colSums(is.na(data.sub.sub))>0))