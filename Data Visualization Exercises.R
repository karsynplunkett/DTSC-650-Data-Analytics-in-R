install.packages("tidyverse")
library(tidyverse)
#3.2 EXERCISES
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)
#how many rows/cols
nrow(mpg)
ncol(mpg)
#what is drv
?mpg
#make scatterplot of hwy vs cyl
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))
#scatter plot of class vs drive
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv)) #not useful bc discrete variables


#3,3 EXERCISES
#hat's gone wrong with this code? Why are the points not blue?
#coded the key, has to be outside ()
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")


#which are categorical?
?mpg

#displ and trans
ggplot(mpg)+
  geom_point(aes(cty,hwy,color=trans))

ggplot(mpg)+
  geom_point(aes(cty,hwy,size=displ))

ggplot(mpg)+
  geom_point(aes(cty,hwy,size=trans))


#What happens if you map the same variable to multiple aesthetics?
ggplot(mpg)+
  geom_point(aes(cty,hwy,color= displ, size=trans))

#What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
ggplot(mpg)+
  geom_point(aes(cty,hwy,stroke=5))

#What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you'll also need to specify x and y.
ggplot(mpg)+
  geom_point(aes(cty,hwy,color=displ<5))


#3.5 EXERCISES
#What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ hwy, nrow = 2)

#What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
# means there's no data for it

#What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)


#What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? How might the balance change if you had a larger dataset?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)


?facet_wrap

#When using facet_grid() you should usually put the variable with more unique 
#levels in the columns. Why?
##wider layout so it'll fit better


#3.6 EXERCISES
#What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
ggplot(mpg)+
  geom_line(aes(displ,hwy))
ggplot(mpg)+
  geom_boxplot(aes(displ,hwy, group=trans))
ggplot(mpg)+
  geom_histogram(aes(displ))
ggplot(mpg)+
  geom_area(aes(displ,hwy))

#Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#remove se=false
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth()


#will these 2 graphs look different?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))


ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy, color=drv)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy, linetype= drv),se=FALSE)


#3.7 EXERCISES
#What is the default geom associated with stat_summary()? How could you rewrite the previous plot to use that geom function instead of the stat function?
ggplot(data = diamonds) + 
  geom_pointrange(aes(x = cut, y = depth), stat="summary",
    fun.min = min,
    fun.max = max,
    fun = median
  )

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


ggplot(data = diamonds) + 
  geom_col(mapping = aes(x = cut, y=depth, group = 1))

?geom_bar

ggplot(data = diamonds) + 
  stat_smooth(mapping = aes(x = cut))


#what is prob with these 2 graphs?
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))




ggplot(mpg) + 
  geom_point(aes(hwy,cyl))


ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point()
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
ggplot() +
  geom_point(mpg, aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


ggplot(diamonds) +
  geom_smooth(aes(x=carat, y=price)) +
  geom_point(aes(carat, price))
