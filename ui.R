## Libraries
library("bslib")


# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("Small Shiny app by Group20 : Virtual Central Dogma")
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 0,
                  max = 60,
                  value = 30,
                  step = 3,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      ))),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene output (DNA)"),
      mainPanel(
        verbatimTextOutput(outputId = "dna")
      )
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Gene Transcription output (RNA)"),
      mainPanel(
        verbatimTextOutput(outputId = "rna")
      )
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Gene Translation output (Protein)"),
      mainPanel(
        verbatimTextOutput(outputId = "protein")
      )
    )),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Base Distribution Plot"),
      mainPanel(
        plotOutput(outputId = "distPlot")
      )
    )),
  
  
)
