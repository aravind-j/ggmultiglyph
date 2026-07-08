# Add Profile Glyphs as a Scatterplot

The profileglyph geom is used to plot multivariate data as profile
glyphs (Chambers et al. 1983; duToit et al. 1986) in a scatterplot.

## Usage

``` r
geom_profileglyph(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  cols = character(0L),
  width = 10,
  size = 1,
  colour.bar = NULL,
  colour.line = NULL,
  colour.grid = NULL,
  linewidth.line = 1,
  linewidth.bar = 1,
  linewidth.grid = 1,
  fill.bar = NULL,
  fill.gradient = NULL,
  flip.axes = FALSE,
  bar = TRUE,
  line = TRUE,
  mirror = TRUE,
  draw.grid = FALSE,
  legend.glyph.dims = setNames(rep(0.5, length(cols)), cols),
  show.legend = NA,
  repel = FALSE,
  repel.control = ggmultiglyph.repel.control(),
  inherit.aes = TRUE
)
```

## Arguments

- mapping:

  Set of aesthetic mappings created by
  [`aes()`](https://ggplot2.tidyverse.org/reference/aes.html). If
  specified and `inherit.aes = TRUE` (the default), it is combined with
  the default mapping at the top level of the plot. You must supply
  `mapping` if there is no plot mapping.

- data:

  The data to be displayed in this layer. There are three options:

  If `NULL`, the default, the data is inherited from the plot data as
  specified in the call to
  [`ggplot()`](https://ggplot2.tidyverse.org/reference/ggplot.html).

  A `data.frame`, or other object, will override the plot data. All
  objects will be fortified to produce a data frame. See
  [`fortify()`](https://ggplot2.tidyverse.org/reference/fortify.html)
  for which variables will be created.

  A `function` will be called with a single argument, the plot data. The
  return value must be a `data.frame`, and will be used as the layer
  data. A `function` can be created from a `formula` (e.g.
  `~ head(.x, 10)`).

- stat:

  The statistical transformation to use on the data for this layer. When
  using a `geom_*()` function to construct a layer, the `stat` argument
  can be used to override the default coupling between geoms and stats.
  The `stat` argument accepts the following:

  - A `Stat` ggproto subclass, for example `StatCount`.

  - A string naming the stat. To give the stat as a string, strip the
    function name of the `stat_` prefix. For example, to use
    [`stat_count()`](https://ggplot2.tidyverse.org/reference/geom_bar.html),
    give the stat as `"count"`.

  - For more information and other ways to specify the stat, see the
    [layer
    stat](https://ggplot2.tidyverse.org/reference/layer_stats.html)
    documentation.

- position:

  A position adjustment to use on the data for this layer. This can be
  used in various ways, including to prevent overplotting and improving
  the display. The `position` argument accepts the following:

  - The result of calling a position function, such as
    [`position_jitter()`](https://ggplot2.tidyverse.org/reference/position_jitter.html).
    This method allows for passing extra arguments to the position.

  - A string naming the position adjustment. To give the position as a
    string, strip the function name of the `position_` prefix. For
    example, to use
    [`position_jitter()`](https://ggplot2.tidyverse.org/reference/position_jitter.html),
    give the position as `"jitter"`.

  - For more information and other ways to specify the position, see the
    [layer
    position](https://ggplot2.tidyverse.org/reference/layer_positions.html)
    documentation.

- ...:

  Other arguments passed on to
  [`layer()`](https://ggplot2.tidyverse.org/reference/layer.html). These
  are often aesthetics, used to set an aesthetic to a fixed value, like
  `colour = "green"` or `size = 3`. They may also be parameters to the
  paired geom/stat.

- cols:

  Name of at least two columns specifying the variables to be plotted in
  the glyphs as a character vector.

- width:

  The width of the bars.

- size:

  The size of glyphs.

- colour.bar:

  The colour of bars.

- colour.line:

  The colour of profile line(s).

- colour.grid:

  The colour of the grid lines.

- linewidth.line:

  The line width of the profile line(s)

- linewidth.bar:

  The line width of the bars.

- linewidth.grid:

  The line width of the grid lines.

- fill.bar:

  The fill colour of the bars.

- fill.gradient:

  The palette for gradient fill of the segments. See **Details** section
  of
  [`col_numeric()`](https://scales.r-lib.org/reference/col_numeric.html)
  function in the
  [`scales`](https://scales.r-lib.org/reference/scales-package.html)
  package for available options.

- flip.axes:

  logical. If `TRUE`, axes are flipped.

- bar:

  logical. If `TRUE`, profile bars are plotted.

- line:

  logical. If `TRUE`, profile line is plotted.

- mirror:

  logical. If `TRUE`, mirror profile is plotted.

- draw.grid:

  logical. If `TRUE`, grid levels are plotted along the profile bars if
  all the variables specified in `cols` are an ordered
  [factor](https://rdrr.io/r/base/factor.html). Default is `FALSE`.

- legend.glyph.dims:

  The dimensions of the legend glyph plot. Can be a numeric vector of
  unit length (where all the dimensions will have same value) or a
  numeric vector of same length as "cols" with the "cols" as names.

- show.legend:

  logical. Should this layer be included in the legends? `NA`, the
  default, includes if any aesthetics are mapped. `FALSE` never
  includes, and `TRUE` always includes. It can also be a named logical
  vector to finely select the aesthetics to display. To include legend
  keys for all levels, even when no data exists, use `TRUE`. If `NA`,
  all levels are shown in legend, but unobserved levels are omitted.

- repel:

  logical. If `TRUE`, the glyphs are repel away from each other to avoid
  overlaps. Default is `FALSE`.

- repel.control:

  A list of control settings for the repel algorithm. Ignored if
  `repel = FALSE`. See
  [`ggmultiglyph.repel.control`](https://aravind-j.github.io/ggmultiglyph/reference/ggmultiglyph.repel.control.md)
  for details on the various control parameters.

- inherit.aes:

  If `FALSE`, overrides the default aesthetics, rather than combining
  with them. This is most useful for helper functions that define both
  data and aesthetics and shouldn't inherit behaviour from the default
  plot specification, e.g.
  [`annotation_borders()`](https://ggplot2.tidyverse.org/reference/annotation_borders.html).

## Value

A `geom` layer.

## Aesthetics

[`geom_pieglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_pieglyph.md)
understands the following aesthetics (required aesthetics are in bold):

- **x**

- **y**

- alpha

- colour

- fill

- group

See
[`vignette("ggplot2-specs", package = "ggplot2")`](https://ggplot2.tidyverse.org/articles/ggplot2-specs.html)
for further details on setting these aesthetics.

The following additional aesthetics are considered if `repel = TRUE`:

- point.size

- segment.linetype

- segment.colour

- segment.size

- segment.alpha

- segment.curvature

- segment.angle

- segment.ncp

- segment.shape

- segment.square

- segment.squareShape

- segment.inflect

- segment.debug

See `ggrepel`
[examples](https://ggrepel.slowkow.com/articles/examples.html) page for
further details on setting these aesthetics.

## References

Chambers JM, Cleveland WS, Kleiner B, Tukey PA (1983). *Graphical
Methods for Data Analysis*. Chapman and Hall/CRC, Boca Raton. ISBN
978-1-351-07230-4.  
  
duToit SHC, Steyn AGW, Stumpf RH (1986). *Graphical Exploratory Data
Analysis*, Springer Texts in Statistics. Springer-Verlag, New York. ISBN
978-1-4612-9371-2.

## See also

[`profileglyphGrob`](https://aravind-j.github.io/ggmultiglyph/reference/profileglyphGrob.md)

Other geoms:
[`geom_dotglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_dotglyph.md),
[`geom_metroglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_metroglyph.md),
[`geom_pieglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_pieglyph.md),
[`geom_starglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_starglyph.md),
[`geom_tileglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_tileglyph.md)

## Examples

``` r


library(ggplot2)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prepare the data ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Variables to map to glyphs
zs <- c("hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")

# Keep a copy of the original data
mtcars_fct <- mtcars

# Scaled numeric data
mtcars[zs] <- lapply(mtcars[zs], scales::rescale)

mtcars$cyl <- factor(mtcars$cyl)
mtcars$lab <- row.names(mtcars)

# Ordered factor data
mtcars_fct[zs[1:3]] <-
  lapply(mtcars_fct[zs[1:3]], function(x)
    ordered(cut(x, breaks = 3,
                labels = c("low", "medium", "high"))))

mtcars_fct[zs[4:8]] <-
  lapply(mtcars_fct[zs[4:8]], function(x)
    ordered(cut(x, breaks = 4,
                labels = c("tiny", "small", "medium", "large"))))

mtcars_fct$cyl <- factor(mtcars_fct$cyl)
mtcars_fct$lab <- row.names(mtcars_fct)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bar, line, mirror and flip.axes combinations ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped fill + line ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped fill + bar ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped colour + bar and line ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped colour + line ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped colour + bar ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bars with multivariate fill + bar and line ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bars with multivariate fill + bar ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bars with gradient fill + bar and line ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.gradient = "Greens",
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.gradient = "Blues",
                    mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.gradient = "RdYlBu",
                    flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.gradient = "viridis",
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bars with gradient fill + bar ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.gradient = "Greens",
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.gradient = "Blues",
                    mirror = FALSE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.gradient = "RdYlBu",
                    flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    line = FALSE,
                    fill.gradient = "viridis",
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Faceted ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  0.8) +
  ylim(c(-0, 550)) +
  facet_grid(. ~ cyl)


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  0.8) +
  ylim(c(-0, 550)) +
  facet_grid(. ~ cyl)


ggplot(data = mtcars) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    alpha =  0.8) +
  ylim(c(-0, 550)) +
  facet_grid(. ~ cyl)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Repel glyphs ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    line = FALSE, mirror = FALSE,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    bar = FALSE, flip.axes = TRUE,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
                    cols = zs, size = 5, width = 1,
                    mirror = FALSE, flip.axes = TRUE,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp)) +
  geom_profileglyph(aes(x = mpg, y = disp),
                    cols = zs, size = 5, width = 1,
                    fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# With grid lines (when bar = TRUE) ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 3, width = 1,
                    alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, col = cyl),
                    cols = zs, size = 3, width = 1,
                    alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 3, width = 1,
                    fill.gradient = "Blues",
                    alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Legend options ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Default legend/guide
ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


# Theme modifications for legend
legend_theme <-
  theme_bw(base_size = 7.5) +
  theme(legend.direction = "vertical",
        legend.box = "horizontal",
        legend.position = "bottom",
        legend.text = element_text(margin = margin(l = 7)),
        legend.key.height = unit(1.5, 'lines'))

# Glyph variable-wise legends
ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  scale_z_continuous(z = zs) +
  guide_z_order(z = zs, default_aes = "fill") +
  legend_theme


# Modifying the `legend.glyph.dims`
zavg <- # Scaled average of the variables
  apply(mtcars[, zs], 2,
        function(x) {
          scales::rescale(mean(x),
                          from = range(x), # same range as in scale_z_continuous
                          to = c(0, 1))
        })
zavg
#>        hp      drat        wt      qsec        vs        am      gear      carb 
#> 0.3345848 0.3855127 0.4357581 0.3986607 0.4375000 0.4062500 0.3437500 0.2589286 

ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE,
                    legend.glyph.dims = zavg) +
  ylim(c(-0, 550)) +
  xlim(c(8, 35))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE,
                    legend.glyph.dims = zavg) +
  ylim(c(-0, 550)) +
  scale_z_continuous(z = zs) +
  guide_z_order(z = zs, default_aes = "fill")  +
  legend_theme


# Using custom guide
# profileglyphGrob
guide_profilegrob <- profileglyphGrob(
  z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33, 0.6, 0.25) * 0.75,
  size = 25)
# Add labels to profileglyphGrob
guide_profilegrob <-
  addlabel.glyphGrob(grob = guide_profilegrob, label = zs,
                     segment = TRUE,
                     angle = 45, push = 1, hjust = 1)

# Another version
guide_profilegrob2 <- profileglyphGrob(
  z = rep(0.5, length(zs)),
  size = 25)
guide_profilegrob2 <-
  addlabel.glyphGrob(grob = guide_profilegrob2, label = zs,
                     push = 1, segment = FALSE,
                     angle = 45, hjust = 1)

ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  guides(fill = guide_legend(order = 1, position = "right"),
         custom = guide_custom(guide_profilegrob,
                               width = unit(0.1, "npc"),
                               height = unit(0.1, "npc"),
                               position = "bottom",
                               theme = theme(legend.margin = margin(t = 20, b = 50))))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 5, width = 1,
                    alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  guides(fill = guide_legend(order = 1, position = "right"),
         custom = guide_custom(guide_profilegrob2,
                               width = unit(0.1, "npc"),
                               height = unit(0.1, "npc"),
                               position = "bottom",
                               theme = theme(legend.margin = margin(t = 7, b = 30))))


# Legend in plots with grid points

z_grid <- c(hp = 3, drat = 3, wt = 2,
            qsec = 2, vs = 3, am = 4,
            gear = 2, carb = 3)

ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 1, width = 1,
                    alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 1, width = 1,
                    alpha =  0.8, draw.grid = TRUE,
                    legend.glyph.dims = z_grid) +
  ylim(c(-0, 550))


ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 1, width = 1,
                    alpha =  0.8, draw.grid = TRUE,
                    legend.glyph.dims = z_grid) +
  ylim(c(-0, 550)) +
  scale_z_discrete(z = zs) +
  guide_z_order(z = zs, default_aes = "fill") +
  legend_theme


# profileglyphGrob with grid levels

z_grid_levels <- lapply(z_grid, function(x) 1:x)

guide_profilegrob_grid <-
  profileglyphGrob(z = z_grid,
                   size = 3, draw.grid = TRUE,
                   grid.levels = z_grid_levels)

guide_profilegrob_grid <-
  addlabel.glyphGrob(grob = guide_profilegrob_grid, label = zs,
                     push = 1, segment = TRUE,
                     angle = 45, hjust = 1)

# Another version
guide_profilegrob_grid2 <-
  profileglyphGrob(z = rep(3, length(z_grid)),
                   size = 3, draw.grid = TRUE,
                   grid.levels = replicate(8, 1:3,
                                           simplify = FALSE))
guide_profilegrob_grid2 <-
  addlabel.glyphGrob(grob = guide_profilegrob_grid2, label = zs,
                     push = 1, segment = FALSE,
                     angle = 45, hjust = 1)

ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 3, width = 1,
                    alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550)) +
  guides(fill = guide_legend(order = 1, position = "right"),
         custom = guide_custom(guide_profilegrob_grid,
                               width = unit(0.1, "npc"),
                               height = unit(0.1, "npc"),
                               position = "bottom",
                               theme = theme(legend.margin = margin(t = 5, b = 30))))


ggplot(data = mtcars_fct) +
  geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
                    cols = zs, size = 3, width = 1,
                    alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550)) +
  guides(fill = guide_legend(order = 1, position = "right"),
         custom = guide_custom(guide_profilegrob_grid2,
                               width = unit(0.1, "npc"),
                               height = unit(0.1, "npc"),
                               position = "bottom",
                               theme = theme(legend.margin = margin(t = 5, b = 30))))

```
