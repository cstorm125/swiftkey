library(data.table)
library(quanteda)
library(wordcloud)
library(shiny)
library(shinydashboard)
library(ggplot2) #graphs

#Load data; total 65.8MB
d1 <- readRDS('data/d1.RDS') #0.3MB
d2 <- readRDS('data/d2.RDS') #7MB
d3 <- readRDS('data/d3.RDS') #22.4MB
d4 <- readRDS('data/d4.RDS') #36.1MB

#Prediction function
predict.quadmkn <- function (words) {
    words <- tail(tokenize(toLower(words),
                           removeNumbers=TRUE,
                           removePunct=TRUE,
                           removeTwitter = TRUE,
                           simplify=TRUE),3)
    word1_word2_word3 <- paste(tail(words,3),collapse = ' ')
    quad <- head(d4[w1w2w3==word1_word2_word3,c('pred','pkn','ngram'),with=FALSE])
    word2_word3 <- paste(tail(words,2),collapse = ' ')
    tri <- head(d3[w1w2==word2_word3,c('pred','pkn','ngram'),with=FALSE])
    word3 <- tail(words,1)
    bi <- head(d2[w1==word3,c('pred','pkn','ngram'),with=FALSE])
    uni <- head(d1)
    result <- rbind(quad,tri,bi,uni)
    head(result,10)
}