################################################################################
# 02_SampleData.R
# 26-03-2016
# version 1 : initial version extracted form milestone report .Rmd
# version 2 : made sample percentage variable
################################################################################

## SET SAMPLE FRACTION (e.g 0.10 = 10%)
y <- 0.50


# Read Datasets -----------------------------------------------------------

if (!exists("en_US.blogs.txt")) {
        en_US.blogs.txt<-readRDS("./data/en_US.blogs.txt.rds")
}

if (!exists("en_US.news.txt")) {
        en_US.news.txt<-readRDS("./data/en_US.news.txt.rds" )
}

if (!exists("en_US.twitter.txt")) {
        en_US.twitter.txt<-readRDS("./data/en_US.twitter.txt.rds" )
}

# Samples -----------------------------------------------------------------

## Create sets based on a random sample of 1% of the actual datasets.
        
set.seed(1)
blogs.sample.1 <-
        sample(en_US.blogs.txt, size = length(en_US.blogs.txt) * y)
news.sample.1 <-
        sample(en_US.news.txt, size = length(en_US.news.txt) * y)
twitter.sample.1 <-
        sample(en_US.twitter.txt, size = length(en_US.twitter.txt) * y)

## cleanup
rm(en_US.blogs.txt, en_US.news.txt, en_US.twitter.txt)
gc()

sample.1 <- c(blogs.sample.1, news.sample.1, twitter.sample.1)


# Dump datasets -----------------------------------------------------------

saveRDS(blogs.sample.1, "./data/blogs.sample.1.rds")
rm(blogs.sample.1)
gc()

saveRDS(news.sample.1, "./data/news.sample.1.rds" )
rm(news.sample.1)
gc()

saveRDS(twitter.sample.1, "./data/twitter.sample.1.rds" )
rm(twitter.sample.1)
gc()

saveRDS(sample.1, "./data/sample.1.rds" )
rm(sample.1)
gc()

rm(y)

