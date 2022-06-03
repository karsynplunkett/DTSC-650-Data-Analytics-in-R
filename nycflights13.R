suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(nycflights13))

Q1<- flights %>% 
  group_by(carrier) %>% 
  filter(carrier == 'AA' | carrier == 'EV' | carrier == 'FL') %>% 
  summarise(AVG =round(mean(distance),2)) %>% 
  as.data.frame()


Q2<- flights %>% 
  group_by(month) %>% 
  summarise(NumFlights=n()) %>% 
  arrange(desc(NumFlights)) %>% 
  head(1) %>% 
  as.data.frame()


Q3<- flights %>% 
  mutate(min_dist =distance) %>% 
  arrange(min_dist) %>% 
  select(origin, dest, min_dist) %>% 
  distinct(origin, dest, min_dist) %>% 
  head(5) %>% 
  as.data.frame()


Q4<- flights %>% 
  filter(origin == 'JFK') %>% 
  group_by(month, day) %>% 
  summarise(mean_distance=round(mean(distance),2)) %>% 
  arrange(desc(mean_distance)) %>% 
  head(5) %>% 
  as.data.frame()

Q5<- flights %>% 
  filter(dest =='ATL' | dest =='BOS') %>% 
  group_by(dest)  %>% 
  summarise(max_arr_delay = max(arr_delay, na.rm=TRUE)) %>% 
  as.data.frame()

