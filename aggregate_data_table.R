library(dplyr)
library(tidyverse)

# Loading data
tennis_data <- read.csv("tennis_atp_3.csv")

# Modifying column names
colnames(tennis_data) <- c("Tournament", 
                          "Date", 
                          "Series",
                          "Court",
                          "Surface", 
                          "Round",
                          "Best of",
                          "Player_1",
                          "Player_2",
                          "Winner",
                          "Rank_1",
                          "Rank_2",
                          "Pts_1",
                          "Pts_2",
                          "Score")

# Removing first row of data (used for previous column names)
tennis_data <- tennis_data[-1, ]

# Turning columns we are concerned with into numerics rather than strings
tennis_data <- tennis_data %>%
  mutate (
    Rank_1 = as.numeric(Rank_1),
    Rank_2 = as.numeric(Rank_2),
    Pts_1 = as.numeric(Pts_1),
    Pts_2 = as.numeric(Pts_2)
  )

# Creating table grouped by Surface and finding average ranks and points
aggregated_data <- tennis_data %>%
  group_by(Surface) %>%
  summarise(
    Number_of_Matches = n(),
    Average_Rank1 = round(mean(Rank_1, na.rm = TRUE), digits = 2),
    Average_Rank2 = round(mean(Rank_2, na.rm = TRUE), digits = 2),
    Average_Points1 = round(mean(Pts_1, na.rm = TRUE), digits = 2),
    Average_Points2 = round(mean(Pts_2, na.rm = TRUE), digits = 2)
  ) %>%
  ungroup()


# Meaningfully sorted table
aggregated_data <- arrange(aggregated_data, desc(Number_of_Matches))

# View table
view(aggregated_data)
