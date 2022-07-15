########################Dowlonading de data###########################
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

list.files("diet_data")

andy <- read.csv("diet_data/Andy.csv")
head(andy)

length(andy$Day) #Number of rows in column Day

dim(andy) #Dimension of the dataframe
str(andy) #Types of data on dataframe

summary(andy) 

andy[1,] #Get the values of the line 1
andy[1, "Weight"] #Value of the line 1 in the Weight column
andy["Weight"] #Column Weight

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end

##It returns the contents of a directory in alphabetical order#
files <- list.files("diet_data", full.names = TRUE)
files
#### Creating a dataframe joining andy and david##############
andy_david <-rbind(andy, read.csv(files[2]))
#####Show the day 25 of andy and david######
day_25 <- andy_david[which(andy_david$Day== 25),]
day_25
######joining all the files whit rbind#######################
dat <- data.frame() #create an empty dataset
for (i in 1:5){
  dat <- rbind(dat, read.csv(files[i])) #joining the files 
  
}

### Function for filter Patient name and the day####
filter_name <- function(name, day){
  dat_filter_name <- dat[which(dat[,"Patient.Name"]== name),]
  dat_filter_day <- dat_filter_name[which(dat_filter_name[,"Day"]== day),]
  dat_filter_day
}

##### function that will return the median weight of a given day#############
weightmedian <-function(directory, day){
  files_list <- list.files(directory, full.names = TRUE) #creates a list of files
  dat <-data.frame() #creates an empty data frame
  for (i in 1:5){
    # loops through the files, rbinding them together
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"]== day),]
  median(dat_subset[, "Weight"], na.rm = TRUE)
}


