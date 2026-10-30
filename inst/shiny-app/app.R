
library(shiny)
library(ggplot2)
library(dplyr)

# Load package data
data("bushfire_risk", package = "bushfireexplorer")

ui <- fluidPage(
    tags$head(
      tags$link(
        rel = "stylesheet",
        type = "text/css",
        href = "style.css"
      )
    ),
  
  titlePanel("Australian Bushfire Weather Risk Explorer"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      h4("Explore the research findings"),
      
      selectInput(
        "indicator",
        "Select a risk indicator:",
        choices = unique(bushfire_risk$indicator),
        selected = "Extreme fire weather"
      ),
      
      selectInput(
        "scenario",
        "Select a climate scenario:",
        choices = NULL
      ),
      
      helpText(
        "Choose an indicator and scenario to explore the reported findings."
      )
    ),
    
    mainPanel(
      
      h3("Bushfire weather risk findings"),
      
      p(
        "Explore how climate change is associated with
        changes in extreme bushfire weather risk."
      ),
      
      uiOutput("plot_section"),
      
      h4("Research findings"),
      
      tableOutput("risk_table"),
      
      h4("Interpretation"),
      
      div(
        class = "info-card",
        textOutput("interpretation")
      ),
      
      h4("Important limitations"),
      
      div(
        class = "info-card",
        textOutput("limitations")
      )
    )
  )
)

server <- function(input, output, session) {
  
  # Update scenarios according to selected indicator
  observeEvent(input$indicator, {
    
    scenarios <- bushfire_risk %>%
      filter(indicator == input$indicator) %>%
      pull(scenario) %>%
      unique()
    
    updateSelectInput(
      session,
      "scenario",
      choices = scenarios,
      selected = scenarios[1]
    )
  }, ignoreInit = FALSE)
  
  # Filter data using the package function
  filtered_data <- reactive({
    
    req(input$indicator, input$scenario)
    
    summarise_risk(
      bushfire_risk,
      selected_indicator = input$indicator,
      selected_scenario = input$scenario
    )
  })
  
  # Display probability ratio plot
  output$plot_section <- renderUI({
    
    plot_data <- filtered_data() %>%
      filter(!is.na(ratio_value))
    
    if (nrow(plot_data) == 0) {
      
      tagList(
        h4("Qualitative research finding"),
        div(
          class = "qualitative-card",
          p(
            "No numerical estimate is available for this finding."
          ),
          p(
            "The research reports a qualitative conclusion
          rather than a probability ratio or numerical estimate."
          )
        )
      )
      
    } else {
      
      plotOutput("risk_plot")
      
    }
  })
  
  # Display numerical estimates as a bar chart
  output$risk_plot <- renderPlot({
    
    plot_data <- filtered_data() %>%
      filter(!is.na(ratio_value))
    
    validate(
      need(
        nrow(plot_data) > 0,
        "No numerical estimates are available."
      )
    )
    
    ggplot(
      plot_data,
      aes(
        x = estimate_type,
        y = ratio_value
      )
    ) +
      geom_col(
        fill = "#287C8E",
        width = 0.65
      ) +
      geom_text(
        aes(
          label = paste0(ratio_operator, ratio_value, "x")
        ),
        vjust = -0.5,
        size = 4
      ) +
      labs(
        x = "Estimate type",
        y = "Reported probability ratio",
        title = "Reported changes in bushfire weather risk"
      ) +
      theme_minimal(base_size = 13) +
      theme(
        axis.text.x = element_text(
          angle = 20,
          hjust = 1
        )
      )
  })
  
  
  # Display selected research findings
  output$risk_table <- renderTable({
    
    filtered_data() %>%
      select(
        evidence_type,
        estimate_type,
        finding
      )
    
  })
  
  # Display interpretation
  output$interpretation <- renderText({
    
    findings <- filtered_data()
    
    if (nrow(findings) == 0) {
      return("No findings are available for this selection.")
    }
    
    paste(unique(findings$finding), collapse = " ")
  })
  
  
  # Display limitations
  output$limitations <- renderText({
    
    findings <- filtered_data()
    
    paste(
      unique(findings$limitation),
      collapse = " "
    )
  })
}

shinyApp(ui = ui, server = server)
