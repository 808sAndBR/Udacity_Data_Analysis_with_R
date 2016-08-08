library(ggplot2) 
data(diamonds)

dim(diamonds)

str(diamonds)

factor(diamonds$color)
?diamonds

ggplot(aes(price), data = diamonds) +
    geom_histogram(binwidth = 500)

summary(diamonds$price)


table(diamonds$price < 500)
table(diamonds$price < 250)
table(diamonds$price >= 15000)


ggplot(aes(price), data = diamonds) +
    geom_histogram(binwidth = 100) +
    scale_x_continuous(limits = c(0,2000))


ggplot(aes(price), data = diamonds) +
    geom_histogram(binwidth = 500) +
    facet_wrap(~cut)
    
group_by(diamonds, cut) %>%
    summarise(mean(price), median(price), max(price), min(price))



qplot(x = price, data = diamonds) + facet_wrap(~cut, scales = "free_y")


ggplot(aes(x = price/carat), data = diamonds) +
    geom_histogram(binwidth = .05) +
    scale_x_log10() +
    facet_wrap(~cut)
    

p1 <- ggplot(aes(x = clarity, y = price), data = diamonds) + 
        geom_boxplot()

p2 <- ggplot(aes(x = cut, y = price), data = diamonds) + 
        geom_boxplot()

p3 <- ggplot(aes(x = color, y = price), data = diamonds) + 
        geom_boxplot()

grid.arrange(p1, p2, p3, ncol = 1)


by(diamonds$price, diamonds$color, summary)

IQR(subset(diamonds, color == "D")$price)
IQR(subset(diamonds, color == "J")$price)


ggplot(aes(x = color, y = price/carat), data = diamonds) +
    geom_boxplot() +
    coord_cartesian(ylim = c(0,10000))


ggplot(aes(x = carat), data = diamonds) +
    geom_freqpoly(binwidth = .1) + 
    geom_hline(yintercept = 2000) +
    scale_x_continuous(breaks = seq(0,5,.2))


