source("complete.R")
        
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        cases <- complete(directory)
        dfcorr <- cases[which(cases[, "nobs"] >= threshold),]
        filelist <- list.files(directory, full.names = TRUE)
        dfspecdata <- data.frame()
        vcorr <- numeric()
                for (i in dfcorr$id)
                {
                        dfspecdata <- read.csv(filelist[i], sep = ",")
                        vcorr <-
                        c(vcorr, na.omit(cor(dfspecdata$sulfate, dfspecdata$nitrate, use = "na.or.complete")))
                }
                ## 'threshold' is a numeric vector of length 1 indicating the
                ## number of completely observed observations (on all
                ## variables) required to compute the correlation between
                ## nitrate and sulfate; the default is 0
                
                ## Return a numeric vector of correlations
                ## NOTE: Do not round the result!
                RESULT <- vcorr

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

th <- 5000

cr <- corr(mydir)
head(cr)
summary(cr)

length(cr)
        
        