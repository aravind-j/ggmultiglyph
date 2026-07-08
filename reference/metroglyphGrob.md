# Draw a Metroglyph

Uses [`Grid`](https://rdrr.io/r/grid/Grid.html) graphics to draw a
metroglyph (Anderson 1957; duToit et al. 1986) .

## Usage

``` r
metroglyphGrob(
  x = 0.5,
  y = 0.5,
  z,
  size = 1,
  circle.size = 5,
  col.circle = "black",
  col.ray = "black",
  col.points = "black",
  fill = NA,
  lwd.circle = 1,
  lwd.ray = 1,
  alpha = 1,
  angle.start = 0,
  angle.stop = 2 * base::pi,
  lineend = c("round", "butt", "square"),
  grid.levels = NULL,
  draw.grid = FALSE,
  grid.point.size = 10
)
```

## Arguments

- x:

  A numeric vector or unit object specifying x-locations.

- y:

  A numeric vector or unit object specifying y-locations.

- z:

  A numeric vector specifying the length of rays.

- size:

  The size of rays.

- circle.size:

  The size of the central circle (radius).

- col.circle:

  The circle colour.

- col.ray:

  The colour of rays.

- col.points:

  The colour of grid points.

- fill:

  The circle fill colour.

- lwd.circle:

  The circle line width.

- lwd.ray:

  The ray line width.

- alpha:

  The alpha transparency value.

- angle.start:

  The start angle for the glyph rays in radians. Default is zero.

- angle.stop:

  The stop angle for the glyph rays in radians. Default is \\2\pi\\.

- lineend:

  The line end style for the rays. Either `"round"`, `"butt"` or
  `"square"`.

- grid.levels:

  A list of grid levels (as vectors) corresponding to the values in `z`
  at which points are to be plotted. The values in `z` should be present
  in the list specified.

- draw.grid:

  logical. If `TRUE`, grid points are plotted along the whiskers.
  Default is `FALSE`.

- grid.point.size:

  The size of the grid points in native units.

## Value

A [`gTree`](https://rdrr.io/r/grid/grid.grob.html) object.

## References

Anderson E (1957). “A semigraphical method for the analysis of complex
problems.” *Proceedings of the National Academy of Sciences of the
United States of America*, **43**(10), 923.  
  
duToit SHC, Steyn AGW, Stumpf RH (1986). *Graphical Exploratory Data
Analysis*, Springer Texts in Statistics. Springer-Verlag, New York. ISBN
978-1-4612-9371-2.

## See also

[`geom_metroglyph`](https://aravind-j.github.io/ggmultiglyph/reference/geom_metroglyph.md)

Other grobs:
[`dotglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/dotglyphGrob.md),
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
# Adjust ray size
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20)

grid.arrange(mg1, mg2, mg3, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust circle size
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      circle.size = 0, size = 15)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      circle.size = 2, size = 15)

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      circle.size = 5, size = 15)

grid.arrange(mg1, mg2, mg3, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust angle
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      size = 15, circle.size = 2)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      size = 15, circle.size = 2,
                      angle.start = 0, angle.stop = base::pi)

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      size = 15, circle.size = 2,
                      angle.start = 90 * (base::pi/180),
                      angle.stop = 270 * (base::pi/180))

mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      size = 15, circle.size = 2,
                      angle.start = 2 * base::pi,
                      angle.stop = 0)

mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      size = 15, circle.size = 2,
                      angle.start = base::pi, angle.stop = 0)

mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                      size = 15, circle.size = 2,
                      angle.start = 270 * (base::pi/180),
                      angle.stop = 90 * (base::pi/180))

grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust circle and ray line width
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 3, lwd.circle = 0.1)

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 0.1, lwd.circle = 3)

mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      angle.start = 0, angle.stop = base::pi)

mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 3, lwd.circle = 0.1,
                      angle.start = 0, angle.stop = base::pi)

mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 0.1, lwd.circle = 3,
                      angle.start = 0, angle.stop = base::pi)

grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust fill colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      fill = "salmon")

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 3, lwd.circle = 0.1,
                      fill = "cyan")

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 0.1, lwd.circle = 3,
                      fill = "green")

mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      angle.start = 0, angle.stop = base::pi,
                      fill = "salmon")

mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 3, lwd.circle = 0.1,
                      angle.start = 0, angle.stop = base::pi,
                      fill = "cyan")

mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 0.1, lwd.circle = 3,
                      angle.start = 0, angle.stop = base::pi,
                      fill = "green")

grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust ray colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      col.circle = "gray")

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 3, lwd.circle = 0.1,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      col.circle = "gray")

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 0.1, lwd.circle = 3,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      col.circle = "gray")

mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      angle.start = 0, angle.stop = base::pi,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      col.circle = "gray")

mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 3, lwd.circle = 0.1,
                      angle.start = 0, angle.stop = base::pi,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      col.circle = "gray")

mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
                      lwd.ray = 0.1, lwd.circle = 3,
                      angle.start = 0, angle.stop = base::pi,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      col.circle = "gray")

grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust line end style
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
                      lwd.ray = 10)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
                      lwd.ray = 10, lineend = "butt")

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
                      lwd.ray = 10, lineend = "square")

grid.arrange(mg1, mg2, mg3, nrow = 1, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust grid levels
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Grid levels
gl <- split(x = c(rep(c(1, 2, 3), 4),
                  rep(c(1, 2, 3, 4), 2)),
            f = c(rep(1:4, each = 3),
                  rep(5:6, each = 4)))
gl
#> $`1`
#> [1] 1 2 3
#> 
#> $`2`
#> [1] 1 2 3
#> 
#> $`3`
#> [1] 1 2 3
#> 
#> $`4`
#> [1] 1 2 3
#> 
#> $`5`
#> [1] 1 2 3 4
#> 
#> $`6`
#> [1] 1 2 3 4
#> 

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.01)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      lwd.ray = 3, col.points = "white",
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.05)

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      draw.grid = FALSE, grid.levels = gl,
                      grid.point.size = 0.05)

mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      angle.start = 0, angle.stop = base::pi,
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.01)

mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      lwd.ray = 3,
                      angle.start = 0, angle.stop = base::pi,
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.05)

mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      angle.start = 0, angle.stop = base::pi,
                      draw.grid = FALSE, grid.levels = gl)

grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust fill, ray and grid level colours
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      draw.grid = TRUE, grid.levels = gl,
                      col.points = NA,
                      grid.point.size = 0.05)

mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      lwd.ray = 3,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.05)

mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      circle.size = 0, col.points = "white",
                      lwd.ray = 3,
                      draw.grid = TRUE, grid.levels = gl,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      grid.point.size = 0.05)

mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      angle.start = 0, angle.stop = base::pi,
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.01)

mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      col.circle = "gray",
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      angle.start = 0, angle.stop = base::pi,
                      draw.grid = TRUE, grid.levels = gl,
                      grid.point.size = 0.03, col.points = "gray")

mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                      z = c(1, 3, 2, 1, 2, 3), size = 5,
                      angle.start = 0, angle.stop = base::pi,
                      draw.grid = FALSE, grid.levels = gl,
                      col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                      grid.point.size = 0.05)

grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)

```
