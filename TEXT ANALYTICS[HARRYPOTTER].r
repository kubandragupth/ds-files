#INSTALL DATA FROM GIRHUB FOR LIBRARY

devtools::install_github("bradleyboehmke/harrypotter")

#IMPORTING LIBRARY

library(tidyverse)   #FOR DATA MANIPULATION
library(stringr)     #FOR TEXT CLEANING  
library(tidytext)    #FOR TEXT MINING TASK
library(harrypotter) #FOR ACCESS HARRY POTTER BOOKS

#VIEWING RAW TEXT

View(philosophers_stone[1:2])

#TIBBLING(CREATING TEXT DATAFRAME)

text_db <- tibble(chapter = seq_along(philosophers_stone),
                  text = philosophers_stone)
View(text_db)

#TOKENISATION
#APPLY UNNEST TOKEN(SPLIT TO SINGLE WORDS,REMOVE PUNCTUATION AND CONVERT TO LOWER CASES)

text_db %>% unnest_token(WORD, text)
