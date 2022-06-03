suppressPackageStartupMessages(library(tidyverse))

Q1<- msleep %>% 
  filter(vore == 'carni' & conservation == 'lc') %>% 
  summarise(var= round(var(sleep_total),2)) %>% 
  as.data.frame()

Q2<- msleep %>% 
  filter(order == 'Rodentia') %>% 
  mutate(ratio = sleep_total/sleep_rem) %>% 
  arrange(desc(ratio)) %>% 
  select(name) %>% 
  head(1)

Q3<- msleep %>% 
  mutate(ratio = bodywt/brainwt) %>% 
  filter(order == 'Primates' & ratio >100) %>% 
  summarise(count=n()) %>% 
  as.data.frame()

Q4<- msleep %>%
  filter(is.na(conservation)==FALSE) %>%   
  group_by(conservation) %>% 
  summarise(mean_sleep=round(mean(sleep_total),2), var_sleep=round(var(sleep_total),2)) %>% 
  as.data.frame()

Q5<-msleep %>% 
  filter(vore=='herbi' & sleep_total>12 & conservation == 'domesticated') %>% 
  select(name)
