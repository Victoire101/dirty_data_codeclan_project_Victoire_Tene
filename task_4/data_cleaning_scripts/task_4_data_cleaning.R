library(tidyverse)
library(janitor)
library (here)
library (readxl)
library (sqldf)

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

# performing the second cleam by removing information that are not related to candy. # df <- mydata[ -c(1,3:4) ]

second_clean_2015 <- first_clean_2015[ -c(16,18,23,26,33,38,41,45,57,69,71,82,85,88,93,94,95,97:114,116:124) ]
second_clean_2015

second_clean_2016 <- first_clean_2016[ -c(21,22,26,27,31,46,48,49,71,79,90,94,101,102,104,105,107:122) ]
second_clean_2016

second_clean_2017 <- first_clean_2017[ -c(12,21,22,26,27,31,43,46,48,49,68,69,72,81,92,96,104,105,107,108,112:120) ]
second_clean_2017

col_names_reduced_2015 <- colnames(second_clean_2015)
col_names_reduced_2016 <- colnames(second_clean_2016)
col_names_reduced_2017 <- colnames(second_clean_2017) 

col_names_2015 <- colnames(second_clean_2015)
col_names_2016 <- colnames(second_clean_2016)
col_names_2017 <- colnames(second_clean_2017)



col_names_reduced_2015 ## 80 columns remain
col_names_reduced_2016 ## 90 columns remain
col_names_reduced_2017 ## 91 columns remain

# converrting the date column to yyyy/mm/dd only with time included.

second_clean_2015$timestamp <- as.Date(second_clean_2015$timestamp)
second_clean_2015$year <- as.numeric(format(second_clean_2015$timestamp, "%Y"))




# renaming some columns that were too long or inconsistent across the datasets

 ##2015 data
second_clean_2015 <- rename( second_clean_2015, age = how_old_are_you, going_out = are_you_going_actually_going_trick_or_treating_yourself,
                             mary_janes2 = anonymous_brown_globs_that_come_in_black_and_orange_wrappers,
                             bonkers_the_candy = bonkers, brach_product = brach_products_not_including_candy_corn,
                             free_restaurant_candy = candy_that_is_clearly_just_the_stuff_given_out_for_free_at_restaurants,
                             hersheys_kisses = hershey_s_kissables,  hersheys_milk_chocolate = hershey_s_milk_chocolate,
                             jolly_ranchers_bad_flavor = jolly_rancher_bad_flavor, reeses_peanut_butter_cups = reese_s_peanut_butter_cups,
                             toblerone = tolberone_something_or_other, peanut_m_ms = peanut_m_m_s,
                             chick_o_sticks = chick_o_sticks_we_don_t_know_what_that_is,
                             odd_marshmallow_peanut = those_odd_marshmallow_circus_peanut_things)

third_clean_2015 <- second_clean_2015
names(third_clean_2015)

 ##2016 data

third_clean_2016 <- second_clean_2016 %>% 
  rename(
    going_out = are_you_going_actually_going_trick_or_treating_yourself,
    gender = your_gender,
    age = how_old_are_you,
    country = which_country_do_you_live_in,
    state_province_county_etc = which_state_province_county_do_you_live_in,
    mary_janes2 = anonymous_brown_globs_that_come_in_black_and_orange_wrappers,
    box_o_raisins = boxo_raisins,
    free_restaurant_candy = candy_that_is_clearly_just_the_stuff_given_out_for_free_at_restaurants,
    chick_o_sticks = chick_o_sticks_we_don_t_know_what_that_is,
    hersheys_milk_chocolate = hershey_s_milk_chocolate,
    jolly_ranchers_bad_flavor = jolly_rancher_bad_flavor,
    peanut_m_ms = peanut_m_m_s,
    reeses_peanut_butter_cups = reese_s_peanut_butter_cups,
    sourpatch_kids = sourpatch_kids_i_e_abominations_of_nature,
    odd_marshmallow_peanuts = those_odd_marshmallow_circus_peanut_things,
    toblerone = tolberone_something_or_other
  )
names(third_clean_2016)

## 2017 data


 # colnames(second_clean_2017) <- gsub("^.{3}", "", colnames(second_clean_2017))

