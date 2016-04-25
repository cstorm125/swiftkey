shinyServer(
    function(input, output, session) {
        #Reactive prediction
        prediction <- reactive({
            predict.quadmkn(input$fitb)
        })
        #Histogram
        output$histo <- renderPlot({
            g <- ggplot(data=prediction(),aes(x=reorder(pred,-pkn),y=pkn,fill=as.factor(ngram)))
            g <- g + geom_bar(stat='identity')
            g <- g + labs(x='Words Predicted',y='Probability')
            g <- g+ guides(fill=guide_legend(title="N-grams Used"))
            g <- g + theme(axis.text.x = element_text(angle = 45, hjust = 1))
            g
        })
        #Word Cloud
        output$cloud <- renderPlot({
            wordcloud(prediction()$pred,prediction()$pkn, max.words = 100, 
                      colors = brewer.pal(6, "Dark2"), scale = c(8, .5))
        })
        #Suggestions
        rvs <- reactiveValues(buttons = list(actionButton(inputId = "button1",
                                                          label = 1)))
        #observe when input changes
        observeEvent(eventExpr = input$fitb,
                     handlerExpr = {
                         len <- length(unique(prediction()$pred))
                         for (i in 1:len){
                             rvs$buttons[[i]] <- actionButton(inputId = paste0("button",i),
                                                                label = unique(prediction()$pred)[i])
                         }
                     })
        #render buttons
        output$suggestions <- renderUI({
            rvs$buttons
        })
        #add observeEvent to buttons
        for(ii in 1:10){
            local({
                i <- ii
                observeEvent(eventExpr = input[[paste0("button",i)]],
                             handlerExpr = {updateTextInput(session,'fitb',
                            value=paste(input$fitb,unique(prediction()$pred)[i]))})
            })
        }

})

