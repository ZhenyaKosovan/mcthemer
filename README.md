## mcthemer: ggplot2 extension with Mastercard Theme

### Overview

mcthemer provides a collection of functions for adjusting default ggplots with Mastercard branding

### Installation

You can install the released version from CRAN (if available):

``` R
install.packages("mcthemer")
```

Or install the development version from GitHub:

``` R
if (!requireNamespace("devtools", quietly = TRUE)) {
    install.packages("devtools")
}
devtools::install_github("ZhenyaKosovan/mcthemer")
```

### Usage

```{r}
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
```

### Documentation

For help, use the help pages or vignettes:

```{r}
?mcthemer
vignette("mcthemer")
```

### Contributing

Contributions are welcome. Please refer to the repository for guidelines on how to contribute (e.g., opening issues or pull requests).
