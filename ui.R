# Define UI
shinyUI(
  dashboardPage(
    skin = "green",
    dashboardHeader(title = tags$strong('Opioid Prescriptions')),
    dashboardSidebar(tags$blockquote('An opiod epidemic has swept across the United States in recent years.
                                     Most people are likely within two degrees of separation from somebody 
                                     impacted by the epidemic. The problem may start with prescription
                                     opioids. This dashboard shows data from a 2014 survey of 25,000
                                     doctors. It displays state with the most of least prescriptions per
                                     100,000 for specific drugs.')),
    dashboardBody(
      fluidRow(
        column(width = 3,
               box(
                 title = "Opioid", status = "primary", solidHeader = TRUE, height = 175,
                 "Select an opioid to see where opioids are prescribed more frequently", width=NULL, 
                 selectInput("opioid", 
                             label = "Opioid:", 
                             choices = opioids,
                             selected = 'Fentanyl')
               ),
               box(
                 title = "Highest Prescriptions Per 100,000", status = "danger", solidHeader = TRUE, width=NULL,
                 tableOutput('table_top'), height = 250
               ),
               box(
                 title = "Lowest Prescriptions Per 100,000", status = "success", solidHeader = TRUE, width=NULL,
                 tableOutput('table_bottom'), height = 250
               )
        ),
        column(width = 9,
               box(
                 title = "Prescriptions Per 100,000 People in 2014" , status = "success", 
                 solidHeader = TRUE, width = NULL,
                 plotOutput("prescription_map", height = 600)
               )
        )
      )    
    )
    )
  )

