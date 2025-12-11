library(ggplot2)
library(dplyr)

spotify <- read.csv("spotify-2023.csv",
                    stringsAsFactors = FALSE,
                    fileEncoding = "latin1",
                    check.names = FALSE)


spotify_clean <- spotify %>%
  filter(mode %in% c("Major", "Minor")) %>%
  mutate(
