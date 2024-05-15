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
summary_info <- list()
summary_info$num_observations <- nrow(tennis_atp)
summary_info$some_max_value <- tennis_atp %>%
  filter(some_var == max(, na.rm = T)) %>%
  select(some_label)