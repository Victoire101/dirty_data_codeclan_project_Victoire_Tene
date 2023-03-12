library(janitor)
library(tidyverse)
library(here)

decathalon <- read_rds(here::here("raw_data/decathlon.rds"))


# cleaning the columns names using the clean_names function
decathalon_first_clean <- clean_names(decathalon) 
names(decathalon_first_clean)

# to view the data
glimpse (decathalon_first_clean) 

# detect row names
has_rownames(decathalon_first_clean) 

# remove row names
decathalon_row_remove  <- remove_rownames(decathalon_first_clean) 

# remove the x from columns name and combining  new names with the dataset 
##names(decathalon_row_remove) <- sub('^x', '', names(decathalon_row_remove)) 

# new dataframe without the x in columns names
##decathalon_row_remove 
head (decathalon_row_remove)

#check missing value
complete.cases(decathalon_row_remove)
 summary(decathalon_row_remove)
 
# saving my clean data to the clean_data folder
 
 decathalon_clean <- decathalon_row_remove
 
write.csv(decathalon_clean, "clean_data/decathalon_clean.csv", row.names = FALSE)
decathalon_clean 
 
