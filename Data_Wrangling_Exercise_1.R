library(tidyr)
library(dplyr)

# 0. Load the data
refine_original <- read.csv("~/Desktop/Springboard/refine_original.csv", header=TRUE, sep=",")

# 1. Clean up brand names
refine_original[[1]] = tolower(refine_original[[1]])

# 2. Separate product code and number
refine_original <- separate(refine_original, Product.code...number, c("product_code","product_number"), sep="-")

# 3. Add product categories

# Create dataframe matching code with category
product_code = c("p","v","x","q")
category = c("Smartphone","TV","Laptop","Tablet")
df = data.frame(product_code, category)

# Join df to refine_original to add categories
refine_original <- left_join(refine_original, df, by="product_code")