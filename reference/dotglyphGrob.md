# Draw a Dot Profile Glyph

Uses [`Grid`](https://rdrr.io/r/grid/Grid.html) graphics to draw a dot
profile glyph (Chambers et al. 1983; duToit et al. 1986) .

## Usage

``` r
dotglyphGrob(
  x = 0.5,
  y = 0.5,
  z,
  radius = 1,
  col = "black",
  fill = NA,
  lwd = 1,
  alpha = 1,
  mirror = FALSE,
  flip.axes = FALSE
)
```

## Arguments

- x:

  A numeric vector or unit object specifying x-locations.

- y:

  A numeric vector or unit object specifying y-locations.

- z:

  A numeric vector specifying the values to be plotted as dimensions of
  the dot glyph (number of stacked dots).

- radius:

  The radius of the glyphs.

- col:

  The line colour.

- fill:

  The fill colour.

- lwd:

  The line width.

- alpha:

  The alpha transparency value.

- mirror:

  logical. If `TRUE`, mirror profile is plotted.

- flip.axes:

  logical. If `TRUE`, axes are flipped.

## Value

A [`grob`](https://rdrr.io/r/grid/grid.grob.html) object.

## References

Chambers JM, Cleveland WS, Kleiner B, Tukey PA (1983). *Graphical
Methods for Data Analysis*. Chapman and Hall/CRC, Boca Raton. ISBN
978-1-351-07230-4.  
  
duToit SHC, Steyn AGW, Stumpf RH (1986). *Graphical Exploratory Data
Analysis*, Springer Texts in Statistics. Springer-Verlag, New York. ISBN
978-1-4612-9371-2.

## See also

[`geom_dotglyph`](https://aravind-j.github.io/ggmultiglyph/reference/geom_dotglyph.md)

Other grobs:
[`metroglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/metroglyphGrob.md),
[`pieglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/pieglyphGrob.md),
[`profileglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/profileglyphGrob.md),
[`starglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/starglyphGrob.md),
[`tileglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/tileglyphGrob.md)

## Examples

``` r
library(ggmultiglyph)
library(grid)
library(gridExtra)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mirror and flip.axes combination
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE)

grid.arrange(dg1, dg2, nrow = 1)

grid.arrange(dg3, dg4, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust radius
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 0.5)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 3)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 0.5, mirror = TRUE)

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE)

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 3, mirror = TRUE)

grid.arrange(dg1, dg2, dg3, nrow = 1)

grid.arrange(dg4, dg5, dg6, nrow = 1)


dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 0.5, flip.axes = TRUE)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 3, flip.axes = TRUE)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 0.5, mirror = TRUE,
                    flip.axes = TRUE)

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE)

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 3, mirror = TRUE,
                    flip.axes = TRUE)

grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)

grid.arrange(dg4, dg5, dg6, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust dot line width
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, lwd = 3)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, lwd = 5)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE)

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, lwd = 3)

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, lwd = 5)

grid.arrange(dg1, dg2, dg3, nrow = 1)

grid.arrange(dg4, dg5, dg6, nrow = 1)


dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, lwd = 3)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, lwd = 5)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE)

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, lwd = 3)

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, lwd = 5)

grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)

grid.arrange(dg4, dg5, dg6, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust dot fill
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = "salmon")

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = "cyan")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = "green")

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, fill = "salmon")

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, fill = "cyan")

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, fill = "green")

grid.arrange(dg1, dg2, dg3, nrow = 1)

grid.arrange(dg4, dg5, dg6, nrow = 1)


dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, fill = "salmon")

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, fill = "cyan")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, fill = "green")

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, fill = "salmon")

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, fill = "cyan")

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, fill = "green")

grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)

grid.arrange(dg4, dg5, dg6, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust dot line colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, col = "salmon")

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, col = "cyan")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, col = "green")

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, col = "salmon")

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, col = "cyan")

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, col = "green")

grid.arrange(dg1, dg2, dg3, nrow = 1)

grid.arrange(dg4, dg5, dg6, nrow = 1)


dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, col = "salmon")

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, col = "cyan")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, col = "green")

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, col = "salmon")

dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, col = "cyan")

dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, col = "green")

grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)

grid.arrange(dg4, dg5, dg6, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Multivariate fill colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

clrs <- mapply(function(a, b) rep(a, b),
               RColorBrewer::brewer.pal(6, "Dark2"),
               round(c(4, 3.5, 2.7, 6.8, 3.4, 5.7)))
clrs <- unlist(clrs)

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = clrs,
                    col = "black")

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = clrs,
                    col = "white")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, fill = clrs,
                    col = "black")

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE, fill = clrs,
                    col = "white")

grid.arrange(dg1, dg2, nrow = 1)

grid.arrange(dg3, dg4, nrow = 1)


dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, fill = clrs,
                    col = "black")

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE, fill = clrs,
                    col = "white")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, fill = clrs,
                    col = "black")

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE, fill = clrs,
                    col = "white")

grid.arrange(dg1, dg2, nrow = 1)

grid.arrange(dg3, dg4, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Multivariate dot line colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = "black", lwd = 5,
                    col = clrs)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, fill = "white", lwd = 5,
                    col = clrs)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    fill = "black", lwd = 5,
                    col = clrs)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    fill = "white", lwd = 5,
                    col = clrs)

grid.arrange(dg1, dg2, nrow = 1)

grid.arrange(dg3, dg4, nrow = 1)


dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE,
                    fill = "black", lwd = 5,
                    col = clrs)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE,
                    fill = "white", lwd = 5,
                    col = clrs)

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE,
                    fill = "black", lwd = 5,
                    col = clrs)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE,
                    fill = "white", lwd = 5,
                    col = clrs)

grid.arrange(dg1, dg2, nrow = 1)

grid.arrange(dg3, dg4, nrow = 1)

```
