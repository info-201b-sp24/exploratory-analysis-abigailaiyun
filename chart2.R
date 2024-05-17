# Exploratory Analysis, Chart 2
# Player's Ranking @ Tournament Over Time (2013-2023)
# Stefan Cutovic, Madi Trimmer, Abby Williams

# Loads necessary libraries
library(dplyr)
library(ggplot2)

plot_player_ranking_over_time <- function(player_name, tournament) {
  tennis_data <- read.csv("tennis_atp_3.csv", stringsAsFactors = FALSE)
  
  # Converts 'Date' column to date format
  tennis_data$Date <- as.Date(tennis_data$Date, format = "%m/%d/%Y")
  
  # Extracts year from 'Date' column
  tennis_data$Year <- as.integer(format(tennis_data$Date, "%Y"))
  
  # Filters matches for specified player at specified tournament
  tournament_matches <- tennis_data %>%
    filter(Tournament == tournament & (Player_1 == player_name | Player_2 == player_name))
  
  # Initializes lists to store year and ranking
  years <- numeric()
  ranks <- numeric()
  
  for (year in unique(tournament_matches$Year)) {
    # Filters matches for player at tournament in current year
    matches_year <- tournament_matches %>%
      filter(Year == year)
    
    player_rank <- NA
    
    # Iterates over each match in current year
    for (i in 1:nrow(matches_year)) {
      match <- matches_year[i, ]
      
      # Checks if player is Player_1 or Player_2 in dataset
      if (match$Player_1 == player_name) {
        player_rank <- match$Rank_1
        
      } else if (match$Player_2 == player_name) {
        player_rank <- match$Rank_2
        
      }
    }
    
    # Appends player's rank for year to lists
    years <- c(years, year)
    ranks <- c(ranks, player_rank)
  }
  
  ggplot() +
    geom_line(aes(x = years, y = ranks), color = "blue") +
    geom_point(aes(x = years, y = ranks), color = "blue") +
    labs(title = paste(player_name, "'s Ranking at ", tournament, 
                       " Over Time (2013-2023)", sep = ""),
         x = "Year",
         y = "ATP Ranking") +
    scale_x_continuous(breaks = seq(min(years), max(years), by = 1)) + 
    scale_y_continuous(breaks = seq(min(ranks), max(ranks), by = 1)) + 
    theme_minimal() +
    theme(plot.title = element_text(face = "bold", size = 12, hjust = 0.5))
}

# Example usage:
plot_player_ranking_over_time("Djokovic N.", "Australian Open")