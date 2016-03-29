library(dplyr)
library(stringi)

en_US.news <- readLines("~/BusinessIntelligence/GitHub/Swiftkey/final/en_US/en_US.news.txt")

en_US.news <- readLines("~/BusinessIntelligence/GitHub/Swiftkey/final/en_US/en_US.news.txt", encoding = "UTF-8")

en_US.blogs <- readLines("~/BusinessIntelligence/GitHub/Swiftkey/final/en_US/en_US.blogs.txt")

en_US.twitter <- readLines("~/BusinessIntelligence/GitHub/Swiftkey/final/en_US/en_US.twitter.txt")


en_US.news<-setNames(data_frame(en_US.news),"text")        
en_US.blogs<-setNames(data_frame(en_US.blogs),"text")        
en_US.twitter<-setNames(data_frame(en_US.twitter),"text")        


en_US.news<-mutate(en_US.news,source="news")
en_US.blogs<-mutate(en_US.blogs,source="blogs")
en_US.twitter<-mutate(en_US.blogs,source="twitter")

moadf<-bind_rows(en_US.news, en_US.blogs, en_US.twitter)
moadf<-mutate(moadf,text.length=stri_length(moadf$text))
which.max(moadf$text.length)
moadf[grep("biostats",moadf$text),]

love<-en_US.twitter[grep("love",en_US.twitter$text),]
hate<-en_US.twitter[grep("hate",en_US.twitter$text),]


## Is de taal wel Engels?
install.packages("textcat")
library(textcat)
textcat(en_US.blogs[101])

##
library(tau)
test<-en_US.news[1:10]


## remove e-mail
test2<- gsub("[[:alnum:].-]+@[[:alnum:].-]+"," ",test )


## functie om data verder te stemmen en schonen.


stemData <- function(text){
        corpus <- Corpus(VectorSource(text))
        corpus.stem <- tm_map(corpus, stemDocument, language = "english")  
        corpus.stop <- tm_map(corpus.stem, removeWords, stopwords("english")) 
        corpus.strip <- tm_map(corpus.stop, stripWhitespace)
        x<-data.frame(text=unlist(sapply(corpus.strip, `[`, "content")), stringsAsFactors=FALSE)$text
        return(x)
}



test<-en_US.news[172:175]
test.corpus.stem <- tm_map(test.corpus, stemDocument, language = "english")  
test.corpus.stop <- tm_map(test.corpus.stem, removeWords, stopwords("english")) 
test.corpus.strip <- tm_map(test.corpus.stop, stripWhitespace)
data.frame(text=unlist(sapply(test.corpus.strip, `[`, "content")), stringsAsFactors=F)

writeLines(as.character(test.corpus.stop[[1]]))

## document - term matrix
dtm<-DocumentTermMatrix(test.corpus)
dtm
## number of terms
dtm[[5]]
## inspect
inspect(dtm[1:3, 1:dtm[[5]]])


## converteer tm naar text
text=unlist(sapply(test.corpus, `[`, "content"))


for (i in 1:length(file.names)) assign(file.names[i], readLines(paste0("./final/en_US/",file.names[i])))
        
load_files = function(x){
        n = length(x)
        for(i in 1:n) {
           x<-readLines(paste0("./",x))
        }
}
en_US.news <- readLines("~/BusinessIntelligence/GitHub/Swiftkey/final/en_US/en_US.news.txt")



library(tau)

blogs.sample
news.sample
twitter.sample



blogs.sample.n1 <- textcnt(x = blogs.sample, tolower = TRUE, 
               method = "string", n = 1, decreasing=TRUE)
blogs.sample.n2 <- textcnt(x = blogs.sample, tolower = TRUE, 
                           method = "string", n = 2, decreasing=TRUE)
blogs.sample.n3 <- textcnt(x = blogs.sample, tolower = TRUE, 
                           method = "string", n = 3, decreasing=TRUE)
blogs.sample.n4 <- textcnt(x = blogs.sample, tolower = TRUE, 
                           method = "string", n = 4, decreasing=TRUE)




createNGram <- function(text,n){
                x<-textcnt(x = text, tolower = TRUE, 
                method = "string", n = 1, decreasing=TRUE)
        return(x)
}








barplot(rev(head(blogs.sample.n1, 20)), col = "darkblue", 
        horiz = TRUE, las = 2, main = "Frequency of words")



