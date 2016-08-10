library(readr)
library(gridExtra)

# For this assignment I decided to explore the corruption perception index from
# gapminder.com

cpi <- read_csv("EDA_Course_Materials/lesson3/indicator_ti_cpi_2009.csv")

cpi$X.1 <- NULL
cpi$X.2 <- NULL
cpi$X.3 <- NULL

names(cpi) <- c('Country', '2008', '2009')

cpi$change <- cpi$`2009` - cpi$`2008`

p1 <- ggplot(aes(x = `2008`), data = cpi) +
            geom_histogram()

p2 <- ggplot(aes(x = `2009`), data = cpi) +
            geom_histogram()

grid.arrange(p1, p2, ncol = 1)

ggplot(aes(x = change), data = cpi) +
    geom_histogram(binwidth = .1)




