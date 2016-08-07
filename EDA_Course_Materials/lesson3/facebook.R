library(ggplot2)

pf <- read.csv("EDA_Course_Materials/lesson3/pseudo_facebook.tsv", 
                     sep = "\t")

ggplot(aes(x = friend_count), data = pf) + 
    geom_histogram()

ggplot(aes(x = friend_count), data = pf) + 
    geom_histogram() + 
    scale_x_continuous(limits = c(0, 1000)) 
    
ggplot(aes(x = friend_count), data = pf) + 
    geom_histogram(binwidth = 25) + 
    scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
    facet_wrap(~gender)


ggplot(aes(x = friend_count), data = subset(pf, !is.na(gender))) + 
    geom_histogram(binwidth = 25) + 
    scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
    facet_wrap(~gender)


by(pf$friend_count, pf$gender, summary)

96-74

ggplot(aes(x = tenure/365), data = pf) +
    geom_histogram(binwidth = .5)
    

ggplot(aes(x = age), data = pf) +
    geom_histogram(binwidth = 5) +
    scale_x_continuous(breaks =seq(0,120,10))

library(gridExtra) 

p1 <- ggplot(aes(x = friend_count), data = pf) +
    geom_histogram()

p2 <- ggplot(aes(x = friend_count + 1), data = pf) +
    geom_histogram() +
    scale_x_log10()

p3 <- ggplot(aes(x = sqrt(friend_count)), data = pf) +
    geom_histogram()

grid.arrange(p1, p2, p3, ncol = 1)


ggplot(aes(x = www_likes, 
           #y = ..count.. /sum(..count..),
           color = gender), data = subset(pf, !is.na(gender))) +
    geom_freqpoly() +
    #scale_x_continuous(limits = c(0, 500))
    scale_x_log10()
    
# Why do they not do +1 for the log transformation?

subset(pf, gender == "male" ) %>%
    select(www_likes) %>%
    sum()

subset(pf, gender == "female" ) %>%
    select(www_likes) %>%
    sum()

# their solution (better)
by(pf$www_likes, pf$gender, sum)

qplot(x = gender, y = friend_count,
       data = subset(pf, !is.na(gender) & friend_count <= 1000),
       geom = 'boxplot')

qplot(x = gender, y = friend_count,
       data = subset(pf, !is.na(gender)),
       geom = 'boxplot', ylim = c(0,1000))

qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)),
      geom = 'boxplot') + 
    coord_cartesian(ylim = c(1, 250))


ggplot( aes(x = gender, y = friendships_initiated), 
        data = subset(pf, !is.na(gender))) + 
    geom_boxplot() + 
    coord_cartesian(ylim = c(0,200))

by(pf$friendships_initiated, pf$gender, summary)

pf$mobile_check_in <- NA
pf$mobile_check_in <- ifelse(pf$mobile_likes > 0, 1, 0)
pf$mobile_check_in <- factor(pf$mobile_check_in)

prop.table(table(pf$mobile_check_in))
