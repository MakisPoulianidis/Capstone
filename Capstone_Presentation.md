Coursera Data Science Capstone Project
========================================================
author: Makis Poulianidis 
date: 18-04-2016

Assignment
========================================================

The Coursera Data Science capstone project had several objectives:
- analyse a large datset
- build a predictive text model
- create an app using the predictive text model

The results of the analysis can be found in my milestone report:  https://rpubs.com/Bankbintje/163211

The next word predicition app using the predictive model can be found at shinyapps.io: https://bankbintje.shinyapps.io/Coursera_Capstone_predictApp/


Dataset
========================================================

The dataset provided for the capstone consists of three files with text from tweets, blog posts and news feeds in several languages. For this model the three files with English texts were used: 
- ```en_US.blogs.txt``` containing the blog posts
- ```en_US.news.txt``` with the news feeds 
- ```en_US.twitter.txt``` with tweets 

From these three files a 50% sample was used to build uni-, bi-, tri- and quadrigrams.

The app uses n-grams that occur at least 5 times in order to keep the dataset as concise as possible and to improve app performance.

Prediction
========================================================
The app returns the most likely next words of a partial sentence, using a prediction model based on uni-, bi, tri- and quadrigrams. 

The app returns up to three words with the highest maximum likelihood estimates. 

It returns NA for the second an/or third words in situations where the model can predict just one or two words.

A simple back-off strategy is used: if no next word can be predicted using tri-grams, it will try to predict the next word based on bi-grams. If this also doesn't succceed, it will predict the next word using uni-grams. 


Shiny App
========================================================

Using the Shiny app is pretty straightforward:
- Enter a partial sentence in the text input box in the sidebar panel
- Hit the ```<Predict Next Word>``` button

The app then returns up to three predicted words in the sidebar panel.

                                
The code for the app, the milestone report, all scripts, this presentation and the data are available at my GitHub repository: https://github.com/MakisPoulianidis/Capstone 