#the above code removes  the 3 first characters from 2017 dataset the columns names, commenting this it so i don't run it a second time.
#second_clean_2017 <- rename( second_clean_2017, internal_id = ernal_id)


third_clean_2017 <- second_clean_2017 %>%
  rename(
    ##  x100_grand_bar = 100_grand_bar,
    mary_janes2 = anonymous_brown_globs_that_come_in_black_and_orange_wrappers_a_k_a_mary_janes,
    box_o_raisins = boxo_raisins,
    free_restaurant_candy = candy_that_is_clearly_just_the_stuff_given_out_for_free_at_restaurants,
    chick_o_sticks = chick_o_sticks_we_don_t_know_what_that_is,
    hersheys_milk_chocolate = hershey_s_milk_chocolate,
    jolly_ranchers_bad_flavor = jolly_rancher_bad_flavor,
    peanut_m_ms = peanut_m_m_s,
    reeses_peanut_butter_cups = reese_s_peanut_butter_cups,
    boo_berry_crunch = sandwich_sized_bags_filled_with_boo_berry_crunch,
    sourpatch_kids = sourpatch_kids_i_e_abominations_of_nature,
    odd_marshmallow_peanuts = those_odd_marshmallow_circus_peanut_things,
    toblerone = tolberone_something_or_other
  )
names(third_clean_2017)


## ocnverting age column to double

third_clean_2015$age <- as.integer(third_clean_2015$age)
third_clean_2016$age <- as.integer(third_clean_2016$age)
third_clean_2017$age <- as.integer(third_clean_2017$age)

 # Cleaning the Country column in 2016 dataset

third_clean_2016 <- third_clean_2016 %>% 
  mutate ( country = str_to_lower(third_clean_2016$country))

unique_names_country <- sort(unique(third_clean_2016$country))
unique_names_country
 
## changing USA names to USA

USA_names <-  c("the yoo ess of aaayyyyyy",                                                                         
 "trumpistan" ,  "sub-canadian north america... 'merica",                                                 
 "u.s.",  "merica",  "murica",                                                                                                               
 "united  states of america",                                   
 "america",  "the best one - usa",                                           
 "united sates",                                                                                                     
 "united states" ,                                                                                      
 "united stetes",                                                                                                  
 "us", "usa usa usa",                                                                                                              
 "usa usa usa usa",                                                                                                          
 "usa! usa!", "eua",                                                                                                    
 "usa!!!!!!",                                                                                                              
"u.s.a.", "usa! usa! usa!", 
"united state",
"united states of america", 
"units states",
"usa", "usa!",
"ussa","usa (i think but it's an election year so who can really tell)" ) 


fourth_clean_2016 <- third_clean_2016 %>% 
  mutate (country = ifelse(third_clean_2016$country %in%  USA_names, 'USA', third_clean_2016$country))

unique_names_country_4 <- sort(unique(fourth_clean_2016$country))

##changing odd names to NA

odd_names <- c( "30.0", "47.0", "44.0", "51.0", "45.0","54.0", "a tropical island south of the equator","cascadia","denial",
                "see above", "the republic of cascadia", "not the usa or canada", "god's country", "there isn't one for old men",
                "one of the best ones", "neverland",  "somewhere", "this one")

fourth_clean_2016_test <- fourth_clean_2016 %>% 
  mutate (country = ifelse(fourth_clean_2016$country %in%  odd_names, 'NA', fourth_clean_2016$country))

unique_names_country_5 <- sort(unique(fourth_clean_2016_test$country))

## changing uk names to UK

uk_names <- c("united kindom","united kingdom", "england", "uk")

fourth_clean_2016_test_1 <- fourth_clean_2016_test %>% 
  mutate (country = ifelse(fourth_clean_2016_test$country %in%  uk_names, 'UK', fourth_clean_2016_test$country))

unique_names_country_5 <- sort(unique(fourth_clean_2016_test_1$country))

## moving the dataframe to our fith clean.

fifth_clean_2016 <- fourth_clean_2016_test_1

# Cleaning the Country column in 2017 dataset

third_clean_2017
third_clean_2017 <- third_clean_2017 %>% 
  mutate ( country = str_to_lower(third_clean_2017$country))

