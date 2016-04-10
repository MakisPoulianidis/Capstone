################################################################################
# 03_TokenizeData.R
# 26-03-2016
# version 1 : initial version extracted form milestone report .Rmd
################################################################################

# Call Packages -----------------------------------------------------------
library(quanteda)
library(tau)

# Read Datasets -----------------------------------------------------------

sample.1<-readRDS("./data/sample.1.rds")

# Clean Data --------------------------------------------------------------
## remove e-mail addresses "[[:alnum:].-]+@[[:alnum:].-]+"
## remove twitter accounts "@[^\\s]+"
cleanData <- function(text){
        ## remove e-mail adresses
        text <- gsub("[[:alnum:].-]+@[[:alnum:].-]+"," ",text ) 
        ## remove twitter accounts
        text <- gsub("@[^\\s]+", " ", text)
        ## remove non-alphanumerics
        text <- gsub("[^A-Za-z\']"," ",text)
        ## remove extra whitespaces 
        text <- gsub("\\s+"," ",text)
        ## convert to lowercase
        text <- tolower(text)
        return(text)
}

# run the function
sample.1 <- cleanData(sample.1)

# Tokenize the data -------------------------------------------------------
sample.1.corpus <- quanteda::tokenize(sample.1, what = "word",removeNumbers = TRUE, removePunct = TRUE, removeSeparators = TRUE, removeHyphens = TRUE)

##Define a function to create n-grams.
createNGram <- function(text,n){
        x<-tau::textcnt(x = text, tolower = TRUE, 
                   method = "string", n = n, decreasing=TRUE)
        return(x)
}

## Run the n-grams and dump the results
## remove any unneeded datasets 

sample.n1 <-createNGram(sample.1.corpus,1)
sample.n1 <- data.frame(counts = unclass(sample.n1),text=(names(sample.n1)), stringsAsFactors = FALSE)
rownames(sample.n1) <- NULL
sample.n1 <- data.table::data.table(sample.n1)
saveRDS(sample.n1, "./data/sample.n1.rds")
rm(sample.n1)
gc()

sample.n2 <-createNGram(sample.1.corpus,2)
sample.n2 <- data.frame(counts = unclass(sample.n2),text=(names(sample.n2)), stringsAsFactors = FALSE)
rownames(sample.n2) <- NULL
sample.n2 <- data.table::data.table(sample.n2)
saveRDS(sample.n2, "./data/sample.n2.rds")
rm(sample.n2)
gc()


sample.n3 <-createNGram(sample.1.corpus,3)
sample.n3 <- data.frame(counts = unclass(sample.n3),text=(names(sample.n3)), stringsAsFactors = FALSE)
rownames(sample.n3) <- NULL
sample.n3 <- data.table::data.table(sample.n3)
saveRDS(sample.n3, "./data/sample.n3.rds")
rm(sample.n3)
gc()


sample.n4 <-createNGram(sample.1.corpus,4)
sample.n4 <- data.frame(counts = unclass(sample.n4),text=(names(sample.n4)), stringsAsFactors = FALSE)
rownames(sample.n4) <- NULL
sample.n4 <- data.table::data.table(sample.n4)
saveRDS(sample.n4, "./data/sample.n4.rds")
rm(sample.n4)
gc()

rm(sample.1.corpus)
rm(sample.1)
gc()