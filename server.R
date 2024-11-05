# Load needed libraries
library("ggplot2")
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  # Wrap the code in a reactive expression
  dna_data <- reactive({
    tryCatch({
      
      if (sum(c(input$prob_A, input$prob_T, input$prob_C, input$prob_G)) != 1) {
        dna <- "Sum of probabilities must be 1"
        rna <- ""
        protein <- ""
        base_freqs <- data.frame(dna_vec = factor(c("A", "T", "C", "G")),
                                 Freq = c(0, 0, 0, 0))
      }
      
      else {
        dna <- "The argument to the parameter 'l' has to be divisible by 3"
        rna <- ""
        protein <- ""
        base_freqs <- data.frame(dna_vec = factor(c("A", "T", "C", "G")),
                                 Freq = c(0, 0, 0, 0))
      }
      
      dna <- gene_dna(length = input$n_bases, base_probs = c(input$prob_A,
                                                             input$prob_T,
                                                             input$prob_C,
                                                             input$prob_G))
      
      rna <- transcribe_dna(dna)
      
      protein <- translate_rna(rna)
      
      base_freqs <- base_freqs(dna)
      
    }, error = function(e) {
    })
    
    list(dna = dna, rna = rna, protein = protein, base_freqs = base_freqs)
  })
  
  output$dna <- renderText({
    # Access the reactive values within the renderText expression
    dna_data()$dna
  })
  
  output$rna <- renderText({
    # Access the reactive values within the renderText expression
    dna_data()$rna
  })
  
  output$protein <- renderText({
    # Access the reactive values within the renderText expression
    dna_data()$protein
  })
  
  output$distPlot <- renderPlot({
    data <- dna_data()$base_freqs
    ggplot(data, aes(x = dna_vec, y = Freq, fill = dna_vec)) +
      geom_bar(stat = "identity") +
      labs(x = "Nucleotides", y = "Frequency", title = "Histogram of nucleotides frequencies")
  })
}