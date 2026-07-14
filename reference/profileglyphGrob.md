# Draw a Profile Glyph

Uses [`Grid`](https://rdrr.io/r/grid/Grid.html) graphics to draw a
profile glyph (Chambers et al. 1983; duToit et al. 1986) .

## Usage

``` r
profileglyphGrob(
  x = 0.5,
  y = 0.5,
  z,
  size = 1,
  col.bar = "black",
  col.line = "black",
  fill = NA,
  lwd.bar = 1,
  lwd.line = 1,
  alpha = 1,
  width = 5,
  flip.axes = FALSE,
  bar = TRUE,
  line = TRUE,
  mirror = TRUE,
  linejoin = c("mitre", "round", "bevel"),
  lineend = c("round", "butt", "square"),
  grid.levels = NULL,
  draw.grid = FALSE,
  col.grid = "grey",
  lwd.grid = 1
)
```

## Arguments

- x:

  A numeric vector or unit object specifying x-locations.

- y:

  A numeric vector or unit object specifying y-locations.

- z:

  A numeric vector specifying the values to be plotted as dimensions of
  the profile (length of the bars).

- size:

  The size of glyphs.

- col.bar:

  The colour of bars.

- col.line:

  The colour of profile line(s).

- fill:

  The fill colour.

- lwd.bar:

  The line width of the bars.

- lwd.line:

  The line width of the profile line(s)

- alpha:

  The alpha transparency value.

- width:

  The width of the bars.

- flip.axes:

  logical. If `TRUE`, axes are flipped.

- bar:

  logical. If `TRUE`, profile bars are plotted.

- line:

  logical. If `TRUE`, profile line is plotted.

- mirror:

  logical. If `TRUE`, mirror profile is plotted.

- linejoin:

  The line join style for the profile line(s) and bars. Either
  `"mitre"`, `"round"` or `"bevel"`.

- lineend:

  The line end style for the whisker lines. Either `"round"`, `"butt"`
  or `"square"`.

- grid.levels:

  A list of grid levels (as vectors) corresponding to the values in `z`
  at which grid lines are to be plotted. The values in `z` should be
  present in the list specified.

- draw.grid:

  logical. If `TRUE`, grid lines are plotted along the bars. Default is
  `FALSE`.

- col.grid:

  The colour of the grid lines.

- lwd.grid:

  The line width of the grid lines.

## Value

A [`gTree`](https://rdrr.io/r/grid/grid.grob.html) object.

## References

Chambers JM, Cleveland WS, Kleiner B, Tukey PA (1983). *Graphical
Methods for Data Analysis*. Chapman and Hall/CRC, Boca Raton. ISBN
978-1-351-07230-4.  
  
duToit SHC, Steyn AGW, Stumpf RH (1986). *Graphical Exploratory Data
Analysis*, Springer Texts in Statistics. Springer-Verlag, New York. ISBN
978-1-4612-9371-2.

## See also

[`geom_profileglyph`](https://aravind-j.github.io/ggmultiglyph/reference/geom_profileglyph.md)

Other grobs:
[`dotglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/dotglyphGrob.md),
[`metroglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/metroglyphGrob.md),
[`pieglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/pieglyphGrob.md),
[`starglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/starglyphGrob.md),
[`tileglyphGrob()`](https://aravind-j.github.io/ggmultiglyph/reference/tileglyphGrob.md)

## Examples

``` r
library(ggmultiglyph)
library(grid)
library(gridExtra)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Profile bar, line, mirror and flip.axes combination
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE, mirror = FALSE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, , mirror = FALSE,
                   line = TRUE, bar = FALSE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, mirror = FALSE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE, flip.axes = TRUE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, flip.axes = TRUE)

barglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, , mirror = FALSE, flip.axes = TRUE,
                   line = TRUE, bar = FALSE)

barprofileglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, mirror = FALSE, flip.axes = TRUE)

grid.arrange(barglyph1, profileglyph1, barprofileglyph1,
             barglyph2, profileglyph2, barprofileglyph2,
             nrow = 2, ncol = 3)

grid.arrange(barglyph3, profileglyph3, barprofileglyph3,
             barglyph4, profileglyph4, barprofileglyph4,
             nrow = 2, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust size
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = FALSE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = TRUE, bar = FALSE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE, bar = FALSE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = TRUE, bar = FALSE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = FALSE, mirror = FALSE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = TRUE,
                   bar = FALSE, mirror = FALSE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, mirror = FALSE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE, mirror = FALSE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE,
                   bar = FALSE, mirror = FALSE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, mirror = FALSE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE, mirror = FALSE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = TRUE,
                   bar = FALSE, mirror = FALSE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, mirror = FALSE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = FALSE, flip.axes = TRUE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, flip.axes = TRUE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE, flip.axes = TRUE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, flip.axes = TRUE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE, flip.axes = TRUE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, flip.axes = TRUE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, line = TRUE,
                   bar = FALSE, mirror = FALSE, flip.axes = TRUE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 5, mirror = FALSE, flip.axes = TRUE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE,
                   bar = FALSE, mirror = FALSE, flip.axes = TRUE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, mirror = FALSE, flip.axes = TRUE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = TRUE,
                   bar = FALSE, mirror = FALSE, flip.axes = TRUE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, mirror = FALSE, flip.axes = TRUE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust width
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = FALSE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = TRUE, bar = FALSE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = FALSE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = TRUE, bar = FALSE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = FALSE, mirror = FALSE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = TRUE,
                   bar = FALSE, mirror = FALSE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, mirror = FALSE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = FALSE, mirror = FALSE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = TRUE,
                   bar = FALSE, mirror = FALSE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, mirror = FALSE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE, mirror = FALSE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE,
                   bar = FALSE, mirror = FALSE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, mirror = FALSE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = FALSE, flip.axes = TRUE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, flip.axes = TRUE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = FALSE, flip.axes = TRUE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, flip.axes = TRUE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE, flip.axes = TRUE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE,
                   flip.axes = TRUE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, flip.axes = TRUE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, line = TRUE,
                   bar = FALSE, mirror = FALSE, flip.axes = TRUE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 1, mirror = FALSE, flip.axes = TRUE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, line = TRUE,
                   bar = FALSE, mirror = FALSE, flip.axes = TRUE)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, width = 3, mirror = FALSE, flip.axes = TRUE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE,
                   bar = FALSE, mirror = FALSE, flip.axes = TRUE)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, mirror = FALSE, flip.axes = TRUE)

grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust bar and profile line width
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE)

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE)

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE,
                   lwd.bar= 3)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE,
                   lwd.line = 3)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, lwd.bar= 3, lwd.line = 3)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = FALSE,
                   lwd.bar= 5)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, line = TRUE, bar = FALSE,
                   lwd.line = 5)

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 10, lwd.bar= 5, lwd.line = 5)

grid.arrange(barglyph1, barglyph2, barglyph3,
             profileglyph1, profileglyph2, profileglyph3,
             barprofileglyph1, barprofileglyph2, barprofileglyph3,
             nrow = 3, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust bar and line colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE,
                   col.bar = "cyan")

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE, bar = FALSE,
                   col.line = "green")

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15,
                   col.bar = "salmon", col.line = "salmon")

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE,
                   fill = "cyan")

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE, bar = FALSE,
                   fill = "green")

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15,
                   fill = "salmon")

grid.arrange(barglyph1, barglyph2, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)


barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE,
                   mirror = FALSE, col.bar = "cyan")

profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE, bar = FALSE,
                   mirror = FALSE, col.line = "green")

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15,
                   mirror = FALSE, col.bar = "salmon", col.line = "salmon")

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = FALSE,
                   mirror = FALSE, fill = "cyan")

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15, line = TRUE, bar = FALSE,
                   mirror = FALSE, fill = "green")

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 15,
                   mirror = FALSE, fill = "salmon")

grid.arrange(barglyph1, barglyph2, nrow = 1)

grid.arrange(profileglyph1, profileglyph2, nrow = 1)

grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Multivariate bar fill colour
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE, mirror = FALSE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, mirror = FALSE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE, flip.axes = TRUE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, flip.axes = TRUE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, line = FALSE,
                   mirror = FALSE, flip.axes = TRUE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, mirror = FALSE, flip.axes = TRUE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

grid.arrange(barglyph1, barprofileglyph1,
             barglyph2, barprofileglyph2,
             nrow = 2, ncol = 2)

grid.arrange(barglyph3, barprofileglyph3,
             barglyph4, barprofileglyph4,
             nrow = 2, ncol = 2)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust line join style
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.bar = 10, width = 5,
                   line = FALSE)

barglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.bar = 10, width = 5,
                   linejoin = "round", line = FALSE)

barglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.bar = 10, width = 5,
                   linejoin = "bevel", line = FALSE)

grid.arrange(barglyph1, barglyph2, barglyph3,
             nrow = 1, ncol = 3)


profileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.line = 10, width = 5,
                   bar = FALSE)

profileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.line = 10, width = 5,
                   linejoin = "round", bar = FALSE)

profileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.line = 10, width = 5,
                   linejoin = "bevel", bar = FALSE)

grid.arrange(profileglyph1, profileglyph2, profileglyph3,
             nrow = 1, ncol = 3)


barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.bar = 10, width = 5)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.bar = 10, width = 5,
                   linejoin = "round")

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.bar = 10, width = 5,
                   linejoin = "bevel")

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3,
             nrow = 1, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust line end style
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.line = 10, width = 5)

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.line = 10, width = 5,
                   lineend = "butt")

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 25, lwd.line = 10, width = 5,
                   lineend = "square")

grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3,
             nrow = 1, ncol = 3)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust grid levels
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Grid lines
gl <- split(x = rep(c(1, 2, 3), 6),
            f = rep(1:6, each = 3))

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5,
                   draw.grid = TRUE, lwd.bar = 5,
                   grid.levels = gl, col.grid = "black")

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5, lwd.bar = 5,
                   draw.grid = TRUE, mirror = FALSE,
                   grid.levels = gl, col.grid = "black")

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5, flip.axes = TRUE,
                   draw.grid = TRUE, lwd.bar = 5,
                   grid.levels = gl, col.grid = "black")

barprofileglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5, flip.axes = TRUE,
                   draw.grid = TRUE, lwd.bar = 5, mirror = FALSE,
                   grid.levels = gl, col.grid = "black")

grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)

grid.arrange(barprofileglyph3, barprofileglyph4, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Adjust grid level colours
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Grid lines
gl <- split(x = rep(c(1, 2, 3), 6),
            f = rep(1:6, each = 3))

barprofileglyph1 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5,
                   draw.grid = TRUE, lwd.bar = 5,
                   grid.levels = gl, line = FALSE,
                   col.grid = "white", col.bar = "white",
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph2 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5, lwd.bar = 5,
                   draw.grid = TRUE, mirror = FALSE,
                   grid.levels = gl, line = FALSE,
                   col.grid = "white", col.bar = "white",
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph3 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5, flip.axes = TRUE,
                   draw.grid = TRUE, lwd.bar = 5,
                   grid.levels = gl, line = FALSE,
                   col.grid = "white", col.bar = "white",
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

barprofileglyph4 <-
  profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(1, 3, 2, 1, 2, 3),
                   size = 10, width = 5, flip.axes = TRUE,
                   draw.grid = TRUE, lwd.bar = 5, mirror = FALSE,
                   grid.levels = gl, line = FALSE,
                   col.grid = "white", col.bar = "white",
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)

grid.arrange(barprofileglyph3, barprofileglyph4, nrow = 1)

```
