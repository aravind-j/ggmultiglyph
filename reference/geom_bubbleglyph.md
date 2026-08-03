# Add Bubble Glyphs as a Scatterplot

The bubbleglyph geom is used to plot multivariate data as bubble glyphs
in a scatterplot. Each variable specified in `cols` is depicted as a
circle, with the radius (or area) scaled according to the corresponding
value.

## Usage

``` r
geom_bubbleglyph(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  cols = character(0L),
  scale.radius = TRUE,
  scale.area = FALSE,
  bubble.layout = c("annulus", "circle", "line", "chain", "hub", "pack"),
  connector = c("none", "foreground", "background"),
  fill.bubble = NULL,
  fill.gradient = NULL,
  colour.bubble = NULL,
  colour.grid = NULL,
  linewidth = 1,
  linewidth.grid = linewidth,
  linejoin = c("mitre", "round", "bevel"),
  angle.start = 0,
  angle.stop = 2 * base::pi,
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

  A character vector containing the names of at least two columns
  specifying the variables to be plotted in the glyphs. The selected
  columns must be either numeric or factor variables.

- scale.radius:

  logical. If `TRUE`, the values in `z` are used directly as the bubble
  radii.

- scale.area:

  logical. If `TRUE`, values in `z` are treated as bubble areas, and
  radii are derived as \\\sqrt{z}\\, so that bubble area (rather than
  radius) is proportional to `z`.

- bubble.layout:

  The layout algorithm used to position the bubbles. One of `"circle"`,
  `"line"`, `"chain"`, `"hub"`, `"pack"` or `"annulus"` (See **Layouts**
  for more details).

- connector:

  The style used to connect bubbles to one another. One of `"none"` (no
  connectors are drawn), `"foreground"` (connectors are drawn on top of
  the bubbles) or `"background"` (connectors are drawn underneath the
  bubbles).

- fill.bubble:

  The fill colour of the bubbles.

- fill.gradient:

  The palette for gradient fill of the segments. See **Details** section
  of
  [`col_numeric()`](https://scales.r-lib.org/reference/col_numeric.html)
  function in the
  [`scales`](https://scales.r-lib.org/reference/scales-package.html)
  package for available options.

- colour.bubble:

  The colour of bubbles.

- colour.grid:

  The colour of grid lines.

- linewidth:

  The line width of the circles.

- linewidth.grid:

  The line width of the grid circles.

- linejoin:

  The line join style for the tile polygon. Either `"mitre"`, `"round"`
  or `"bevel"`.

- angle.start:

  The start angle for the bubbles in radians for `layout = "circle"` and
  `layout = "hub"`. Default is zero.

- angle.stop:

  The stop angle for the bubbles in radians for `layout = "circle"` and
  `layout = "hub"`. Default is \\2\pi\\.

- draw.grid:

  logical. If `TRUE`, grid levels are plotted as nested circles within
  each bubble. Default is `FALSE`.

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

`geom_bubbleglyph()` understands the following aesthetics (required
aesthetics are in bold):

- **x**

- **y**

- alpha

- colour

- fill

- group

- size

- centre.size

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

## Layouts

The following layouts are available.

- `"circle"`:

  Bubbles are arranged around the circumference of an invisible circle,
  evenly spaced by angle between `angle.start` and `angle.stop`. The
  radius of this invisible circle is derived from the bubble radii (the
  largest bubble radius plus the mean bubble radius, with a small buffer
  added) so that bubbles do not overlap regardless of their individual
  sizes. This is the default layout.

- `"line"`:

  Bubbles are arranged side by side along a straight line passing
  through the glyph centre, each bubble touching its neighbours. The
  line may be rotated to any orientation using the `line.angle` argument
  (in radians).

- `"chain"`:

  Bubbles are linked together in a meandering tangent chain. Each new
  bubble is placed tangent to its immediate predecessor, alternating
  between opposite sides of the chain to produce a distinctive zig-zag
  arrangement. Where necessary, the placement is adjusted to minimise
  overlap with previously placed bubbles while preserving the ordering
  of the data.

- `"hub"`:

  One bubble (the one with the largest radius) is treated as a central
  "hub", and all other bubbles are placed around it, each touching the
  hub bubble, at angles spaced between `angle.start` and `angle.stop`.
  This is a quick, deterministic layout: because the surrounding bubbles
  are not tested against one another for overlap, bubbles can overlap
  when several of them are large relative to the hub.

- `"pack"`:

  Bubbles are arranged using a circle-packing algorithm
  ([`circleProgressiveLayout`](https://rdrr.io/pkg/packcircles/man/circleProgressiveLayout.html)),
  which places bubbles as close together as possible without any overlap
  (Collins and Stephenson 2003; Wang et al. 2006; Bedward et al. 2024) .
  This produces the most compact, space-efficient arrangement of the
  available layouts, at the cost of the arrangement having no inherent
  order or direction (bubbles are not ordered along an axis or around a
  hub).

- `"annulus"`:

  Bubbles are arranged, in the order supplied, around the circumference
  of a ring (annulus), with each bubble touching its immediate
  neighbours on either side (the last bubble touching the first, closing
  the ring). The radius of the ring is solved numerically so that all
  adjacent bubbles are mutually tangent.

## References

Bedward M, Eppstein D, Menzel P (2024). “packcircles: Circle Packing. R
package version 0.3.7.”  
  
Collins CR, Stephenson K (2003). “A circle packing algorithm.”
*Computational Geometry*, **25**(3), 233–256.  
  
Wang W, Wang H, Dai G, Wang H (2006). “Visualization of large
hierarchical data by circle packing.” In *Proceedings of the SIGCHI
Conference on Human Factors in Computing Systems*, 517–520. ISBN
978-1-59593-372-0.

## See also

[`bubbleglyphGrob`](https://aravind-j.github.io/ggmultiglyph/reference/bubbleglyphGrob.md)

Other geoms:
[`geom_dotglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_dotglyph.md),
[`geom_flowerglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_flowerglyph.md),
[`geom_metroglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_metroglyph.md),
[`geom_pieglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_pieglyph.md),
[`geom_profileglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_profileglyph.md),
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
# Mapped fill + scaled radius ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped fill + scaled area ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   scale.radius = FALSE, scale.area = TRUE,
                   alpha =  0.8) +
  ylim(c(-0, 550))


