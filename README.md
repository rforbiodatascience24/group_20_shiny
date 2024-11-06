# Virtual Central Dogma 

## Description
The Virtual Central Dogma is a Shiny app that simulates the central dogma of molecular biology: the flow of genetic information from DNA to RNA to protein. This app provides users with an interactive way to generate DNA sequences, transcribe them to RNA, and translate the RNA into proteins based on user-defined parameters.

## Usage
1. Set DNA Length: Use the slider to specify the length of the DNA sequence.
2. Set Base Probabilities: Use the numeric inputs to set the probabilities for each base (A, T, C, G).
3. View Output: The DNA, RNA, and protein sequences will appear in addition with a base frequency plot.

## Code Structure
- UI: The User Interface (UI) is built using the page_fluid() layout with layout_columns() and card() components for organization. It includes input controls and display panels.
- Server: The server logic handles DNA generation, RNA transcription, protein translation and plotting the base frequencies.
- Functions:
    - gene_dna(): Generates a random DNA sequence based on length and nucleotide probabilities.
    - transcribe_dna(): Converts DNA to RNA by replacing "T" with "U".
    - translate_rna(): Translates RNA to protein by grouping codons and mapping them to amino acids.
    - base_freqs(): 

## Contribution
Lea Eschen Skytthe, s203531, contact: s203531@dtu.dk

Trine Søgaard, s204655, contact: triso@dtu.dk 

Amy Surry, s201902, contact: s201902@dtu.dk

Olivier Gaufres, s243252, contact: s243252@dtu.dk

Antoine Andreoletti, s242830, contact: s242830@dtu.dk
