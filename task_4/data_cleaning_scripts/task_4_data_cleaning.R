library(tidyverse)
library(janitor)
library (here)
library (readxl)

# Importing our raw data

candy_2015 <- read_excel(here::here('raw_data/candy_ranking_data/boing-boing-candy-2015.xlsx'))
candy_2016 <- read_excel(here::here('raw_data/candy_ranking_data/boing-boing-candy-2016.xlsx'))
candy_2017 <- read_excel(here::here('raw_data/candy_ranking_data/boing-boing-candy-2017.xlsx'))

# performing the first clean on the columns names

first_clean_2015 <- clean_names(candy_2015)
first_clean_2016 <- clean_names(candy_2016)
first_clean_2017 <- clean_names(candy_2017)

names(first_clean_2015)
col_names_2015 <- colnames(first_clean_2015)
col_names_2016 <- colnames(first_clean_2016)
col_names_2017 <- colnames(first_clean_2017)

# extracting all the clean columns names

col_names_2015
col_names_2016
col_names_2017

# performing the second cleam by removing information that are not related to food. # df <- mydata[ -c(1,3:4) ]

second_clean_2015 <- first_clean_2015[ -c(16,18,23,26,33,38,41,45,57,69,71,82,85,88,93,94,95,97:114,116:124) ]
second_clean_2015

second_clean_2016 <- first_clean_2016[ -c(21,22,26,27,31,41,46,48,49,71,79,90,94,101,102,104,105,107:122) ]
second_clean_2016

second_clean_2017 <- first_clean_2017[ -c(12,21,22,26,27,31,43,46,48,49,68,69,72,81,92,96,104,105,107,108,112:120) ]
second_clean_2017

col_names_reduced_2015 <- colnames(second_clean_2015)
col_names_reduced_2016 <- colnames(second_clean_2016)
col_names_reduced_2017 <- colnames(second_clean_2017)names(first_clean_2017)

col_names_2015 <- colnames(first_clean_2015)
col_names_2016 <- colnames(first_clean_2016)
col_names_2017 <- colnames(first_clean_2017)

col_names_2015
col_names_2016
col_names_2017

# df <- mydata[ -c(1,3:4) ]

second_clean_2015 <- first_clean_2015[ -c(16,18,23,26,33,38,41,45,57,69,71,82,85,88,93,94,95,97:114,116:124) ]
second_clean_2015

second_clean_2016 <- first_clean_2016[ -c(21,22,26,27,31,41,46,48,49,71,79,90,94,101,102,104,105,107:122) ]
second_clean_2016

second_clean_2017 <- first_clean_2017[ -c(12,21,22,26,27,31,43,46,48,49,68,69,72,81,92,96,104,105,107,108,112:120) ]
second_clean_2017

col_names_reduced_2015 <- colnames(second_clean_2015)
col_names_reduced_2016 <- colnames(second_clean_2016)
col_names_reduced_2017 <- colnames(second_clean_2017)



# Assumption made in dataset:

## we are keeping only information related to food.