library(shiny)
library(reactR)
library(rfabric)
library(colorpicker)
library(ggplot2)
library(hrbrthemes)

ui <- fluidPage(
    fluidRow(
        column(
            4,
            colorpickerInput("color", default = "#489489")
        ),
        column(
            8,
            plotOutput("plot")
        )
    )
)

server <- function(input, output, session) {
    df <- data.frame(x = 1:10, y = 1:10)
    
    output$plot <- renderPlot({
        ggplot(df, aes(x,y)) +
            geom_point(size = 4, color = input$color) +
            labs(title = "ggplot2 chart controlled with React") +
            theme_minimal()
    })
    
}

shinyApp(ui, server)