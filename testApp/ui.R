library(shiny)

# Define UI for application predicts next words
shinyUI(fluidPage(
                # Set the title of the page
                titlePanel("Coursera Data Science Capstone - Next word prediction"),
                
                sidebarPanel(
                        textInput("text", "Enter a partial sentence here...", value = "this is a partial sentence"),
                        actionButton("do", "Predict Next Word", icon("question-circle"),
                                     style = "color: #fff; background-color: #337ab7; border-color: #2e6da4"),
                        hr(),
                        h4('Results'),
                        p("The first predicted word is: ", verbatimTextOutput("txt1"),
                        p("The second predicted word is: ", verbatimTextOutput("txt2"),
                        p("The third predicted word is: ", verbatimTextOutput("txt3"))))),
                
                mainPanel(
                        tabsetPanel(type = "tabs",
                                tabPanel("Instructions",
                                         h4("Explanation"),
                                         "This app predicts the next words of a partial sentence, using a prediction model based on uni-, bi and trigrams. It applies a simple back-off strategy: if it can't predict the next word using tri-grams, it will try to predict the word based on bi-grams. If this doesn't succceed, it will predict the next word using uni-grams. The app returns up to three words with the highest maximum likelihood estimates. It returns NA for the second an/or third words if it can predict just one or two words.",
                                         
                                         hr(),                
                        h4('How to use this app:'),
                                'Using this app is pretty straightforward:',
                                 tags$ol(
                                        tags$li('Enter a partial sentence in the text input box in the sidebar panel'),
                                        tags$li('Hit the <Predict Next Word> button'),
                                        tags$li('Read the predicted words below')
                                ),hr()),
                           
                             tabPanel("Model & Data",
                                h4('Model'),
"One of the goals of the capstone project was to build a predictive text model. The model is used in this Shiny app predicts the next word of an input phrase based on quadri-, tri-, bi- and unigrams. For all n-grams maximum likelihood estimates were calculated",tags$em(" (before filtering!) " ),
" and using a simple back-off strategy, this app returns up to three words with the highest calculated MLE.",
hr(),
h4('Data'),
"A dataset was provided for building the model. It consists of three files with text from tweets, blog posts and news feeds in several languages.", 
                                      tags$br(),
                                      tags$br(),
                                "For this model the three files with English texts were used:", 
                                tags$br(),                     
                tags$code("en_US.blogs.txt"),' containing the blog posts', 
                tags$br(),
                tags$code("en_US.news.txt"),' with the news feeds',  
                tags$br(),
                tags$code("en_US.twitter.txt"),' with tweets', 
                tags$br(),
                hr(),
                "From these three files a 50% sample was used to build uni-, bi-, tri- and quadrigrams.",
                "The dataset for this apps uses n-grams that occur at least 5 times in order to keep the dataset as concise as possible and to improve app performance.",
                hr()
                )
                                         )   
                ))
)
