#Coding Club Workshop 7 R Markdown and reproducible code - Template R script
#Written by John Godlee
#21/11/16 
#University of Edinburgh

# Use this example R script to practice compiling an R Markdown file, using the tutorial materials provided at:
ourcodingclub.github.io

# Follow through the tutorial to make a well commented, easy to follow record of what is going on so that others can easily follow.

#Packages
library(dplyr)

#We will be using the biodiversity data from the first Tutorial
setwd("")
edidiv <- read.csv("edidiv.csv")

#As before, we are going to construct a table of how many species occur in each taxonomic group
#But in a much less verbose way
richness <- 
  edidiv %>%
    group_by(taxonGroup) %>%
    summarise(Species_richness = n_distinct(taxonName))

richness

#Create a barplot
barplot(richness$Species_richness, 
        names.arg = richness$taxonGroup, 
        xlab="Taxa", ylab="Number of species", 
        ylim=c(0,600)
        ) 

#This time we also want to find the most common species in each taxonomic group
max_abund <-
  edidiv %>%
    group_by(taxonGroup) %>%
    summarise(taxonName = names(which.max(table(taxonName))))

#Join the two data frames together, using "taxonGroup" as the reference
richness_abund <-
inner_join(richness, max_abund, by = "taxonGroup")
richness_abund <- rename(richness_abund, Most_abundant =  taxonName, Taxon = taxonGroup)

#What does the data frame look like now?
richness_abund

#Experiment using the information given in the tutorial to create a story about what is going on in this R script or any other script that you have access to 
#Things to think about:
  # - Which bits of code need to be displayed in the final .html file?
  # - How can the formatting of the R markdown file be improved?


