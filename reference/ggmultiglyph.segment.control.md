# Control Parameters for Drawing Curved Connecting Segments

Set the contol parameters for drawing xurved segments connecting grobs
to labels in
[`addlabel.glyphGrob`](https://aravind-j.github.io/ggmultiglyph/reference/addlabel.glyphGrob.md).

## Usage

``` r
ggmultiglyph.segment.control(
  segment.curvature = 0,
  segment.angle = 90,
  segment.ncp = 1,
  segment.shape = 0.5,
  segment.square = TRUE,
  segment.squareShape = 1,
  segment.inflect = FALSE,
  segment.debug = FALSE,
  segment.colour = "black",
  segment.size = 0.2,
  segment.linetype = 1,
  segment.arrow = NULL
)
```

## Arguments

- segment.curvature:

  Numeric, negative for left-hand and positive for right-hand curves, 0
  for straight lines. Defaults to 0.

- segment.angle:

  0-180, less than 90 skews control points toward the start point.
  Defaults to 90.

- segment.ncp:

  Number of control points to make a smoother curve. Defaults to 1.

- segment.shape:

  Curve shape by control points approximation/interpolation (1 for cubic
  B-spline, -1 for Catmull-Rom spline). Defaults to 0.5.

- segment.square:

  `TRUE` to place control points in city-block fashion, `FALSE` for
  oblique placement. Default is `TRUE`.

- segment.squareShape:

  Shape of the curve relative to additional control points inserted if
  square is `TRUE`. Defaults to 1.

- segment.inflect:

  Curve inflection at the midpoint. Default is `FALSE`.

- segment.debug:

  Display the curve debug information. Default is `FALSE`.

- segment.colour:

  The line segment color. Default is `"black"`.

- segment.size:

  The line segment thickness. Default is 0.5 mm.

- segment.linetype:

  The line segment solid, dashed, etc. Default is 1 (solid).

- segment.arrow:

  Render line segment as an arrow with
  [`grid::arrow()`](https://rdrr.io/r/grid/arrow.html).

## Value

A list with the following components to control the repel algorithm
corresponding to the same in **Arguments**.

- segment.curvature:
- segment.angle:
- segment.ncp:
- segment.shape:
- segment.square:
- segment.squareShape:
- segment.inflect:
- segment.debug:
- segment.colour:
- segment.size:
- segment.linetype:
- segment.arrow:

## See also

[`addlabel.glyphGrob`](https://aravind-j.github.io/ggmultiglyph/reference/addlabel.glyphGrob.md)
