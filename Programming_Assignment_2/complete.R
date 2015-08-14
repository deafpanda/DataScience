
oldwd <- getwd()
print(oldwd)

setwd("."
      ## Path to specdata parent directory 
)

#id <- c(4,8,10,12,16,24,100)
directory <-getwd()

complete <- function(directory, id = 1:332) {

                ## 'directory' is a character vector of length 1 indicating
                ## the location of the CSV files
                ## 'id' is an integer vector indicating the monitor ID numbers
                ## to be used
                ## Return a data frame of the form:
                ## id nobs
                ## 1 117
                ## 2 1041
                ## ...
                ## where 'id' is the monitor ID number and 'nobs' is the
                ## number of complete cases

        filelist <- list.files(directory, full.names = TRUE)
        
        ## initialize dataframe for collecting observation contents
        specdata <- data.frame()
        dfidnobs <- data.frame()
        for (i in id) {
                ## Add observations for each of the elements of the vector id
                specdata <- read.csv(filelist[i], sep = ",")
                a <- sum(complete.cases(na.omit(specdata)))
                dfidnobs <- rbind(dfidnobs, list(id = i, nobs = a), make.row.names = FALSE)
        }

        RESULT <- dfidnobs
        RESULT
        
}  



## Get the current working directory and save it in a variable for reversion
## when complete
oldwd <- getwd()
print(oldwd)

## Change the working directory to the parent of specdata
setwd(
        "/home/megan/shared/owncloud/2 - R Programming/3 - Exercises/2 - Programming Assignments 1, 3, and swirl/Week 2/"
)


## define the value to use in the formal variable directory of the function:
## pollutantmean ASSUMPTION:  Your working directory contains the specdata
## directory as an immediate child
mydir <- "specdata"

## 'id' is an integer vector indicating the monitor ID numbers to be used
id <- c(1:as.integer((length(list.files(
        mydir
)))))

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)


##complete <- complete(mydir, id)
##str(complete)

