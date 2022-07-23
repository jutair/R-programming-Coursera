###############Creating the directory#########################
# setting up the main directory
main_dir <- "C:\\Users\\jutai\\Documents"

# setting up the sub directory
sub_dir <- "specdata"

# check if sub directory exists 
if (file.exists(sub_dir)){
  
  # specifying the working directory
  setwd(file.path(main_dir, sub_dir))
} else {
  
  # create a new sub directory inside
  # the main path
  dir.create(file.path(main_dir, sub_dir))
  
  # specifying the working directory
  setwd(file.path(main_dir, sub_dir))
}

download_data <- function(fim){
  
  ####################Creating Downloading Url################
  base = "https://raw.githubusercontent.com/jutair/R-programming-Coursera/master/Assignment_1/specdata/"
  number <- 1
  number = number -1
  fim = fim -1
  id = number:fim
  extension = ".csv"
  
  for (value in id){
    
    number = 1+ number
    
    if (number < 10){
      digi2 = "00"
      char_numb = number
      char_numb = as.character(char_numb)
      char_numb = paste(digi2,char_numb, sep = "")
      url_download = paste(base, char_numb, extension, sep = "")
      n_file = paste(char_numb,extension, sep= "")
      download.file(url_download, n_file )
    }
    if (number > 9){
      if (number < 99){
        digi2= "0"
        char_numb = number
        char_numb = as.character(char_numb)
        char_numb = paste(digi2, char_numb, sep = "")
        url_download = paste(base, char_numb, extension, sep = "")
        n_file = paste(char_numb,extension, sep= "")
        download.file(url_download, n_file )
      }
    }
    if (number > 99){
      char_numb = number
      char_numb = as.character(char_numb)
      char_numb = paste(char_numb, sep = "")
      url_download = paste(base, char_numb, extension, sep = "")
      n_file = paste(char_numb,extension, sep= "")
      download.file(url_download, n_file )
    }
    
    
  }
  
}

pollutantmean <-function(specdata, pollutant, id=1:332){
  
  ##########Joining the CSV files in onde dataframe############
  files <- list.files(full.names = TRUE)
  dat <- data.frame()
  for (x in id){
    dat <- rbind(dat, read.csv(files[x]))
  }
  dat <- na.omit(dat) #Removing NA values on dataset
  ##############################################################
  mean(dat[,pollutant])
  
}
