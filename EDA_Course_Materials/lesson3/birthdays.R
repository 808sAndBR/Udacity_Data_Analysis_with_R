library(ggplot2)
library(dplyr)
library(lubridate)

# I decided to use the data provided since it seems questionable to push all
# my facebook "friends" names and birthdays to github

pf <- read.csv("EDA_Course_Materials/lesson3/pseudo_facebook.tsv", 
               sep = "\t")

# How many people share your birthday? Do you know them?
same_bday <- filter(pf, dob_day == 22, dob_month == 4)

# There are 242 people in this data set with the same birthday as me (April 22).
nrow(same_bday)


# Which month contains the most number of birthdays?

bday_months <- group_by(pf, dob_month) %>%
    summarise(per_month = n())

# Jan has the highest number of birthdays by a pretty good margin. This is 
# likely to be from people just using it instead of their real bday though.
filter(bday_months, per_month == max(per_month))

# How many birthdays are in each month?
bday_months

# Which day of the year has the most number of birthdays?
bday_days <- group_by(pf, dob_day) %>%
    summarise(per_day = n()) %>%
    arrange(per_day)

# The first is higher again, by a much bigger margine this time though, so would
# be interesting to investigate further why people choose the 1sth so much and 
# what actual birthrate on 1st is (does cencus data have birthdays?).
tail(bday_days,1)


# Do you have at least 365 friends that have birthdays on everyday
# of the year?

# NEVERMIND(keeing in case I change my mind) Converting to a date object 
# pf$birthday <- ymd(paste(pf$dob_year, pf$dob_month, pf$dob_day))

# Used 2016 since it is a leap year, get all days of year
doy <- seq.POSIXt(ymd("2016 1 1"), ymd("2016 12 31"), "day")

# Get just month and day so we can check birthdates
days_in_year <- paste(month(doy), day(doy))

# combine the day and time, made a factor to help with ploting... but it did not
pf$month_day <- paste(pf$dob_month, pf$dob_day) %>% 
    factor(ordered = is.ordered(days_in_year))

# 366 uniques each so there is a friend with every birthday of the year in this
# data set!
length(unique(pf$month_day))
length(unique(days_in_year))

