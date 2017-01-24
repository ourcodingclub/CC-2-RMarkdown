#######################################################
# Example R Markdown Script                           #
# John Godlee                                         #
# 24/Jan/2017                                         #
#######################################################

# Use this example R script to practice compiling an R Markdown file. 
# Try to make a well commented, easy to follow record of what is going on so that others can easily follow.

# Install and load the relevant packages ----------------------------------------------
library(datasets) # To get the loblolly pine growth data
library(dplyr) # To get summary statistics on the data

# Set your working directory to where you have saved your script
setwd()

# Import data -------------------------------------------------------------
pine_growth <- Loblolly # This data shows the height of pine trees at different ages, from different seed stocks
head(pine_growth)

# Investigating the data ------------------------------------------------------------
# Create a simple scatterplot showing the age-height distribution
# This set of boxplots can be added to your R Markdown document by putting the code in a code chunk
# Try adding some plain text to your R markdown document to explain the histogram
plot(x = pine_growth$age, y = pine_growth$height, xlab = "Age (Years)", ylab = "Height (m)", col=pine_growth$Seed)

# Create boxplots to show how different Seed stocks compare in height distribution
boxplot(height ~ Seed, data = pine_growth)

# Use a pipe to get a table of summary statistics for each Seed type
pine_growth_seedsumm <- pine_growth %>%
  group_by(Seed) %>%
  summarise("Mean Height" = mean(height), "STDEV Height" = sd(height), "Median Height" = median(height))

# Use a pipe to get a table of summary statistics for each Age type
pine_growth_agesumm <- pine_growth %>%
  group_by(age) %>%
  summarise("Mean Height" = mean(height), "STDEV Height" = sd(height), "Median Height" = median(height))

## Make a table of `pine_growth_seedsumm' and `pine_growth_agesumm' in your R markdown document using pander(), the instructions can be found in the tutorial


