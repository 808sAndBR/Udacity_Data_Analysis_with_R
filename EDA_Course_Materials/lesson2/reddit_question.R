library(ggplot2)
reddit <- read.csv("EDA_Course_Materials/lesson2/reddit.csv")

str(reddit)


levels(reddit$age.range) <- c("Under 18", "18-24", "25-34", "35-44", "45-54",
                                 "55-64", "65 or Above")
qplot(reddit$age.range)

reddit$age.range <- factor(reddit$age.range,
                           levels = c("Under 18", "18-24", "25-34","35-44",
                                      "45-54", "55-64", "65 or Above"),
                           ordered = TRUE)

qplot(reddit$age.range)
