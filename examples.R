library(ggplot2)
library(palmerpenguins)
library(mcthemer)
# Line plot: counts of penguins by species and year
counts_year <- as.data.frame(table(penguins$year, penguins$species))
colnames(counts_year) <- c("year", "species", "count")
counts_year$year <- as.numeric(as.character(counts_year$year))
ggplot(counts_year, aes(x = year, y = count, group = species, colour = species)) +
  geom_line(linewidth = 1.2) +
  geom_point(size = 3) +
  scale_colour_mastercard() +
  scale_x_continuous(expand = c(0, 0)) +
  labs(
    title = "Counts of Penguins by Species and Year",
    x = "Year",
    y = "Count",
    caption = "Source: palmerpenguins package"
  ) +
  theme_mastercard() +
  theme(
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 12),
    plot.caption = element_text(size = 9, face = "italic")
  )

# Scatter plot: flipper length vs body mass colored by species
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point(alpha = 0.7, size = 3) +
  scale_colour_mastercard() +
  scale_x_continuous(expand = c(0, 0)) +
  labs(
    title = "Flipper Length vs Body Mass",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)",
    caption = "Source: palmerpenguins package"
  ) +
  theme_mastercard() +
  theme(
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 12),
    plot.caption = element_text(size = 9, face = "italic")
  )

ggplot(penguins, aes(x = species, fill = species)) +
  geom_bar(show.legend = FALSE) +
  scale_fill_mastercard() +
  scale_x_discrete(expand = c(0, 0)) +
  labs(
    title = "Count of Penguins per Species",
    x = "Species",
    y = "Count",
    caption = "Source: palmerpenguins package"
  ) +
  theme_mastercard() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(size = 12),
    plot.caption = element_text(size = 9, face = "italic")
  )
