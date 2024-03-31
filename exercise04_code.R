# Exercise 04
# Quizzes
# 1
# Option a

# 2
# Option b

# 3 
# Option c

# 4
# Option b

# 5
# Option b

# Tutorial
# Section 00
library(ggplot2)
library(data.table)
library(magrittr) # Needed for %>% operator
library(tidyr)
install.packages("ggrepel")
library(ggrepel)

# Section 01
# 1 --> bar chart
# 2 --> box plot
# 3 --> scatter plot
# 4 --> line plot

# Section 02
mpg_dt <- as.data.table(mpg)[year %in% c(1999, 2008)]
ggplot(data = mpg_dt, aes(x = cty, y = hwy)) + geom_point() + stat_smooth()

# Section 03
# 1
iris_dt <- as.data.table(iris)

# 2
iris_dt_new <- melt(iris_dt,id.vars = "Species", measure.vars = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"), variable.name = "measure", value.name = "value")
ggplot(iris_dt_new, aes(value)) + geom_histogram(bins = 100) + facet_wrap(~measure)

# 3
# By varying the number of bins, there are more or less detail/bars in the graphs

# 4
ggplot(iris_dt_new, aes(value)) + geom_boxplot() 

# 5
# ...

# Section 04

# Section 05
# 1
medals_dt <- fread(file.path("C:","Users","usertest","Documents","Data Analysis","Lectures","extdata","extdata","medals.csv"))
ggplot(medals_dt, aes(x= total, y= population)) + geom_point() 

# 2
# The problem is the y-axis representing the population
# the graph is not very readable
ggplot(medals_dt, aes(x= total, y= population)) + geom_point() + scale_y_log10()

# 3
ggplot(medals_dt, aes(total,population)) + geom_point() + scale_y_log10()+ geom_text_repel(aes(label = country))

# Section 06
# 1
anscombe
anscombe_reshaped <- anscombe %>%
  as.data.table %>%
  .[, ID := seq(nrow(.))] %>%
  melt(id.var=c("ID")) %>%
  separate(variable, c('xy', "group"), sep=1) %>%
  as.data.table %>%
  dcast(... ~ xy) %>%
  .[, group := paste0("dataset_", group)]
