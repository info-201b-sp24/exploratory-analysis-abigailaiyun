# A function that takes in a dataset and returns a list of info about it:
# Install and load the dplyr package
#install.packages("dplyr")
library(dplyr)

# Loads data
tennis <- read.csv("tennis_atp_3.csv")

# Most popular surface
most_popular_surface <- tennis %>% 
  count(Surface) %>% 
  filter(Surface == max(Surface, na.rm = TRUE))

# Tournament series with the most matches played
max_series<- tennis %>% 
  count(Series) %>% 
  filter(n == max(n, na.rm = TRUE))

# Djokovic Avg Player rank in Australian Open
djokovic_avg_rank_au <- tennis %>% 
  filter(Player_1 == "Djokovic N." | Player_2 == "Djokovic N.") %>% 
  filter(Tournament == "Australian Open") %>% 
  mutate(djokovic_rank = ifelse(Player_1 == "Djokovic N.", Rank_1, Rank_2)) %>% 
  summarise(avg_rank = mean(djokovic_rank, na.rm = TRUE)) %>% 
  pull(avg_rank)

# Top player + number of wins AU Open
top_player <- tennis %>%
  filter(Tournament == "Australian Open") %>% 
  group_by(Winner) %>% 
  summarise(win_count = n()) %>% 
  filter(win_count == max(win_count), na.rm = TRUE)

# Djokovic most recent rank per the table 
tennis$Date <- as.Date(tennis$Date, format = "%m/%d/%Y")
recent <- tennis %>%
  filter(Player_1 == "Djokovic N." | Player_2 == "Djokovic N.") %>% 
  filter(Date == max(Date, na.rm = TRUE))