unique_names_country <- sort(unique(third_clean_2017$country))

unique_names_country

## country names for 2017

Australia_names <- c("australia")

Canada_names <- c("can","canada","canada`","soviet canuckistan")

Finland_names <- c("finland")

France_names <- c("france")

Germany_names <- c("germany")


Hong_Kong_names <- c("hong kong")

Netherlands_names <- c("the netherlands","netherlands")

South_Africa_names <- c("south africa")

Spain_names <- c("spain")

UK_names <- c("uk","united kingdom","scotland","endland","england","u.k.")

USA_names_17 <-  c("'merica","ahem....amerca","america","california",
                   "i pretend to be from canada, but i am really from the united states.",
                "murica","murrika","n america","new jersey","new york","north carolina",
                "pittsburgh","the united states","the united states of america","trumpistan",
                "u s","u s a","unied states","unite states","united sates","united staes",
                "united state","united statea","united stated","united states","united states",
                "united states","united states","united states of america","united states of america",
                "united statss","united ststes","united ststes","unites states","us","us","us","us of a",
                "usa","usa","usa","usa","usa usa usa!!!!","usa! usa! usa!","usa? hard to tell anymore..",
                "usaa","usas","usausausa","ussa","u.s.a.", "unhinged states", "u.s.", "uae",  "alaska", "n. america")

odd_names_17 <- c("1","32", "35", "45", "46", "a", "atlantis", "canae", "cascadia",
                  "narnia", "europe", "i don't know anymore", "earth", "insanity lately",
                  "subscribe to dm4uz3 on youtube", "ud", "fear and loathing" )


fifth_clean_2017<- third_clean_2017 %>% 
  mutate(country = case_when(country %in% Australia_names ~ "Australia", 
                                                                     country %in% Canada_names ~ "Canada", 
                                                                     country %in% Finland_names ~ "Finland",
                                                                     country %in% France_names ~ "France", 
                                                                     country %in% Germany_names ~ "Germany", 
                                                                     country %in% Hong_Kong_names ~ "Hong Kong",
                                                                     country %in% Netherlands_names ~ "Netherlands", 
                                                                     country %in% South_Africa_names ~ "South Africa", 
                                                                     country %in% Spain_names ~ "Spain",
                                                                     country %in% UK_names ~ "UK", 
                                                                     country %in% USA_names_17 ~ "USA",
                                                                    country %in%  odd_names_17 ~ "NA",
                                                                      TRUE  ~ as.character(country)))
                                                                
unique_names_country_t <- sort(unique(fifth_clean_2017$country))

# more updates to 2016 columns
fifth_clean_2016
names(fifth_clean_2016)

fifth_clean_2016$timestamp <- as.Date(fifth_clean_2016$timestamp)
fifth_clean_2016$year <- as.numeric(format(fifth_clean_2016$timestamp, "%Y"))
head(fifth_clean_2016)

na_2017_coutry <-  fifth_clean_2016[is.na(fifth_clean_2016$country), ] # checking number of NA
na_2017_coutry <-  subset(fifth_clean_2016, country == "NA") # checking number of "NA"

fifth_clean_2016 <- fifth_clean_2016 %>% 
  mutate(country = case_when(country == "NA" ~ NA_character_, 
                               TRUE ~ country))

fifth_clean_2016 <- fifth_clean_2016 %>% 
 mutate (country =  str_to_title(country))

fifth_clean_2016 <- fifth_clean_2016 %>% 
  mutate(country = case_when(country == "Usa" ~ "USA",
                             country == "Uk" ~ "UK",
                             TRUE ~ country))

fifth_clean_2016


# more updates to 2017 columns
fifth_clean_2017 <-  clean_names(fifth_clean_2017)

names(fifth_clean_2017)


# create a sample data frame
df <- data.frame(x = c(1, 2, 3, 4, 5), y = c("apple", "banana", "cherry", "orange", "mango"))

# create a list of values to match
fruit_list <- c("apple", "banana", "cherry")

# use ifelse() and %in% to mutate the "y" column based on the list of values
df <- mutate(df, y = ifelse(y %in% fruit_list, "fruit", "other"))
