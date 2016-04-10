################################################################################
# 06_CreateSearchTables.R
# 27-03-2016
# version 1 : initial version 
# version 2 : replaced sorting/ranking. dplyr for selecting top3, DT for ranking
# version 3 : added count.x to outputs.
################################################################################
library(dplyr)
library(data.table)
##path<-"./data sample 1"
path<-"./data"

# Read Datasets -----------------------------------------------------------

## moved to n-gram sections in order to save memory as much as possible.


# BiGram ------------------------------------------------------------------

## Read the RDS
smle.n2<-readRDS(paste0(path,"/smle.n2.rds", sep="" ))

## use setkey to speed up sorting
setkey(smle.n2, text.x, smle)

## Select Top-3 predictions
## V1: smle.n2<-setorder(setDT(smle.n2), -smle)[, head(.SD, 3), keyby = text.x]
smle.n2 <-select(smle.n2, input = w1, output = w2, smle = smle) %>% group_by(input) %>% top_n(3, smle)

## Add a rank using data table
## V1: smle.n2<-smle.n2 %>% group_by(text.x) %>% mutate (rank = row_number(-smle))
smle.n2 <- smle.n2[,rank:= rank(-smle,ties.method = "first"),by = input]


## Split the table
smle.n2.r1 <-
        filter(smle.n2, rank == 1) %>% select(input, output, smle)
smle.n2.r2 <-
        filter(smle.n2, rank == 2) %>% select(input, output, smle)
smle.n2.r3 <-
        filter(smle.n2, rank == 3) %>% select(input, output, smle)

## Left join
smle.n2.join <- left_join(smle.n2.r1, smle.n2.r2, by = "input")
smle.n2.join <-
        left_join(smle.n2.join, smle.n2.r3, by = "input") %>% select(
                input, output.1 = output.x, smle.1 = smle.x, output.2 = output.y, smle.2 =
                        smle.y,output.3 = output, smle.3 = smle
        )
## select only the relevant columns
smle.n2.join<-select(smle.n2.join, input, output.1, output.2, output.3)

## Save the results and cleanup
saveRDS(smle.n2.join, "./data/smle.n2.join.rds")
rm(smle.n2.join,smle.n2,smle.n2.r1,smle.n2.r2,smle.n2.r3)
gc()


# TriGram -----------------------------------------------------------------

## Read the RDS
smle.n3 <- readRDS("./data/smle.n3.rds")

## use setkey to speed up sorting
setkey(smle.n3, text.x, smle)

## Select Top-3 predictions
## V1: smle.n3<-setorder(setDT(smle.n3), -smle)[, head(.SD, 3), keyby = text.x]
smle.n3 <- select(smle.n3, input = text.x, output = w3, smle) %>% group_by(input) %>% top_n(3, smle)

## use setkey to speed up ranking
setkey(smle.n3, input, smle)

## Add a rank
## V1: smle.n3<-smle.n3 %>% group_by(text.x) %>% mutate (rank = row_number(-smle))
smle.n3 <- smle.n3[,rank:= rank(-smle,ties.method = "first"), by = input]

## Split the table
smle.n3.r1 <-
        filter(smle.n3, rank == 1) %>% select(input, output, smle)
smle.n3.r2 <-
        filter(smle.n3, rank == 2) %>% select(input, output, smle)
smle.n3.r3 <-
        filter(smle.n3, rank == 3) %>% select(input, output, smle)

## Left join
smle.n3.join <- left_join(smle.n3.r1, smle.n3.r2, by = "input")
smle.n3.join <-
        left_join(smle.n3.join, smle.n3.r3, by = "input") %>% select(
                input, output.1 = output.x, smle.1 = smle.x, output.2 = output.y, smle.2 =
                        smle.y,output.3 = output, smle.3 = smle
        )

## select only the relevant columns
smle.n3.join<-select(smle.n3.join, input, output.1, output.2, output.3)

## Save the results and cleanup
saveRDS(smle.n3.join, "./data/smle.n3.join.rds")
rm(smle.n3.join,smle.n3,smle.n3.r1,smle.n3.r2,smle.n3.r3)
gc()



# QuadriGram --------------------------------------------------------------

## Read the RDS
smle.n4 <- readRDS("./data/smle.n4.rds")

## use setkey to speed up sorting
setkey(smle.n4, text.x, smle)

## Select Top-3 predictions
## V1: smle.n4<-setorder(setDT(smle.n4), -smle)[, head(.SD, 3), keyby = text.x]
smle.n4 <-
        select(smle.n4, input = text.x, output = w4, smle) %>% group_by(input) %>% top_n(3, smle)

## use setkey to speed up ranking
setkey(smle.n4, input, smle)

## Add a rank
## V1: smle.n4<-smle.n4 %>% group_by(text.x) %>% mutate (rank = row_number(-smle))
smle.n4 <- smle.n4[,rank:= rank(-smle,ties.method = "first"),by = input]

## Split the table
smle.n4.r1 <-
        filter(smle.n4, rank == 1) %>% select(input, output, smle)
smle.n4.r2 <-
        filter(smle.n4, rank == 2) %>% select(input, output, smle)
smle.n4.r3 <-
        filter(smle.n4, rank == 3) %>% select(input, output, smle)

## Left join
smle.n4.join <- left_join(smle.n4.r1, smle.n4.r2, by = "input")
smle.n4.join <-
        left_join(smle.n4.join, smle.n4.r3, by = "input") %>% select(
                input, output.1 = output.x, smle.1 = smle.x, output.2 = output.y, smle.2 =
                        smle.y,output.3 = output, smle.3 = smle
        )

## select only the relevant columns
smle.n4.join<-select(smle.n4.join, input, output.1, output.2, output.3)

## Save the results and cleanup
saveRDS(smle.n4.join, "./data/smle.n4.join.rds")
rm(smle.n4.join,smle.n4,smle.n4.r1,smle.n4.r2,smle.n4.r3)
gc()