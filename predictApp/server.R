library(shiny)

## Load the source with the prdict functions
source('predict.R')
path <- "./data"
##bigram <- readRDS(paste0(path,"/smle.n2.join.rds",sep = ""))
##trigram <- readRDS(paste0(path,"/smle.n3.join.rds",sep = ""))
##quadrigram <- readRDS(paste0(path,"/smle.n4.join.rds",sep = ""))

# Define server logic required to predict words
shinyServer(function(input, output) {
        
        #define an event 
        observeEvent(input$do, {
        
        ## call the function predictWord from the source 'predict.R'
        x<-predictWord(input$text)
        
        ## store the first word in txt1
        output$txt1 <- renderText({x[2]})
        
        ## store the second word in txt2
        output$txt2 <- renderText({x[3]})

        ## store the third word in txt3
        output$txt3 <- renderText({x[4]})
        })
})