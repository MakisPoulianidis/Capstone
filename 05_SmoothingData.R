################################################################################
# 05_SmoothingData.R
# 29-04-2016
# version 1 : initial version 
################################################################################

# Read Datasets -----------------------------------------------------------

## moved to n-gram sections in order to save memory as much as possible.

# Apply Smoothing ---------------------------------------------------------

## This is code acts as a "stub/driver" 
## It copies the mle as smoothed mle for script 6

# BiGrams -----------------------------------------------------------------
## Read the RDS
mle.n2<-readRDS("./data/mle.n2.rds" )
## Create a new table with a copy of mle
smle.n2<-cbind(mle.n2,mle.n2[,mle.n2$mle])
## rename the mle copy to smle
setNames(smle.n2,"V2","smle")
## Save the RDS..
saveRDS(smle.n2, "./data/smle.n2.rds" )
##  ...and clean up afterwards.
rm(smle.n2,mle.n2)
gc()

# TriGrams ----------------------------------------------------------------
## Read the RDS
mle.n3<-readRDS("./data/mle.n3.rds" )
## Create a new table with a copy of mle
smle.n3<-cbind(mle.n3,mle.n3[,mle.n3$mle])
## rename the mle copy to smle
setNames(smle.n3,"V2","smle")
## Save the RDS..
saveRDS(smle.n3, "./data/smle.n3.rds" )
##  ...and clean up afterwards.
rm(smle.n3,mle.n3)
gc()

# QuadriGrams -------------------------------------------------------------
## Read the RDS
mle.n4<-readRDS("./data/mle.n4.rds" )
## Create a new table with a copy of mle
smle.n4<-cbind(mle.n4,mle.n4[,mle.n4$mle])
## rename the mle copy to smle
setNames(smle.n4,"V2","smle")
## Save the RDS..
saveRDS(smle.n4, "./data/smle.n4.rds" )
##  ...and clean up afterwards.
rm(smle.n4,mle.n4)
gc()
