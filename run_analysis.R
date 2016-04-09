##############################

#download the given data from the linkn https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
library(httr)
download_from <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dowloaded_file <- "data_downloaded.zip"
if(!file.exists(dowloaded_file)){
        print("file doesnot exist")
        download.file(download_from, dowloaded_file)
}

#Unzip the downloaded zip file and save it in a new folder
datafolder <- "UCI HAR Dataset"
if(!file.exists(datafolder)){
        print("extracting the downloaded zip file")
        unzip(dowloaded_file)
} 



#Create a function to read data from features.txt and 
#convert it into a Data Frame
read_data <- function (file_name,col_names = NULL){
        
        f <- paste(datafolder,file_name,sep="/")
        data <- data.frame()
        if(is.null(col_names)){
                data <- read.table(f,sep="",stringsAsFactors=F)
        } else {
                data <- read.table(f,sep="",stringsAsFactors=F, col.names= col_names)
        }
        data
}

#run and check gettables
features <- read_data("features.txt")

#read data and build database
getdata <- function(type, features){
        print(paste("Getting data", type))
        subject_data <- read_data(paste(type,"/","subject_",type,".txt",sep=""),"id")
        y_data <- read_data(paste(type,"/","y_",type,".txt",sep=""),"activity")
        x_data <- read_data(paste(type,"/","X_",type,".txt",sep=""),features$V2)
        return (cbind(subject_data,y_data,x_data))
}

#run and check getdata
test <- getdata("test", features)
train <- getdata("train", features)


#create a function to save the resulting data in the indicated folder
saveresults <- function (data,name){
        print(paste("saving results", name))
        file <- paste(name,".csv" ,sep="")
        write.csv(data,file)
}


#Merging data onto a single dataset (called final_data)
library(plyr)
final_data <- rbind(train, test)

#Appropriately labels the data set with descriptive variable names. 
final_data$activity <- factor(final_data$activity, levels=activity_labels$V1, labels=activity_labels$V2)
final_data <- arrange(final_data, id)

#Use descriptive activity names to name the activities in the data set
activity_labels <- read_data("activity_labels.txt")

#Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidy_dataset <- ddply(mean_stddev, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(tidy_dataset)[-c(1:2)] <- paste("mean_of_",colnames(tidy_dataset)[-c(1:2)],sep="")
colnames(tidy_dataset)[1] <- "Subject"
write.table(tidy_dataset,"tidy_dataset.txt",row.names = FALSE)
saveresults(tidy_dataset,"tidy_dataset")


#creating codebook:
if(file.exists("Codebook.md"))  {file.remove("Codebook.md")}
sink('Codebook.md')
cat(sprintf("#Codebook for tidy_dataset.txt\nThis code book summarizes the data in tidy_dataset.txt\n"))
cat(sprintf("##Identifiers\n"))
cat(sprintf("%s - ID of the test subject\n",colnames(tidy_dataset)[1]))
cat(sprintf("%s - Type of activity performed when the corresponding measurements were taken\n",colnames(tidy_dataset)[2]))
cat(sprintf("##Measurements\n"))
for (i in 3:length(colnames(tidy_dataset))) {
        cat(sprintf("%d. %s\n",i-2,colnames(tidy_dataset)[i]))
}
cat(sprintf("##Activity Labels\n"))
cat(sprintf("WALKING (value 1): subject was walking during the test\nWALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test\nWALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test\nSITTING (value 4): subject was sitting during the test\nSTANDING (value 5): subject was standing during the test\nLAYING (value 6): subject was laying down during the test"))
sink()

