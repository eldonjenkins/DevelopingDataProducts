library(shiny)
library(UsingR)
data(babies)
fit <- lm(wt ~ ht + gestation + race + ed + marital + smoke, babies)
predictwt <- function(inputs) {predict(fit,inputs)}

shinyServer(
     function(input,output) {
          output$ht <- renderText({input$ht})
          output$gestation <- renderText({input$gestation})

          output$race <- renderText({
               if (input$race == "0") {
                    ret <- "White"
               } else if (input$race == "6") {
                    ret <- "Mexican"
               } else if (input$race == "7") {
                    ret <- "Black"
               } else if (input$race == "8") {
                    ret <- "Asian"
               } else if (input$race == "9") {
                    ret <- "Mixed"
               } else {
                    ret <- "Unknown"
               }
          })
          
          output$ed <- renderText({
               if (input$ed == "0") {
                    ret <- "7th Grade"
               } else if (input$ed == "1") {
                    ret <- "8th-12th - did not graduate"
               } else if (input$ed == "2") {
                    ret <- "High School Graduate"
               } else if (input$ed == "3") {
                    ret <- "HS Grade + Trade School"
               } else if (input$ed == "4") {
                    ret <- "HS + Some College"
               } else if (input$ed == "5") {
                    ret <- "College Graduate"
               } else if (input$ed == "6") {
                    ret <- "Trade School - HS Unknown"
               } else {
                    ret <- "Unknown"
               }
          })
          
          output$marital <- renderText({
               if (input$marital == "1") {
                    ret <- "Married"
               } else if (input$marital == "2") {
                    ret <- "Legally Separated"
               } else if (input$marital == "3") {
                    ret <- "Divorced"
               } else if (input$marital == "4") {
                    ret <- "Widowed"
               } else {
                    ret <- "Never Married"
               }
          })
          
          output$smoke <- renderText({
               if (input$smoke == "0") {
                    ret <- "Never"
               } else if (input$smoke == "1") {
                    ret <- "Currently Smokes"
               } else if (input$smoke == "2") {
                    ret <- "Smoked Until Current Pregnancy"
               } else if (input$smoke == "3") {
                    ret <- "Once dide, not now"
               } else {
                    ret <- "Unknown"
               }
          })
          
          output$prediction <- renderText({predictwt(data.frame(ht=input$ht, gestation=input$gestation, race=as.numeric(input$race), ed=as.numeric(input$ed), marital=as.numeric(input$marital), smoke=as.numeric(input$smoke)))})

     }     
)