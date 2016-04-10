################################################################################
# 07_NextWord.R
# 30-03-2016
# version 1 : initial version 
################################################################################
library(data.table)

path<-"./data sample 1"
##path<-"./data"
        
bigram<-readRDS(paste0(path,"/smle.n2.join.rds",sep=""))
trigram<-readRDS(paste0(path,"/smle.n3.join.rds",sep=""))
quadrigram<-readRDS(paste0(path,"/smle.n4.join.rds",sep=""))

splitString <- function(text) {
        text <- tolower(text)
        text <- unlist(strsplit(text,split = ' '))
        text <- gsub("[^A-Za-z\']","",text)
        text <- text[text != ""]
        if (length(tail(text,3))==3)  {
                gram <- 3
                string3 <- paste0(tail(text,3), collapse = " ")
                string2 <- paste0(tail(text,2), collapse = " ")
                string1 <- paste0(tail(text,1), collapse = " ")
        }else{
                if (length(tail(text,3))==2)  {
                        gram <- 2
                        string3 <- NA
                        string2 <- paste0(tail(text,2), collapse  = " ")
                        string1 <- paste0(tail(text,1), collapse  = " ")
                }else{
                        gram <- 1
                        string3 <- NA
                        string2 <- NA
                        string1 <- paste0(tail(text,1), collapse = " ")
                }
        }
        output <- c(gram, string1,string2,string3)
        return(output)
}

## Test
test<-"a great day"
test2<-"a great"
splitString(test)

string.length <- splitString(test)[1]
string1 <- splitString(test)[2]
string2 <- splitString(test)[3]
string3 <- splitString(test)[4]


Backoff.1 <- function(string1) {
        result <- bigram[input == string1,.(output.1,output.2,output.3)]
        if (length(result[,output.1]) == 0) {
                status <- "DEFAULT"
                output <- c(status, "the",NA,NA)
        }else{
                status <- "OK"        
                output <- c(status, result[,output.1],result[,output.2],result[,output.3])
                }
        ##output <- c(status, result[,output.1],result[,output.2],result[,output.3])
        return(output)
}


Backoff.2 <- function(string1, string2) {
        result <- trigram[input == string2,.(output.1,output.2,output.3)]
        if (length(result[,output.1]) > 0) {
                status <- "OK"
                output <- c(status, result[,output.1],result[,output.2],result[,output.3])
        }else{        
        result <- bigram[input == string1,.(output.1,output.2,output.3)]
        if (length(result[,output.1]) == 0) {
                status <- "DEFAULT"
                output <- c(status, "the",NA,NA)
        }else{
                status <- "OK"        
                output <- c(status, result[,output.1],result[,output.2],result[,output.3])
        }}
        return(output)

}


Backoff.3 <- function(string1, string2, string3) {
        result <- quadrigram[input == string3,.(output.1,output.2,output.3)]
        if (length(result[,output.1]) > 0) {
                status <- "OK"
                output <- c(status, result[,output.1],result[,output.2],result[,output.3])
        }else{     
        result <- trigram[input == string2,.(output.1,output.2,output.3)]
        if (length(result[,output.1]) > 0) {
                status <- "OK"
                output <- c(status, result[,output.1],result[,output.2],result[,output.3])
        }else{        
                result <- bigram[input == string1,.(output.1,output.2,output.3)]
                if (length(result[,output.1]) == 0) {
                        status <- "DEFAULT"
                        output <- c(status, "the",NA,NA)
                }else{
                        status <- "OK"        
                        output <- c(status, result[,output.1],result[,output.2],result[,output.3])
                }}}
        return(output)
        
}

predictWord <- function(text) {
        if (splitString(text)[1] == 3){
                Backoff.3(splitString(text)[2],splitString(text)[3],splitString(text)[4])
        } else {
                if (splitString(text)[1] == 2){
                        Backoff.2(splitString(text)[2],splitString(text)[3])
                } else {                
                        
                        Backoff.1(splitString(text)[2])
                }
        }
}
                
        
        