out <- textcnt(x = test, tolower = TRUE, 
               method = "string", n = 1, decreasing=TRUE)
out <- textcnt(x = test, tolower = TRUE, 
               method = "string", n = 1, decreasing=TRUE)


barplot(rev(out [1:20]), col="blue", las = 2, horiz = TRUE)

barplot(rev(head(out, 20)), col = "darkblue", 
        horiz = TRUE, las = 2, main = "Frequency of Unigrams")

library(wordcloud)
wordcloud(names(out), freq = out, scale=c(10, .75), min.freq = 10, max.words = 20,
          random.order = FALSE, colors = brewer.pal(6,"Dark2"))

barplot(rev(out [1:20]), col="blue", las = 2, horiz = TRUE, main = "Frequency of Unigrams")


saveRDS(en_US.blogs.txt, "en_US.blogs.txt.rds" )
saveRDS(en_US.news.txt, "en_US.news.txt.rds" )
saveRDS(en_US.twitter.txt, "en_US.twitter.txt.rds" )

readRDS(en_US.blogs.txt, "en_US.blogs.txt.rds" )


saveRDS(blogs.sample.stem,"blogs.sample.stem.rds")
saveRDS(news.sample.stem,"news.sample.stem.rds")
saveRDS(twitter.sample.stem,"twitter.sample.stem.rds")



saveRDS(total.n1,"total.n1.rds")
saveRDS(total.n2,"total.n2.rds")
saveRDS(total.n3,"total.n3.rds")
saveRDS(total.n4,"total.n4.rds")



# Quanteda ----------------------------------------------------------------

removeAdditional
## email
grep("[[:alnum:].-]+@[[:alnum:].-]+", sample10, value = TRUE)
grep("@[^\\s]+", sample10, value = TRUE)

1.Read the data from text files into a vector of documents

2.Create a corpus using the vector of documents

3. Tokenize the corpus

4. use ngrams() to create the different ngrams for 1, 2, and 3 token ngrams.

5. To summarize the ngrams into a frequency distribution, unlist the output from ngrams() and use the table() function to summarize into frequencies by ngram.

table(unlist(test2))


## Create a cluster
library(parallel)
library(doParallel)

cluster <- makeCluster(detectCores() - 1)
registerDoParallel(cluster)

# doe je ding


sample10.corpus<-tokenize(sample10, what = "word",removeNumbers = TRUE, removePunct = TRUE, removeSeparators = TRUE, removeHyphens = TRUE, removeAdditional = ("[[:alnum:].-]+@[[:alnum:].-]+"))


## Stop the cluster
stopCluster(cluster)


require(doMC, quiet=TRUE)
require(foreach, quiet=TRUE)
registerDoMC(8) # My home computer has 8 cores
getDoParWorkers()
%do%
        
        
        
        
        
# Create tables -----------------------------------------------------------
table.n3[table.n3$w1=="one"& table.n3$w2=="of" ]$counts
table.n2[table.n2$w1=="one"& table.n2$w2=="of" ]$counts

sum(table.n3[table.n3$w1=="one"]$counts)
sum(table.n2[table.n2$w1=="one" ]$counts)



c<-dplyr::inner_join(table.n2,table.n3, by=c("w1"="w1","w2"="w2"))%>%mutate(mle = counts.y/counts.x)%>%select(w1,w2,w3, text.x, text.y, counts.x, counts.y,mle)



c<-dplyr::inner_join(table.n2,table.n3, by=c("w1"="w1","w2"="w2"))%>%mutate(mle = counts.y/counts.x)%>%select(w1,w2,w3, text.x, text.y, counts.x, counts.y,mle)


## get top x values

setorder(setDT(test), -mle)[, head(.SD, 3), keyby = w1]


test3<-test2 %>% group_by(text.x) %>% mutate (rang = row_number(-smle))
head(test3, 15)
rank1 <-filter(test3, rank==1)
rank1
rank2 <-filter(test3, rank==2)
rank2
rank3 <-filter(test3, rank==3)
rank3
left_join(rank1, rank2, rank3, by = "text.x")
test4<-left_join(rank1, rank2, rank3, by = "text.x")
head(test4)



search.mle.n3[,] %>% group_by(input) %>% mutate (rank = row_number(-smle))})


search.mle.n3[,rank:=rank(-smle,ties.method="first"),by=input]

system.time({test<-search.mle.n3[,rank:=rank(-smle,ties.method="first"),by=input]})