#### Load packages ----
library(shiny)
library(tidyverse)

#### Load data ----
nutrient_data <- read_csv("Data/NTL-LTER_Lake_Nutrients_PeterPaul_Processed.csv")
nutrient_data$sampledate <- as.Date(nutrient_data$sampledate, format = "%Y-%m-%d")
nutrient_data <- nutrient_data %>%
  filter(depth_id > 0) %>%
  select(lakename, sampledate:po4)

#### Define UI ----
ui <- fluidPage( # fluid page means the data will change shape and size based on the window/interface
  titlePanel("Nutrients in Peter Lake and Paul Lake"), # title
  sidebarLayout( # side bar, drop down to choose parameter
    sidebarPanel( # side bar panel (one option, see <> for more options)
      
      
      # Select nutrient to plot
      ## selectInput = input in server function 
        # we call it 'y', and the choices (aka components) are tn_ug, tp_ug, etc.
      selectInput(inputId = "y", # select input = drop down menu in side bar (widget gallery site has more options)
                  label = "Nutrient", # label for drop down
                  choices = c("tn_ug", "tp_ug", "nh34", "no23", "po4"), # options in drop down (these options = data col names)
                  selected = "tp_ug"), # first one/default that shows when app is opened
  
      ),

    # Output
    ## plotOutput = output in server function
    mainPanel( # panel in the middle
      plotOutput("scatterplot") # telling it we want to plot the output, we want a scatterplot
    )))

#### Define server  ----
server <- function(input, output) {
     
    # Create a ggplot object for the type of plot you have defined in the UI  
       output$scatterplot <- renderPlot({
         # where does output$scatterplot come from..
          ## it knows we're pointing to PlotOutput (defined above, in UI section)
        ggplot(nutrient_data, 
               aes_string(x = "sampledate", y = input$y, 
                          fill = "depth_id", shape = "lakename")) + 
           # static parts = in quotes (x axis, fill, shape)
          geom_point(alpha = 0.8, size = 2) +
          theme_classic(base_size = 14) +
          scale_shape_manual(values = c(21, 24)) +
          labs(x = "Date", y = expression(Concentration ~ (mu*g / L)), shape = "Lake", fill = "Depth ID") +
          scale_fill_distiller(palette = "YlOrBr", guide = "colorbar", direction = 1)
          #scale_fill_viridis_c(option = "viridis", begin = 0, end = 0.8, direction = -1)
      })
       
       
  }


#### Create the Shiny app object ----
shinyApp(ui = ui, server = server)

## ..we can define different uis and servers, throw them into the same function, and it will spit out 
## same app template/settings but with different data? 


