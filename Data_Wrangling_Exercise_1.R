library(tidyr)
library(dplyr)

# 0. Load the data
refine_original <- read.csv("~/Desktop/Springboard/refine_original.csv", header=TRUE, sep=",")
refine_clean <- refine_original

# 1. Clean up brand names
refine_clean$company <- tolower(refine_clean$company)

# 2. Separate product code and number
refine_clean <- separate(refine_clean, Product.code...number, c("product_code","product_number"), sep="-")

# 3. Add product categories

# Create dataframe matching code with category
product_code = c("p","v","x","q")
category = c("Smartphone","TV","Laptop","Tablet")
df = data.frame(product_code, category)

# Join df to refine_original to add categories
refine_clean <- left_join(refine_clean, df, by="product_code")

# 4. Add full address for geocoding
refine_clean <- mutate(refine_clean, full_address = paste(address, city, country, sep = ", "))