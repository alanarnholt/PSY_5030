## Basic script
## Date and author

?ChickWeight  # opens help file for the data set
# load tidyverse
library(tidyverse)
glimpse(ChickWeight)
summary(ChickWeight)
## Visualization
ggplot(ChickWeight, aes(Time, weight)) + 
  geom_point()
##
ggplot(ChickWeight, aes(Time, weight, color = factor(Diet))) + 
  geom_point()
##
ChickWeight <- ChickWeight %>% 
  mutate(Diet = factor(Diet))
##
ggplot(ChickWeight, aes(Time, weight, color = Diet)) + 
  geom_point()
##
ggplot(ChickWeight, aes(Time, weight, color = Diet)) + 
  geom_point() +
  facet_wrap(~Diet) +
  theme(legend.position = "bottom")
## loess
ggplot(ChickWeight, aes(Time, weight, color = Diet)) + 
  geom_point() +
  facet_wrap(~Diet) +
  geom_smooth() +
  theme(legend.position = "bottom") + 
  theme_bw()
##
ggplot(ChickWeight, aes(Time, weight, color = Diet)) + 
  geom_point() +
  facet_wrap(~Diet) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "bottom") + 
  theme_bw()
## Regression
lm(weight ~ Time, data = subset(ChickWeight, Diet == 1))
lm(weight ~ Time, data = subset(ChickWeight, Diet == 2))
lm(weight ~ Time, data = subset(ChickWeight, Diet == 3))
lm(weight ~ Time, data = subset(ChickWeight, Diet == 4))
