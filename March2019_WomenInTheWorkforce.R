library(dplyr)
library(ggplot2)
library(reshape2)

jobs_gender <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-05/jobs_gender.csv")
earnings_female <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-05/earnings_female.csv") 
employed_gender <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-05/employed_gender.csv") 

# Full time male and female comparison
employed_gender %>%
  select(Year = year, Female = full_time_female, Male = full_time_male) %>% 
  melt(id.var = "Year") %>% 
  ggplot(aes(x=Year, y=value, color =variable)) +
  geom_line() +
  scale_y_continuous(limits = c(0, 100)) +
  labs(y = "Percentage", color = "Gender", 
       title = "Percentage of employed female and male usually working full time") +
  theme_minimal()

# Part time male and female comparison 
employed_gender %>%
  select(Year = year, Female = part_time_female, Male = part_time_male) %>% 
  melt(id.var = "Year") %>% 
  ggplot(aes(x=Year, y=value, color =variable)) +
  geom_line() +
  scale_y_continuous(limits = c(0, 100)) +
  labs(y = "Percentage", color = "Gender", 
       title = "Percentage of employed female and male usually working part time") +
  theme_minimal()
