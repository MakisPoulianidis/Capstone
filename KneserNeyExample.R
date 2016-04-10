library(data.table)
path<-"./data sample 1"
##path<-"./data"

bigram<-readRDS(paste0(path,"/smle.n2.join.rds",sep=""))
trigram<-readRDS(paste0(path,"/smle.n3.join.rds",sep=""))
quadrigram<-readRDS(paste0(path,"/smle.n4.join.rds",sep=""))

mle.n2<-readRDS(paste0(path,"/mle.n2.rds", sep="" ))
mle.n3<-readRDS(paste0(path,"/mle.n3.rds", sep="" ))
mle.n4<-readRDS(paste0(path,"/mle.n4.rds", sep="" ))


<s> This is a list containing the tallest buildings in San Francisco : </s> 13
<s> The Transamerica Pyramid is the tallest building in San Francisco . </s> 12
<s> 555 California Street is the 2nd-tallest building in San Francisco . </s> 12
N1 = 21
N2 = 5


Estimate the discount value D based on the total number of n-grams occuring
exactly once (n1) and twice (n2)
       n1
D = --------
    n1 + 2n2

D2<-nrow(mle.n2[counts.x==1,])/(nrow(mle.n2[counts.x==1,])+ (2 * nrow(mle.n2[counts.x==2,])))

D3<-nrow(mle.n3[counts.x==1,])/(nrow(mle.n3[counts.x==1,])+ (2 * nrow(mle.n3[counts.x==2,])))

D4<-nrow(mle.n4[counts.x==1,])/(nrow(mle.n4[counts.x==1,])+ (2 * nrow(mle.n4[counts.x==2,])))










Pkn(Francisco) = c(Francisco)       3
                --------------- =  --- = 0.08
                Swi c(wi)           37
        
        

Pkn(Francisco|San) = max{c(San Francisco) - D, 0}    D                  N1+(*Francisco) 
                    ----------------------------- + ------N1 + (San*) ------------------
                        c(San)                      c(San)              N1 + (**)


                   = max{3 - 21/21+2*5, 0}   21/21+2*5          1
                     --------------------- + --------- x 1 x -----
                                 3              3               28