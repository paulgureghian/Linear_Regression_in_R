# Created by Paul A. Gureghian on 8/16/2018 #

#load packages 
library(Lahman)
library(tidyverse)
library(dslabs)
ds_theme_set()

#create the 'mutated_teams' dataframe 
mutated_teams <- Teams %>% filter(yearID %in% 1961:2001) %>% 
    mutate(HR_per_game = HR/G, R_per_game = R/G)
    
    #compute the coefficient for the 'BB' feature 
    fit <- lm(R_per_game ~ BB, HR,  data = mutated_teams)
    fit 
        
        





     
    
    
    