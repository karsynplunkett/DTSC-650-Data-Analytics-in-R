suppressPackageStartupMessages(library(openintro))
suppressPackageStartupMessages(library(tidyverse))


Q1<- fastfood %>% 
  filter(restaurant == 'Burger King' | restaurant == 'Chick Fil-A') %>% 
  arrange(desc(calories)) %>% 
  select(item) %>% 
  head(1)


Q2<- fastfood %>% 
  filter(restaurant == 'Subway') %>% 
  summarise(mean_sugar = mean(sugar)) %>% 
  as.data.frame()


Q3<- fastfood %>% 
  filter(restaurant == 'Taco Bell') %>% 
  summarise(mean_cal = mean(calories)) %>% 
  as.data.frame()


Q4<- fastfood %>% 
  mutate(fatXsugar=total_fat*sugar) %>%  
  arrange(desc(fatXsugar)) %>% 
  select(restaurant, item, fatXsugar) %>% 
  head(3)


Q5<- fastfood %>% 
  group_by(restaurant) %>% 
  summarise(avg_sat_fat= mean(sat_fat)) %>% 
  filter(avg_sat_fat>10) %>% 
  summarise(num_rest=n())
