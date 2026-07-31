# Alter scales for discrete data mapped to glyphs

Scale variable(s) mapped to the glyphs as discrete/ordered factors. Each
variable in `z` gets its own independent discrete scale.

## Usage

``` r
scale_z_discrete(..., z, na.translate = TRUE, na.value = NA, guide = "legend")
```

## Arguments

- ...:

  Additional arguments to be passed on to
  [`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html).

- z:

  The variable(s) mapped to the glyph as a character vector or single
  variable name.

- na.translate:

  Logical. If TRUE (default), missing values are translated to "NA".

- na.value:

  The aesthetic value to use for missing values.

- guide:

  A function used to create a guide or its name. See
  [`guides`](https://ggplot2.tidyverse.org/reference/guides.html)for
  more information.

## Value

If `z` is of length one, a single
[`discrete_scale`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
object built on `ScaleDiscreteZIdentity`. If `z` has length greater than
one, a `list` of such `discrete_scale` objects, one per variable named
in `z`, which can be added to a `ggplot` object (via `+`) to attach
independent identity scales to each variable. Each scale passes the
ordinal rank of the ordered factor levels through unchanged (rather than
mapping them to a palette), so that `draw.grid = TRUE` in the
corresponding `geom_*glyph()` layer can use the values directly for
grid-level placement, while still providing a legend showing the factor
levels for each variable.
