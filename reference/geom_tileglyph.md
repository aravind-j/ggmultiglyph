# Add Tile Glyphs as a Scatterplot

The tileglyph geom is used to plot multivariate data as tile glyphs
similar to 'autoglyph' (Beddow 1990) or 'stripe glyph' (Fuchs et al.
2013) in a scatterplot.

## Usage

``` r
geom_tileglyph(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  cols = character(0L),
  colour = "black",
  ratio = 1,
  nrow = 1,
  linewidth = 1,
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

- colour:

  The colour of the tile glyphs.

- ratio:

  The aspect ratio (height / width).

- nrow:

  The number of rows.

- linewidth:

  The line width of the tile glyphs.

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

`geom_tileglyph()` understands the following aesthetics (required
aesthetics are in bold):

- **x**

- **y**

- alpha

- group

- size

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

Beddow J (1990). “Shape coding of multidimensional data on a
microcomputer display.” In *Proceedings of the First IEEE Conference on
Visualization: Visualization \`90*, 238–246. ISBN 978-0-8186-2083-6.  
  
Fuchs J, Fischer F, Mansmann F, Bertini E, Isenberg P (2013).
“Evaluation of alternative glyph designs for time series data in a small
multiple setting.” In *Proceedings of the SIGCHI Conference on Human
Factors in Computing Systems*, 3237–3246. ISBN 978-1-4503-1899-0.

## See also

[`tileglyphGrob`](https://aravind-j.github.io/ggmultiglyph/reference/tileglyphGrob.md)

Other geoms:
[`geom_dotglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_dotglyph.md),
[`geom_metroglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_metroglyph.md),
[`geom_pieglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_pieglyph.md),
[`geom_profileglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_profileglyph.md),
[`geom_starglyph()`](https://aravind-j.github.io/ggmultiglyph/reference/geom_starglyph.md)

## Examples

``` r

library(ggplot2)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prepare the data ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Variables to map to glyphs
zs <- c("hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")

# Scaled numeric data
mtcars[zs] <- lapply(mtcars[zs], scales::rescale)

mtcars$cyl <- factor(mtcars$cyl)
mtcars$lab <- row.names(mtcars)

# Theme modifications for legend
legend_theme <-
  theme_bw(base_size = 7.5) +
  theme(legend.direction = "vertical",
        legend.box = "horizontal",
        legend.position = "bottom",
        legend.text = element_text(margin = margin(l = 7)),
        legend.key.height = unit(1.5, 'lines'))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Palette and dimension combos ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ggplot(data = mtcars) +
  geom_tileglyph(aes(x = mpg, y = disp),
                 cols = zs, size = 2,
                 alpha =  0.5) +
  ylim(c(-0, 550)) +
  scale_z_fill_continuous(z = zs, palette = "Blues") +
  guide_z_order(z = zs, default_aes = "fill") +
  theme_bw(base_size = 7.5) +
  legend_theme


ggplot(data = mtcars) +
  geom_tileglyph(aes(x = mpg, y = disp),
                 cols = zs, size = 2,
                 nrow = 2,
                 alpha =  0.5) +
  ylim(c(-0, 550)) +
  scale_z_fill_continuous(z = zs, palette = "Greens") +
  guide_z_order(z = zs, default_aes = "fill") +
  theme_bw(base_size = 7.5) +
  legend_theme


ggplot(data = mtcars) +
  geom_tileglyph(aes(x = mpg, y = disp),
                 cols = zs, size = 1,
                 ratio = 4,
                 alpha =  0.5) +
  ylim(c(-0, 550)) +
  scale_z_fill_continuous(z = zs, palette = "RdYlBu") +
  guide_z_order(z = zs, default_aes = "fill") +
  theme_bw(base_size = 7.5) +
  legend_theme


ggplot(data = mtcars) +
  geom_tileglyph(aes(x = mpg, y = disp),
                 cols = zs, size = 1,
                 ratio = 4, nrow = 2,
                 alpha =  0.5) +
  ylim(c(-0, 550)) +
  scale_z_fill_continuous(z = zs, palette = "viridis") +
  guide_z_order(z = zs, default_aes = "fill") +
  theme_bw(base_size = 7.5) +
  legend_theme


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Repel glyphs ----
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp)) +
  geom_tileglyph(aes(x = mpg, y = disp),
                 cols = zs, size = 2,
                 alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  scale_z_fill_continuous(z = zs, palette = "Blues") +
  guide_z_order(z = zs, default_aes = "fill") +
  theme_bw(base_size = 7.5) +
  legend_theme


ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp)) +
  geom_tileglyph(aes(x = mpg, y = disp),
                 cols = zs, size = 1,
                 ratio = 4, nrow = 2,
                 alpha =  1, repel = TRUE) +
  ylim(c(-0, 550)) +
  scale_z_fill_continuous(z = zs, palette = "viridis") +
  guide_z_order(z = zs, default_aes = "fill") +
  theme_bw(base_size = 7.5) +
  legend_theme

```
