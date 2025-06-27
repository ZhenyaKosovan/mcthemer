# ─────────────────────────────────────────────────────────────────────────────
# Mastercard brand theme & palettes for ggplot2  (depends: ggplot2, hrbrthemes)
# ─────────────────────────────────────────────────────────────────────────────

# ---- 1.  corporate colours --------------------------------------------------
mc_cols <- c(
  red      = "#EB001B", # Cadmium Red
  orange   = "#FF5F00", # Vivid Orange
  yellow   = "#F79E1B", # Bright Yellow
  dark     = "#231F20", # Raisin Black (for text/axes)
  gray     = "#E3DFD7" # Light warm grey (optional bg)
)

# ---- 2.  palette constructors ----------------------------------------------
mc_pal <- function(reverse = FALSE, ...) {
  cols <- if (reverse) rev(mc_cols) else mc_cols
  scales::manual_pal(unname(cols))
}

# discrete scales
scale_colour_mastercard <- function(..., reverse = FALSE) {
  ggplot2::scale_colour_manual(values = mc_pal(reverse)(length(mc_cols)), ...)
}
scale_fill_mastercard <- function(..., reverse = FALSE) {
  ggplot2::scale_fill_manual(values = mc_pal(reverse)(length(mc_cols)), ...)
}

# continuous scales
scale_colour_mastercard_c <- function(..., reverse = FALSE) {
  ggplot2::scale_colour_gradientn(colours = mc_pal(reverse)(256), ...)
}
scale_fill_mastercard_c <- function(..., reverse = FALSE) {
  ggplot2::scale_fill_gradientn(colours = mc_pal(reverse)(256), ...)
}

# ---- 3.  Mastercard theme ---------------------------------------------------
# 2. Mastercard theme ---------------------------------------------------------
theme_mastercard <- function(base_size = 11,
                             base_family = c(
                               "Mark for MC", # 1st choice
                               "Helvetica", # Mac fallback
                               "Arial"
                             )[1], # Windows fallback
                             grid_y = TRUE) {
  hrbrthemes::theme_ipsum(
    base_family = base_family,
    base_size   = base_size,
    grid        = if (grid_y) "Y" else "", # horizontal lines only
    axis        = "xy"
  ) %+replace%
    ggplot2::theme(
      # neutral, open canvas
      plot.background = ggplot2::element_rect(fill = "white", colour = NA),
      panel.background = ggplot2::element_rect(fill = "white", colour = NA),

      # typography
      text = ggplot2::element_text(colour = mc_cols["dark"]),
      plot.title = ggplot2::element_text(
        colour = "black",
        face = "bold",
        size = ggplot2::rel(1.4)
      ),
      plot.subtitle = ggplot2::element_text(size = ggplot2::rel(1)),

      # grid
      panel.grid.major.y = ggplot2::element_line(
        colour = mc_cols["gray"],
        linewidth = 0.25
      ),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),

      # axes & ticks
      axis.text = ggplot2::element_text(colour = mc_cols["dark"]),
      axis.ticks = ggplot2::element_line(colour = mc_cols["gray"]),

      # legend
      legend.position = "bottom",
      legend.title = ggplot2::element_text(face = "bold")
    )
}
