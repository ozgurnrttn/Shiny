library(shiny)

ui <- fluidPage(
    
    titlePanel("Iris Veri Seti"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "Degisken",
                        label = "Bir degisken seciniz",
                        choices = c("Sepal.Legnth" = 1,
                                    "Sepal.Whith" = 2,
                                    "Pethal.Legth" = 3,
                                    "Pethal.Width" = 4)),
            sliderInput(inputId = "Aralik",
                        label = "Bir aralik seciniz",
                        min =5 ,  max = 25, value = 15),
            
            
            
            radioButtons(inputId = "Renk",
                         label = "Grafigin rengini seciiniz",
                         choices = c("Green", "Red", "Yellow"),
                         selected = "Green")),
        
        mainPanel(
            
            tabsetPanel(type = "tab",
                        tabPanel(title = "Ozet Tablo",
                                  verbatimTextOutput("ozet_tablo")),
                        tabPanel(title = "Verinin Yapisi",
                                 verbatimTextOutput("str")),
                        tabPanel(title = "Veri",
                                 tableOutput("veri")),
                        tabPanel(title = "Histogram",
                                 plotOutput("Histogram")),
                        tabPanel(title = "Box Plot",
                                 plotOutput("boxplot"))
                        )
        )
    )
)

server <- function(input, output, session) {
   
    output$ozet_tablo <- renderPrint({
        
        summary(iris)
    }) 
    
    output$str <- renderPrint({
        str(iris)
    })
    
    output$veri <- renderTable({
        
        iris[]
        
#output$veri <- renderTable({
            
           # colm <- as.numeric(input$degisken)
            #iris[,colm] "Veride sadece seçili degisken için kullanilir"
    })
    
    output$Histogram <- renderPlot({
        
        colm <- as.numeric(input$degisken)
        hist(iris[,colm],
             breaks = seq(0,l = input$aralik),
             col = input$renk,
             xlab = "Aralik")
    })
    
    output$boxplot <- renderPlot({
        
        colm <- as.numeric(input$degisken)
        boxplot(iris[,colm],
                col = input$renk,
                xlab = Variable)
    
    })
    
}  

shinyApp(ui, server)