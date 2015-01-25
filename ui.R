library(shiny)
library(UsingR)

shinyUI(
     pageWithSidebar(
          headerPanel("Developing Data Products - Course Project"),
          sidebarPanel(
               h3("Birth Weight Prediction Criteria:"),
               numericInput('ht','Mothers Height in Inches (min 64, max 72)', 64, min = 53, max = 72, step=1),
               numericInput('gestation','Length of Gestation in Days (min 148, max 353)', 280, min = 148, max = 353, step = 1),
               selectInput('race', 'Mother\'s Race', choices = c('White'=0,'Mexican'=6, 'Black'=7,'Asian'=8,'Mixed'=9,'Unknown'=99)),
               selectInput('ed', 'Mother\'s Highest Education', choices = c('7th Grade'=0, '8th-12th - did not graduate'=1,'High School Graduate'=2,'HS Grade + Trade School'=3,'HS + Some College'=4,'College Graduate'=5,'Trade School - HS Unknown'=6,'Unknown'=9)),
               selectInput('marital', 'Marital Status', choices = c('Married'=1,'Legally Separated'=2,'Divorced'=3,'Widowed'=4,'Never Married'=5)),
               selectInput('smoke', 'Does the Mother Smoke?', choices = c('Never'=0, 'Currently Smokes'=1,'Smoked Until Current Pregnancy'=2,'Once did, not now'=3,'Unknown'=9)),
               submitButton('Submit')
          ),
          mainPanel(
               h3('Prediction Results:'),
               h4('You entered the following details:'),
               h4('Mother\'s Height:'),
               verbatimTextOutput("ht"),
               h4('Gestation Period:'),
               verbatimTextOutput("gestation"),
               h4('Mother\'s Race:'),
               verbatimTextOutput("race"),
               h4('Mother\'s Education:'),
               verbatimTextOutput("ed"),
               h4('Marital Status:'),
               verbatimTextOutput("marital"),
               h4('Does Mother Smoke:'),
               verbatimTextOutput("smoke"),
               h4('Predicted Weight in Ounces: '),
               verbatimTextOutput("prediction")
          )
     )     
     
)