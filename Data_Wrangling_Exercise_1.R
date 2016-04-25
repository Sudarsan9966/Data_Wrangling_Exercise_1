library(tidyr)
library(dplyr)

# Load the data
refine_original <- read.csv("~/Desktop/Springboard/refine_original.csv", header=TRUE, sep=",")

# Clean up brand names
refine_original[[1]] = tolower(refine_original[[1]])

# Separate product code and number
separate(refine_original, Product.code...number, c("product_code","product_number"), sep="-")