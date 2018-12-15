# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$prescription_map <- renderPlot({
    
    # filter drug_counts dataset by the state selected
    # data <- drug_counts %>% 
    #     filter(State == input$state)
    # 
    data <- prescriptions_per_hundred_thousand %>% 
      select(State, input$opioid) %>% 
      rename(state = 1)
    oname = input$opioid
    top <- data
    bottom <- data
    
    top5 <- top[order(top[,2], decreasing = TRUE),] %>% 
      top_n(5) %>% 
      rename(State = 1)
    
    bottom5 <- bottom[order(bottom[,2], decreasing = FALSE),] %>% 
      top_n(-5) %>% 
      rename(State = 1)
    
    output$table_top <- renderTable(top5)
    output$table_bottom <- renderTable(bottom5)
    
    # create plot from filtered data
    plot_usmap(data = data, values = input$opioid, lines = "white") + 
      scale_fill_continuous(low = "powderblue", high = "navy", name = "Prescriptions Per \n100,000 People", 
                            label = scales::comma) + 
      theme(legend.position = "right", legend.key.size = unit(1.75, "cm"), 
            legend.text = element_text(size = 14, face = 'bold'), legend.title=element_text(size=16, face = 'bold'))
    
  })
  
})


