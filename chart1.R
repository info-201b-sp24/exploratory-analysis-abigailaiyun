# Exploratory Analysis, Chart 1
# Court Surface Distribution by Tournament Series (2013-2023)
# Stefan Cutovic, Madi Trimmer, Abby Williams

# Load the required libraries
library(ggplot2)
library(dplyr)

# Read the CSV file
tennis_data <- read.csv("tennis_atp_3.csv")

# Ensure 'Surface' and 'Series' are treated as categorical variables
tennis_data$Surface <- factor(tennis_data$Surface, levels = c("Clay", "Grass", "Hard"))
tennis_data$Series <- factor(tennis_data$Series)

# Count the number of matches played on each surface for each series using count()
surface_counts <- tennis_data %>%
  count(Series, Surface, name = "Count")

# Create the bar plot with dodged bars and a centered title
ggplot(surface_counts, aes(x = Series, y = Count, fill = Surface)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Tournament Series", y = "Number of Matches Played", 
       title = "Court Surface Distribution by Tournament Series (2013 - 2023)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 12, face = "bold"))