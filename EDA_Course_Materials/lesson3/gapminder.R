library(readr)
library(gridExtra)

# For this assignment I decided to explore the corruption perception index from
# gapminder.com

# Since it downloaded as an excel file I had to open it in excel and save a csv
# version

cpi <- read_csv("EDA_Course_Materials/lesson3/indicator_ti_cpi_2009.csv")

# Remove all the unneeded columns 
cpi$X.1 <- NULL
cpi$X.2 <- NULL
cpi$X.3 <- NULL

# add correct names
names(cpi) <- c('Country', '2008', '2009')

# Create a column to see how opinions changed from one year to the next
cpi$change <- cpi$`2009` - cpi$`2008`

# In the CPI a 10 means not corrupt and a 1 is very corrupt.

p1 <- ggplot(aes(x = `2008`), data = cpi) +
            geom_histogram()

p2 <- ggplot(aes(x = `2009`), data = cpi) +
            geom_histogram()

# we can see that the largest grouping is in the 2.5 area both years, which is 
# pretty corrupt :/
grid.arrange(p1, p2, ncol = 1)



# We can also see that most countries didn't feel like they had much change in 
# corruption frome 2008 to 2009
ggplot(aes(x = change), data = cpi) +
    geom_histogram(binwidth = .1)