# \donttest{
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped colour + scaled radius ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
                   cols = zs, size = 1.5, fill = "white",
                   alpha =  0.8, linewidth = 2) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mapped colour + scaled area ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
                   cols = zs, size = 1.5, fill = "white",
                   scale.radius = FALSE, scale.area = TRUE,
                   alpha =  0.8, linewidth = 2) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bubble layout variations ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Annulus
ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   alpha =  0.8) +
  ylim(c(-0, 550))


# Circle
ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   layout = "circle",
                   alpha =  0.8) +
  ylim(c(-0, 550))


# Line
ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   layout = "line",
                   alpha =  0.8) +
  ylim(c(-0, 550))


# Chain
ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   layout = "chain",
                   alpha =  0.8) +
  ylim(c(-0, 550))


# Hub
ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   layout = "hub",
                   alpha =  0.8) +
  ylim(c(-0, 550))


# Pack
ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   layout = "pack",
                   alpha =  0.8) +
  ylim(c(-0, 550))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Bubbles with multivariate colours ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp),
                   cols = zs, size = 1.5,
                   fill.bubble = RColorBrewer::brewer.pal(8, "Dark2"),
                   alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Gradient fill ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp),
                   cols = zs, size = 1.5,
                   fill.gradient = "viridis",
                   alpha =  0.8) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Faceted ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   alpha =  0.8) +
  ylim(c(-0, 550)) +
  facet_grid(. ~ cyl)


ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
                   cols = zs, size = 1.5,
                   alpha =  0.8) +
  ylim(c(-0, 550)) +
  facet_grid(. ~ cyl)


ggplot(data = mtcars) +
  geom_bubbleglyph(aes(x = mpg, y = disp),
                   cols = zs, size = 1.5,
                   fill.bubble = RColorBrewer::brewer.pal(8, "Dark2"),
                   alpha =  0.8) +
  ylim(c(-0, 550)) +
  facet_grid(. ~ cyl)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Repel glyphs ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1.5,
                   alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl)) +
  geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
                   cols = zs, size = 1.5,
                   alpha =  1, repel = TRUE) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Grid lines (ordered factor variables) ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ggplot(data = mtcars_fct) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 0.5,
                   alpha =  0.8, draw.grid = TRUE) +
  ylim(c(-0, 550))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Legend options ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Theme modifications for legend
legend_theme <-
  theme_bw(base_size = 7.5) +
  theme(legend.direction = "vertical",
        legend.box = "horizontal",
        legend.position = "bottom",
        legend.text = element_text(margin = margin(l = 7)),
        legend.key.height = unit(1, 'lines'))

# Glyph variable-wise legends
ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1,
                   alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  scale_z_continuous(z = zs) +
  guide_z_order(z = zs, default_aes = "fill") +
  legend_theme


# Using custom guide
# bubbleglyphGrob
guide_bubblegrob <- bubbleglyphGrob(
  z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33, 0.6, 0.25),
  layout = "annulus",
  size = 5)
# guide_bubblegrob <-
#   addlabel.glyphGrob(grob = guide_bubblegrob, label = zs,
#                      push = 1, segment = FALSE)

ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
  geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
                   cols = zs, size = 1,
                   alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  guides(fill = guide_legend(order = 1, position = "right"),
         custom = guide_custom(guide_bubblegrob,
                               width = unit(0.1, "npc"),
                               height = unit(0.1, "npc"),
                               position = "bottom",
                               theme = theme(legend.margin = margin(t = 40, b = 30))))

# }
```
