# Exploratory Analysis, Chart 1
# Court Surface Distribution by Tournament Series (2013-2023)
# Stefan Cutovic, Madi Trimmer, Abby Williams

# Loads required libraries to perform visualization
library(ggplot2)
library(dplyr)

tennis_data <- read.csv("tennis_atp_3.csv")

# Ensures 'Surface' and 'Series' are treated as categorical variables
tennis_data$Surface <- factor(tennis_data$Surface, 
                              levels = c("Clay", "Grass", "Hard"))
tennis_data$Series <- factor(tennis_data$Series)

# Counts number of matches played on each surface for each series
surface_counts <- tennis_data %>%
  group_by(Series, Surface) %>%
  summarise(Count = n()) %>%
  ungroup()

# Creates bar plot
ggplot(surface_counts, aes(x = Series, y = Count, fill = Surface)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Tournament Series", y = "Number of Matches Played", 
       title = "Court Surface Distribution by Tournament Series (2013 - 2023)") +
  theme(plot.title = element_text(hjust = 0.5, size = 12, face = "bold"))