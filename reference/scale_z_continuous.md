# Alter scales for continuous data mapped to glyphs

Scale variable(s) mapped to the glyphs to the given range using
[`rescale_pal`](https://scales.r-lib.org/reference/pal_rescale.html).
Each variable in `z` gets its own independent continuous scale.

## Usage

``` r
scale_z_continuous(..., range = c(0.1, 1), z)
```

## Arguments

- ...:

  Additional arguments to be passed on to
  [`continuous_scale`](https://ggplot2.tidyverse.org/reference/continuous_scale.html).

- range:

  The range to which the variable(s) specified in argument `z` are to be
  scaled.

- z:

  The variable(s) mapped to the glyph as a character vector.

## Value

A
[`continuous_scale`](https://ggplot2.tidyverse.org/reference/continuous_scale.html)
object that can be added to a `ggplot` object. The returned scale
applies to all aesthetics named in `z` simultaneously (i.e. the
variables specified via `cols` in the corresponding `geom_*glyph()`
layer), rescaling their combined, pooled range to `range` for use in
determining glyph dimensions.
