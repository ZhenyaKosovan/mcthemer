library(ggplot2)
library(palmerpenguins)
library(mcthemer)

# Line plot: average body mass by species across island
avg_mass <- aggregate(body_mass_g ~ species + island, data = penguins, FUN = mean, na.rm = TRUE)
ggplot(avg_mass, aes(x = island, y = body_mass_g, group = species, color = species)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  labs(title = "Average Body Mass by Species and Island",
       x = "Island",
       y = "Average Body Mass (g)") +
  theme_mastercard()

# Scatter plot: flipper length vs body mass colored by species
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point(alpha = 0.7, size = 3) +
  labs(title = "Flipper Length vs Body Mass",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_mastercard()

# Bar plot: count of penguins per species
ggplot(penguins, aes(x = species, fill = species)) +
  geom_bar(show.legend = FALSE) +
  labs(title = "Count of Penguins per Species",
       x = "Species",
       y = "Count") +
  theme_mastercard()
