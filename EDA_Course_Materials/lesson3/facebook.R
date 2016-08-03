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
?scale_x_continuous
