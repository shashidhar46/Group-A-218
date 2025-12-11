
library(ggplot2)
library(dplyr)

spotify <- read.csv("spotify-2023.csv",
                    stringsAsFactors = FALSE,
                    fileEncoding = "latin1",
                    check.names = FALSE)


spotify_clean <- spotify %>%
  filter(mode %in% c("Major", "Minor")) %>%
  mutate(
  danceability = as.numeric(`danceability_%`),
    mode        = factor(mode, levels = c("Major", "Minor"))
  )

ttest_res <- t.test(danceability ~ mode, data = spotify_clean)
print(ttest_res)


ggplot(spotify_clean, aes(x = mode, y = danceability, fill = mode)) +
  geom_boxplot(show.outliers = FALSE, alpha = 0.7) +
  labs(
    title = "Danceability by Song Mode",
    x = "Mode",
    y = "Danceability (%)"
  ) +
theme_minimal() +
  theme(legend.position = "none")

ggplot(spotify_clean, aes(x = danceability, fill = mode)) +
  geom_histogram(position = "identity", alpha = 0.6, bins = 30) +
  labs(
