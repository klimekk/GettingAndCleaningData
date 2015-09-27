library(dplyr)

## step 1: read test data
test.lbl <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt")

## step 2: read train data

train.lbl <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")

## step 3: read features

features<-read.table("./UCI HAR Dataset/features.txt")
newset <- as.character(features[,2])
traincols<-names(train.data)
testcols<-names(test.data)
##traincols<-names(train.data)

## we now create a new names for columns in  both: test and train to avoid
## later duplication column issue - only those columns, which we use later
## for data selection (mean and std ) are replaced

for (i in 1: length(newset))
{
  if (!grepl("std",newset[i]) && !grepl("mean",newset[i]) ) {
    newset[i] <- testcols[i]
  } 
  
}

## step 4: read activities description

act.labels<-read.table("./UCI HAR Dataset/activity_labels.txt")

## step 5: replace column names to avoid duplications

renamestdmean <- function(dat, oldnames, newnames) {
  datnames <- colnames(dat)
  datnames[which(datnames %in% oldnames)] <- newnames
  colnames(dat) <- datnames
  dat
}



train.data <- renamestdmean(train.data,traincols, newset)
test.data <- renamestdmean(test.data,testcols,newset)

## step 6 : for labels - rename columns to be labelno and labeldesc
## 

train.mrglbls <-left_join(train.lbl,act.labels, by = c("V1" = "V1"),copy=FALSE)
test.mrglbls <- left_join(test.lbl,act.labels, by = c("V1" = "V1"), copy=FALSE)

train.mrglbls<-rename(train.mrglbls,labelno=V1,labeldesc=V2)
test.mrglbls<-rename(test.mrglbls,labelno=V1,labeldesc=V2)

## step 7 merge lables piece with the data for both: train and test

train.data<-cbind(train.mrglbls,train.data)
test.data<-cbind(test.mrglbls,test.data)

## step 8 - now combine 2 datasets: train and test together in one dataset

full.data<-rbind(train.data,test.data)

### now the part to create subset - only columns with std and mean are extracted plus 
## labels, 

selected.labels <-select(full.data,labelno,labeldesc)
selected.full1 <- cbind(selected.labels,select(full.data, contains("std", ignore.case= TRUE)))
selected.full2 <- select(full.data, contains("mean", ignore.case= TRUE))


## step 10 - put all columns together


selected.full<-cbind(selected.full1,selected.full2)


## create tidy data
## step 11 - prepare vector of column titles

l <-length(names(selected.full))

titles<-names(selected.full[3:l])

## length(selected.full[,1])

## alternative df <- df[, grep("mean|std", names(df))]

## step 12 - create tidy dataset with mean (average) and write to the file

library(reshape2)

tidy<-dcast(selected.full,labelno+labeldesc~titles,mean)

write.table(tidy,file="./data/tidy.txt",row.names = FALSE)

##names(tidy)
