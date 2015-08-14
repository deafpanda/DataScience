###  Megan Graye
###  080115
###  Generate pollutant mean for a column of data from set of csv's



pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        filelist <- list.files(directory, full.names = TRUE)
        
        ## initialize dataframe for collecting observation contents
        specdata <- data.frame()
        for (i in id) {
                ## Add observations for each of the elements of the vector id
                specdata <-
                        rbind(specdata, read.csv(filelist[i], sep = ","))
        }
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        RESULT <- mean(specdata[,pollutant], na.rm = TRUE)
        
        ## Keep it clean and maintain conventions.  If my function return is
        ## always called result I can confidently assume that searching the
        ## function for RESULT will allow me to backtrack when having to perform
        ## debugging
        RESULT
}

## Get the current working directory and save it in a variable for reversion
## when complete
oldwd <- getwd()
print(oldwd)

## Change the working directory to the parent of specdata
setwd("."
        ## Path to specdata parent directory 
)

## define the value to use in the formal variable directory of the function:
## pollutantmean ASSUMPTION:  Your working directory contains the specdata
## directory as an immediate child
mydir <- "specdata"

## 'id' is an integer vector indicating the monitor ID numbers to be used
id <- c(1:as.integer((length(list.files(
        mydir
)))))


## 'pollutant' is a character vector of length 1 indicating the name of the
## pollutant for which we will calculate the mean; either "sulfate" or
## "nitrate".
mypollutant <- "sulfate"

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)

# Execute function with populated formal variables
## x <- pollutantmean(mydir, mypollutant, id)

## str(x)

# Resume R operation using the working directory in place before using this
# script
setwd(oldwd)
