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
