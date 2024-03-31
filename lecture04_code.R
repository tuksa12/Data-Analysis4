library(data.table)
library(ggplot2)

install.packages("gapminder")
library(gapminder)

gm_dt <- as.data.table(gapminder)[year %in% c(1977, 2007)]

ggplot(data = gm_dt, aes(x=gdpPercap, y=lifeExp)) + geom_point()

