library(tidyverse)
library(janitor)
library (here)
library (readxl)

candy_2015 <- read_excel(here::here('raw_data/candy_ranking_data/boing-boing-candy-2015.xlsx'))
head(candy_2015)
glimpse(candy_2015)
