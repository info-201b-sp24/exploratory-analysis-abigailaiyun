# Loads data
tennis_atp <- read.csv("tennis_atp_3.csv")

# Modify column names
colnames(tennis_atp) <- c("Tournament", 
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
# removes first row of data (used for column names)
tennis_atp <- tennis_atp[-1, ]

# A function that takes in a dataset and returns a list of info about it:
# Install and load the dplyr package
suppressPackageStartupMessages(library(dplyr))

summary_info <- list()
summary_info$num_observations <- nrow(tennis_atp)
summary_info$Pts_1 <- tennis_atp %>%
  filter(Pts_1 == max(Pts_1, na.rm = T)) %>%
  select(Pts_1) %>% 
  pull()