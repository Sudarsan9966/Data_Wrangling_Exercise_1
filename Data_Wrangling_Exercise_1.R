library(tidyr)
library(dplyr)

# 0. Load the data
refine_original <- read.csv("~/Desktop/Springboard/refine_original.csv", header=TRUE, sep=",")
refine_clean <- refine_original

# 1. Clean up brand names
refine_clean$company <- tolower(refine_clean$company)
refine_clean$company <- gsub("(ph|f)(i|l){2,4}ps", "philips", refine_clean$company)
refine_clean$company <- gsub("ak\\s{0,1}z(0|o)", "akzo", refine_clean$company)
refine_clean$company <- gsub("unilver", "unilever", refine_clean$company)

# 2. Separate product code and number
# 3. Add product categories
# 4. Add full address for geocoding
refine_clean <- refine_clean %>% 
  separate(Product.code...number, c("product_code","product_number"), sep="-") %>% 
  mutate(product_category = ifelse(product_code %in% "p", "Smartphone", 
                                   ifelse(product_code %in% "v", "TV", 
                                          ifelse(product_code %in% "x", "Laptop", 
                                                 ifelse(product_code %in% "q", "Tablet", "Other"))))) %>% 
  mutate(full_address = paste(address, city, country, sep = ", "))

# 5. Create dummy variables for company and product category
