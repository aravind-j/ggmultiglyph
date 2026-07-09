# Add Labels to a `glyphGrob`

Add labels to a `glyphGrob` as a
[`textGrob`](https://rdrr.io/r/grid/grid.text.html). Useful in creation
of custom guides for glyphs using
[`guide_custom`](https://ggplot2.tidyverse.org/reference/guide_custom.html).

## Usage

``` r
addlabel.glyphGrob(
  grob,
  label,
  segment = TRUE,
  segment.control = ggmultiglyph.segment.control(),
  push = 10,
  angle = 0,
  hjust = 0.5,
  vjust = 0.5
)
```

## Arguments

- grob:

  A `glyphGrob` object.

- label:

  The labels to be plotted as a character vector. Should be equal in
  length to the dimensions of `grob` `glyphGrob` object. Labels are
  plotted from \\0\\ to \\1\\ (left to right or bottom to top for linear
  labelling and right to left in clock-wise direction for radial
  labelling.)

- segment:

  logical. If `TRUE` draws line segments connecting labels and the
  `glyphGrob` Default is `TRUE`.

- segment.control:

  A list of control settings for the line segments. Ignored if
  `segment = FALSE`. See
  [`ggmultiglyph.segment.control`](https://aravind-j.github.io/ggmultiglyph/reference/ggmultiglyph.segment.control.md)
  for details on the various control parameters.

- push:

  A numeric value indicating how far the labels have to be pushed out
  from the `glyphGrob`.

- angle:

  Text angle (in `[0, 360]`).

- hjust:

  Horizontal justification (in `[0, 1]`).

- vjust:

  Vertical justification (in `[0, 1]`).

## Value

A [`grob`](https://rdrr.io/r/grid/grid.grob.html) object.

## Examples

``` r
library(ggmultiglyph)
library(grid)
library(gridExtra)

label <- c("hp", "drat", "wt", "qsec", "vs", "am")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add labels to metroglyphGrob
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mglyph1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                          z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                          size = 20, circle.size = 2)

mglyph2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                          z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                          size = 20, circle.size = 5,
                          angle.start = base::pi, angle.stop = -base::pi,
                          lwd.ray = 5, lwd.circle = 15,
                          col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
                          col.circle = "white", fill = "gray")

mglyph3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                          z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                          size = 20, circle.size = 0,
                          angle.start = 0, angle.stop = base::pi)

mglyph1_lab <- addlabel.glyphGrob(grob = mglyph1, label = label,
                                  push = 1, segment = FALSE)
mglyph2_lab <- addlabel.glyphGrob(grob = mglyph2, label = label,
                                  push = 3)
mglyph3_lab <- addlabel.glyphGrob(grob = mglyph3, label = label,
                                  push = 1, segment = FALSE)

grid.arrange(mglyph1, mglyph1_lab)

grid.arrange(mglyph2, mglyph2_lab)

grid.arrange(mglyph3, mglyph3_lab, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add labels to starglyphGrob
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 25)

sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 25,
                     lwd.whisker = 3,
                     lwd.contour = 0.1,
                     col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
                     col.contour = "gray")

sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 25,
                     lwd.whisker = 3,
                     lwd.contour = 0.1,
                     angle.start = 0, angle.stop = base::pi,
                     fill = "cyan")

sg1_lab <- addlabel.glyphGrob(grob = sg1, label = label,
                                  push = 1, segment = FALSE)
sg2_lab <- addlabel.glyphGrob(grob = sg2, label = label,
                                  push = 3)
sg3_lab <- addlabel.glyphGrob(grob = sg3, label = label,
                                  push = 1, segment = FALSE)

grid.arrange(sg1, sg1_lab)

grid.arrange(sg2, sg2_lab)

grid.arrange(sg3, sg3_lab, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add labels to pieglyphGrob
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20)

pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, scale.radius = FALSE,
                   angle.start = 0, angle.stop = base::pi)

pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                   size = 20, scale.segment = TRUE, scale.radius = FALSE,
                   fill = RColorBrewer::brewer.pal(6, "Dark2"))

pg1_lab <- addlabel.glyphGrob(grob = pg1, label = label,
                             push = 2, segment = FALSE)
pg2_lab <- addlabel.glyphGrob(grob = pg2, label = label,
                             push = 5)
pg3_lab <- addlabel.glyphGrob(grob = pg3, label = label,
                             push = 5, segment = FALSE)

grid.arrange(pg1, pg1_lab)

grid.arrange(pg2, pg2_lab)

grid.arrange(pg3, pg3_lab)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add labels to profileglyphGrob
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20)

bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = FALSE,
                        col.bar = "cyan")

bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = TRUE, bar = FALSE,
                        fill = "green")

bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
                              angle = 45, push = 1, hjust = 1)
bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
                              angle = 45, push = 5, hjust = 1)
bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
                              angle = 45, push = -35, hjust = 0)

grid.arrange(bg1, bg1_lab, nrow = 1)

grid.arrange(bg2, bg2_lab, nrow = 1)

grid.arrange(bg3, bg3_lab, nrow = 1)


bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20,
                        mirror = FALSE)

bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = FALSE, mirror = FALSE,
                        col.bar = "cyan")

bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = TRUE, bar = FALSE,
                        mirror = FALSE, fill = "green")

bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
                              angle = 45, push = 1, hjust = 1)
bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
                              angle = 45, push = 5, hjust = 1)
bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
                              angle = 45, push = -25, hjust = 0)

grid.arrange(bg1, bg1_lab, nrow = 1)

grid.arrange(bg2, bg2_lab, nrow = 1)

grid.arrange(bg3, bg3_lab, nrow = 1)


bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, flip.axes = TRUE,
                        fill = "salmon")

bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = FALSE,
                        flip.axes = TRUE,
                        col.bar = "cyan")

bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = TRUE, bar = FALSE,
                        flip.axes = TRUE)

bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
                              angle = 45, push = 15, hjust = 1)
bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
                              push = 20, hjust = 1)
bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
                              angle = 45, push = -30, hjust = 0)

grid.arrange(bg1, bg1_lab, nrow = 1)

grid.arrange(bg2, bg2_lab, nrow = 1)

grid.arrange(bg3, bg3_lab, nrow = 1)


bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, flip.axes = TRUE,
                        fill = "salmon", mirror = FALSE)

bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = FALSE, mirror = FALSE,
                        flip.axes = TRUE,
                        col.bar = "cyan")

bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                        z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
                        size = 20, line = TRUE, bar = FALSE,
                        flip.axes = TRUE,
                        mirror = FALSE)

bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
                              angle = 45, push = 5, hjust = 1)
bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
                              push = 5, hjust = 1)
bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
                              angle = 45, push = -25, hjust = 0)

grid.arrange(bg1, bg1_lab, nrow = 1)

grid.arrange(bg2, bg2_lab, nrow = 1)

grid.arrange(bg3, bg3_lab, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add labels to dotglyphGrob
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

clrs <- mapply(function(a, b) rep(a, b),
               RColorBrewer::brewer.pal(6, "Dark2"),
               round(c(4, 3.5, 2.7, 6.8, 3.4, 5.7)))
clrs <- unlist(clrs)

dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2)

dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    fill = "salmon", col = "black")

dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, flip.axes = TRUE,
                    fill = "black", col = clrs, lwd = 5)

dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                    z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
                    radius = 2, mirror = TRUE,
                    flip.axes = TRUE,
                    fill = "green", col = "grey")

dg1_lab <- addlabel.glyphGrob(grob = dg1, label = label, segment = FALSE,
                              push = 3, hjust = 1, angle = 45)
dg2_lab <- addlabel.glyphGrob(grob = dg2, label = label, segment = TRUE,
                              angle = 45, push = 20, hjust = 1)
dg3_lab <- addlabel.glyphGrob(grob = dg3, label = label, segment = FALSE,
                              push = 3, hjust = 1)
dg4_lab <- addlabel.glyphGrob(grob = dg4, label = label, segment = TRUE,
                              push = 20,  hjust = 1)

grid.arrange(dg1, dg1_lab, nrow = 1)

grid.arrange(dg2, dg2_lab, nrow = 1)

grid.arrange(dg3, dg3_lab, nrow = 1)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Add labels to tileglyphGrob
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

label = c("hp", "drat", "wt", "qsec", "vs", "am", "gear")

tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5,
                     fill = RColorBrewer::brewer.pal(7, "Dark2"))

tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 7,
                     fill = RColorBrewer::brewer.pal(7, "Dark2"))

tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 2,
                     fill = RColorBrewer::brewer.pal(7, "Dark2"))

tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
                     size = 5, nrow = 3,
                     fill = RColorBrewer::brewer.pal(7, "Dark2"))

tg1_lab <- addlabel.glyphGrob(grob = tg1, label = label, segment = FALSE,
                              angle = 45, push = -10, hjust = 1, vjust = 0.5)
tg2_lab <- addlabel.glyphGrob(grob = tg2, label = label, segment = FALSE,
                              push = -1, hjust = 0, vjust = 0.5)
tg3_lab <- addlabel.glyphGrob(grob = tg3, label = label)
tg4_lab <- addlabel.glyphGrob(grob = tg4, label = label, segment = TRUE,
                              push = 5, hjust = 0, vjust = 0.25)

grid.arrange(tg1, tg2, tg3, tg4,
             tg1_lab, tg2_lab, tg3_lab, tg4_lab,
             nrow = 2, ncol = 4)

```
