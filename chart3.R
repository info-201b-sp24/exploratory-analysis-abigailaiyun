# Exploratory Analysis, Chart 3
# Number of Tournament Wins @ Specific Tournament (2013-2023)
# Stefan Cutovic, Madi Trimmer, Abby Williams

# Loads necessary libraries
library(dplyr)
library(ggplot2)

plot_tournament_wins <- function(player1, player2, player3, tournament) {
  tennis_data <- read.csv("tennis_atp_3.csv")
  
  # Filters matches for specified tournament and when final was
  final_matches <- tennis_data %>%
    filter(Tournament == tournament & Round == "The Final")
  
  # Counts number of times each player won tournament
  player1_wins <- final_matches %>%
    filter(Winner == player1) %>%
    nrow()
  
  player2_wins <- final_matches %>%
    filter(Winner == player2) %>%
    nrow()
  
  player3_wins <- final_matches %>%
    filter(Winner == player3) %>%
    nrow()
  
  # Creates named vector for plotting
  win_counts <- c(player1_wins, player2_wins, player3_wins)
  names(win_counts) <- c(player1, player2, player3)
  
  # Plots bar chart
  ggplot(mapping = aes(x = names(win_counts), y = win_counts)) +
    geom_bar(stat = "identity", fill = "darkgray") +
    labs(title = paste("Number of Tournament Wins at", tournament, "(2013 - 2023)"),
         x = "Player",
         y = "Number of Title Wins") +
    theme_minimal() +
    scale_y_continuous(breaks = seq(0, max(win_counts), by = 1)) + 
    theme(plot.title = element_text(face = "bold", size = 12, hjust = 0.5))
}

# Example usage:
plot_tournament_wins("Djokovic N.", "Federer R.", "Nadal R.", "Australian Open")