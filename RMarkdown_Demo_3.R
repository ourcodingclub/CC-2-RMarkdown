#######################################################
# Example R Markdown Script                           #
# John Godlee                                         #
# 24/Jan/2017                                         #
#######################################################

# Use this example R script to practice compiling an R Markdown file. 
# Try to make a well commented, easy to follow record of what is going on so that others can easily follow.

# Download the data set for this example script from:
https://github.com/ourcodingclub/Datasets/tree/master/Seedling_Traits

# Install and load the relevant packages ----------------------------------------------
library(dplyr) # To get summary statistics on the data

# Set your working directory to the folder where you have downloaded the datasets
setwd()

# Import data -------------------------------------------------------------
seedlings <- read.csv("Seedling_Elevation_Traits.csv")

# Investigating the data ------------------------------------------------------------
# Create a scatterplot showing the relationship between `Soil.temp.mean' and `Elevation.m'
# This scatterplot can be added to your R Markdown document by putting the code in a code chunk
# Try adding some plain text to your R markdown document to explain the histogram
plot(x = seedlings$Elevation.m, y = seedlings$Soil.temp.mean)

# Create a set of boxplots showing how `Leaf.thickness.mean.mm' varies by `Species'
boxplot(Leaf.thickness.mean.mm ~ Species, 
        col=c("red", "blue", "green", "yellow", "pink", "violet", "orange", "grey", "brown"), data = seedlings)

# Use a pipe to get a table of summary statistics for each Species type

seedlings_specsumm <- seedlings %>%
  group_by(Species) %>%
  summarise("Mean Leaf Thickness" = mean(Leaf.thickness.mean.mm), "Mean Stem Width" = mean(Width.mm), "Mean SPAD" = mean(SPAD.mean))

# Use a pipe to get a table of summary statistics for each Site

seedlings_sitesumm <- seedlings %>%
  group_by(Site) %>%
  summarise("Mean Soil Temp." = mean(Soil.temp.mean), "Mean Elevation" = mean(Elevation.m), "Undergrowth density" = mean(Num.seedlings.comp))

## Make a table of `seedlings_specsumm' and `seedlings_specsumm' in your R markdown document using pander(), the instructions can be found in the tutorial

