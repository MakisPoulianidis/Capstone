################################################################################
# 00_RunScripts.R
# 27-04-2016
# version 1 : initial version
################################################################################

rm(list = ls())
gc()

print(paste0('01_LoadData.R started at ',Sys.time()))
source('01_LoadData.R')
print(paste0('01_LoadData.R finished at ',Sys.time()))

print(paste0('02_SampleData.R started at ',Sys.time()))
source('02_SampleData.R')
print(paste0('02_SampleData.R finished at ',Sys.time()))

print(paste0('03_TokenizeData.R started at ',Sys.time()))
source('03_TokenizeData.R')
print(paste0('03_TokenizeData.R finished at ',Sys.time()))

print(paste0('04_CalculateMLE.R at ',Sys.time()))
source('04_CalculateMLE.R')
print(paste0('04_CalculateMLE.R finished at ',Sys.time()))

print(paste0('05_SmoothingData started at ',Sys.time()))
source('05_SmoothingData.R')
print(paste0('05_SmoothingData finished at ',Sys.time()))

print(paste0('06_CreateSearchTables started at ',Sys.time()))
source('06_CreateSearchTables.R')
print(paste0('06_CreateSearchTables finished at ',Sys.time()))