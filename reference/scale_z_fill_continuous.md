# Alter scales for continuous data mapped to glyphs fill colour

Scale variable(s) mapped to the glyph fill colours.

## Usage

``` r
scale_z_fill_continuous(..., palette, z, guide = c("legend"))
```

## Arguments

- ...:

  Additional arguments to be passed on to
  [`continuous_scale`](https://ggplot2.tidyverse.org/reference/continuous_scale.html).

- palette:

  One of the following:

  - `NULL` for the default palette stored in the theme.

  - a character vector of colours.

  - a single string naming a palette.

  - a palette function that when called with a numeric vector with
    values between 0 and 1 returns the corresponding output values.

- z:

  The variable(s) mapped to the glyph as a character vector.

- guide:

  A function used to create a guide or its name. See
  [`guides`](https://ggplot2.tidyverse.org/reference/guides.html)for
  more information.
