suppressPackageStartupMessages(library(tidyverse))
pizza <- read_csv('pizza.csv')

Q1<- pizza %>% 
  filter(free_wine == 1 & discount_customer==1 & pizzas >4) %>% 
  select(driver) %>% 
  as.data.frame()


Q2 <- pizza %>% 
  mutate(ratio = bill/pizzas) %>% 
  summarise(mean_ratio = round(mean(ratio),2)) %>% 
  as.data.frame()

Q3<- pizza %>% 
  group_by(day) %>% 
  summarise(var_pizzas= round(var(pizzas),2)) %>% 
  select(day, var_pizzas) %>% 
  as.data.frame()


Q4<- pizza %>% 
  group_by(operator) %>% 
  summarise(avg_bill = round(mean(bill),2)) %>% 
  arrange(desc(avg_bill)) %>% 
  head(1) %>% 
  select(operator)


Q5<- pizza %>% 
  select(day, driver, free_wine) %>% 
  group_by(day, driver) %>% 
  mutate(amt_wine =as.integer(free_wine)) %>% 
  summarise(n= sum(amt_wine)) %>% 
  distinct(day, driver, n) %>% 
  arrange(desc(n)) %>% 
  head(1) 