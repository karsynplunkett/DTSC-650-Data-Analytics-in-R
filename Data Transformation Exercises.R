# CHAPTER 5 DATA TRANSFORMATION EXAMPLES
install.packages("nycflights13")
library(nycflights13)
library(tidyverse)
#5.2 EXAMPLES
#Find all flights that
#Had an arrival delay of two or more hours
delay <-filter(flights, arr_delay>=2)
#Flew to Houston (IAH or HOU)
houston<-filter(flights, dest=='IAH'|dest=='HOU')
#Were operated by United, American, or Delta
UAD<-filter(flights, carrier=='UA'|carrier=='DL'| carrier =="AA")
#Departed in summer (July, August, and September)
summer<-filter(flights, month>=7, month<=9)
#Arrived more than two hours late, but didn't leave late
#Were delayed by at least an hour, but made up over 30 minutes in flight
#Departed between midnight and 6am (inclusive)

#Another useful dplyr filtering helper is between(). What does it do? 
#Can you use it to simplify the code needed to answer the previous challenges?
summer2<-filter(flights, between(month, 7,9))

#How many flights have a missing dep_time? 
#What other variables are missing? What might these rows represent?
missing_dep<-filter(flights, is.na(dep_time)) #other vars missing are arrival times, delays,etc


#5.3 EXERCISES
#How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
MISS <- arrange(flights, desc(is.na(dep_time)))

#Sort flights to find the most delayed flights. Find the flights that left earliest.
most_delayed<- arrange(flights, desc(dep_delay))

#Sort flights to find the fastest (highest speed) flights.
fastest_flights <- arrange(flights, desc(distance/air_time))

#Which flights travelled the farthest? Which travelled the shortest?
farthest<- arrange(flights, desc(distance))
shortest<- arrange(flights, distance)


#5.4 EXERCISES
#Brainstorm as many ways as possible to select dep_time, 
#dep_delay, arr_time, and arr_delay from flights.
one <- select(flights, dep_delay, arr_time, arr_delay)
two<-select(flights, dep_delay:arr_delay, -(sched_arr_time))


#What happens if you include the name of a variable multiple times in a select() call?
example <- select(flights, arr_delay, arr_delay, arr_delay) # just adds one col of the selected var

#What does the any_of() function do? Why might it be helpful in conjunction with this vector?
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
anycol<- select(flights, any_of(vars))

#Does the result of running the following code surprise you? How do the select helpers deal with case by default? 
#How can you change that default?
time<-select(flights, contains("TIME")) #adds any col with the word time in it

houston<-filter(flights, dep_delay ==2 & dep_delay ==4)
rename(flights, DELAYtime=dep_delay)                
