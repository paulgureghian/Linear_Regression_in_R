"Created by Paul A. Gureghian on 8/15/2018"

#load packages
library(HistData)
library(tidyverse)
library(ggplot2)
data("GaltonFamilies")

#create the galton_heights dataframe
galton_heights <- GaltonFamilies %>%
    filter(childNum == 1 & gender == "male") %>% 
    select(father, childHeight) %>%
    rename(son =childHeight) 

#initilaize variables and create the 'results' dataframe
beta1 = seq(0, 1, len = nrow(galton_heights))
results <- data.frame(beta1 = beta1, rss = sapply(beta1, rss, beta0 = 36)) 

#plot the 'results' dataframe
results %>% ggplot(aes(beta1, rss)) +
    geom_line() +
    geom_line(aes(beta1, rss), col =2)

#define the 'rss' function 
rss <- function(beta0, beta1, data) {
    resid <- galton_heights$son - (beta0 + beta1 * galton_heights$father)
    return(sum(resid^2))
}        

