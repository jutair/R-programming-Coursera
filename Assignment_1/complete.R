#######################################################################################################################################################################
# Author: Jutair Rios
#######################################################################################################################################################################
#Part 2
#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows

#complete <- function(directory, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
#}

#You can see some example output from this function: https://d396qusza40orc.cloudfront.net/rprog%2Fdoc%2Fcomplete-demo.html
#. The function that you write should be able to match this output. Please save your code to a file named complete.R. To run the submit script for this part, make sure your working directory has the file complete.R in it.
#source("complete.R")
#complete("specdata", 1)
##   id nobs
## 1  1  117
#complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
#complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
#complete("specdata", 3)
##   id nobs
## 1  3  243
#######################################################################################################################################################################


complete <- function(specdata,id=1:332)
{
  specdata <- "/home/jutair/Documentos/codigos/R-programming-Coursera/Coursera/Assignment_1/specdata/" #Folder where is the CSV file
  nobs=numeric()
  for(i in id)
  {
    newRead=read.csv(paste(specdata,formatC(i,width=3,flag="0"), 
                           ".csv",sep=""))
    nobs=c(nobs,sum(complete.cases(newRead)))
  }
  return(data.frame(id,nobs))
}


