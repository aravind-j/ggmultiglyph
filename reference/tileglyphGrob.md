# Draw a Tile Glyph

Uses [`Grid`](https://rdrr.io/r/grid/Grid.html) graphics to draw a tile
glyph similar to 'autoglyph' (Beddow 1990) or 'stripe glyph' (Fuchs et
al. 2013) .

## Usage

``` r
tileglyphGrob(
  x = 0.5,
  y = 0.5,
  z,
  size = 10,
  ratio = 1,
  nrow = 1,
  col = "black",
  fill = NA,
  lwd = 1,
  alpha = 1,
  linejoin = c("mitre", "round", "bevel")
)
```

## Arguments

- x:

  A numeric vector or unit object specifying x-locations.

- y:

  A numeric vector or unit object specifying y-locations.

- z:

  A numeric vector specifying the values to be plotted as dimensions in
  the tileglyph.

- size:

  The size of glyphs.

- ratio:

  The aspect ratio (height / width).

- nrow:

  The number of rows.

- col:

  The line colour.

- fill:

  The fill colour.

- lwd:

  The line width.

- alpha:

  The alpha transparency value.

- linejoin:

  The line join style for the tile polygon. Either `"mitre"`, `"round"`
  or `"bevel"`.

## Value

A [`grob`](https://rdrr.io/r/grid/grid.grob.html) object.

## References

Beddow J (1990). “Shape coding of multidimensional data on a
microcomputer display.” In *Proceedings of the First IEEE Conference on
Visualization: Visualization \`90*, 238–246. ISBN 978-0-8186-2083-6.  
  
Fuchs J, Fischer F, Mansmann F, Bertini E, Isenberg P (2013).
“Evaluation of alternative glyph designs for time series data in a small
multiple setting.” In *Proceedings of the SIGCHI Conference on Human
Factors in Computing Systems*, 3237–3246. ISBN 978-1-4503-1899-0.

## See also

[`geom_tileglyph`](https://aravind-j.github.io/ggmultiglyph/reference/geom_tileglyph.md)

Other grobs:
[`dotglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/dotglyphGrob.md),
[`metroglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/metroglyphGrob.md),
[`pieglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/pieglyphGrob.md),
[`profileglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/profileglyphGrob.md),
[`starglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/starglyphGrob.md)

## Examples

``` r
library(ggmultiglyph)
library(grid)
library(gridExtra)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust tile size
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 3)

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5)

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 8)

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 3, nrow = 2)

tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2)

tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 8, nrow = 2)

grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
             nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust line width
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5)

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, lwd = 3)

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, lwd = 5)

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2)

tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2, lwd = 3)

tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2, lwd = 5)

grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
             nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust line join style
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4),
                     size = 5, lwd = 10)

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4),
                     size = 5, lwd = 10, linejoin = "bevel")

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4),
                     size = 5, lwd = 10, linejoin = "round")

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4),
                     size = 5, nrow = 2, lwd = 10)

tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4),
                     size = 5, nrow = 2, lwd = 10,
                     linejoin = "bevel")

tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4),
                     size = 5, nrow = 2, lwd = 10,
                     linejoin = "round")

grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
             nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust rows
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5)

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                     size = 5)

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2)

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                     size = 5, nrow = 2)

grid.arrange(tg1, tg2, tg3, tg4,
             nrow = 2, ncol = 2)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust tile ratio
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5)

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, ratio = 0.5)

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, ratio = 3)

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2)

tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2, ratio = 0.5)

tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2, ratio = 3)

grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
             nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Multivariate tile fill
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5,
                     fill = RColorBrewer::brewer.pal(7, "Dark2"))

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                     size = 5,
                     fill = RColorBrewer::brewer.pal(6, "Dark2"))

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2,
                     fill = RColorBrewer::brewer.pal(7, "Dark2"))

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                     size = 5, nrow = 2,
                     fill = RColorBrewer::brewer.pal(6, "Dark2"))

grid.arrange(tg1, tg2, tg3, tg4,
             nrow = 2, ncol = 2)


```
