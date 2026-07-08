# Control Parameters for the Repel Algorithm

Set the contol parameters for the repel algorithm (Slowikowski 2021)
used in various geoms (`geom_*()`) implemented in `ggmultiglyph` to
repel the glyphs from each other.

## Usage

``` r
ggmultiglyph.repel.control(
  box.padding = 0.25,
  point.padding = 0.000001,
  min.segment.length = 0.5,
  arrow = NULL,
  force = 1,
  force_pull = 1,
  max.time = 0.5,
  max.iter = 10000,
  max.overlaps = getOption("ggrepel.max.overlaps", default = 10),
  nudge_x = 0,
  nudge_y = 0,
  xlim = c(NA, NA),
  ylim = c(NA, NA),
  direction = c("both", "y", "x"),
  seed = NA,
  verbose = FALSE,
  ...
)
```

## Arguments

- box.padding:

  Amount of padding around bounding box, as unit or number. Defaults to
  0.25. (Default unit is lines, but other units can be specified by
  passing `unit(x, "units")`).

- point.padding:

  Amount of padding around labeled point, as unit or number. Defaults
  to 0. (Default unit is lines, but other units can be specified by
  passing `unit(x, "units")`).

- min.segment.length:

  Skip drawing segments shorter than this, as unit or number. Defaults
  to 0.5. (Default unit is lines, but other units can be specified by
  passing `unit(x, "units")`).

- arrow:

  specification for arrow heads, as created by
  [`arrow`](https://rdrr.io/r/grid/arrow.html).

- force:

  Force of repulsion between overlapping glyphs. Defaults to 1.

- force_pull:

  Force of attraction between a glyph and its corresponding data point.
  Defaults to 1.

- max.time:

  Maximum number of seconds to try to resolve overlaps. Defaults to 0.5.

- max.iter:

  Maximum number of iterations to try to resolve overlaps. Defaults to
  10000.

- max.overlaps:

  Exclude glyphs that overlap too many things. Defaults to 10.

- nudge_x, nudge_y:

  Horizontal and vertical adjustments to nudge the starting position of
  each glyph. The units for `nudge_x` and `nudge_y` are the same as for
  the data units on the x-axis and y-axis.

- xlim, ylim:

  Limits for the x and y axes. Glyphs will be constrained to these
  limits. By default, glyphs are constrained to the entire plot area.

- direction:

  "both", "x", or "y" – direction in which to adjust position of glyphs.

- seed:

  Random seed passed to
  [`set.seed`](https://rdrr.io/r/base/Random.html). Defaults to `NA`,
  which means that `set.seed` will not be called.

- verbose:

  If `TRUE`, some diagnostics of the repel algorithm are printed.

- ...:

  other repel arguments such as segment controls.

## Value

A list with the following components to control the repel algorithm
corresponding to the same in **Arguments**.

- box.padding:
- point.padding:
- min.segment.length:
- arrow:
- force:
- force_pull:
- max.time:
- max.iter:
- max.overlaps:
- nudge_x, nudge_y:
- xlim, ylim:
- direction:
- seed:
- verbose:

## References

Slowikowski K (2021). “ggrepel: Automatically position non-overlapping
text labels with 'ggplot2'. R package version 0.9.1.”

## See also

[`ggrepel`](https://ggrepel.slowkow.com/reference/ggrepel.html)

## Examples

``` r

# Adjust force
ggmultiglyph.repel.control(force = 0.5)
#> $box.padding
#> [1] 0.25
#> 
#> $point.padding
#> [1] 1e-06
#> 
#> $min.segment.length
#> [1] 0.5
#> 
#> $arrow
#> NULL
#> 
#> $force
#> [1] 0.5
#> 
#> $force_pull
#> [1] 1
#> 
#> $max.time
#> [1] 0.5
#> 
#> $max.iter
#> [1] 10000
#> 
#> $max.overlaps
#> [1] 10
#> 
#> $nudge_x
#> [1] 0
#> 
#> $nudge_y
#> [1] 0
#> 
#> $xlim
#> [1] NA NA
#> 
#> $ylim
#> [1] NA NA
#> 
#> $direction
#> [1] "both"
#> 
#> $seed
#> [1] NA
#> 
#> $verbose
#> [1] FALSE
#> 

# Adjust max.iter
ggmultiglyph.repel.control(max.iter = 5000)
#> $box.padding
#> [1] 0.25
#> 
#> $point.padding
#> [1] 1e-06
#> 
#> $min.segment.length
#> [1] 0.5
#> 
#> $arrow
#> NULL
#> 
#> $force
#> [1] 1
#> 
#> $force_pull
#> [1] 1
#> 
#> $max.time
#> [1] 0.5
#> 
#> $max.iter
#> [1] 5000
#> 
#> $max.overlaps
#> [1] 10
#> 
#> $nudge_x
#> [1] 0
#> 
#> $nudge_y
#> [1] 0
#> 
#> $xlim
#> [1] NA NA
#> 
#> $ylim
#> [1] NA NA
#> 
#> $direction
#> [1] "both"
#> 
#> $seed
#> [1] NA
#> 
#> $verbose
#> [1] FALSE
#> 

```
