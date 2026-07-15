#' Add Labels to a \code{glyphGrob}
#'
#' Add labels to a \code{glyphGrob} as a \code{\link[grid]{textGrob}}. Useful in
#' creation of custom guides for glyphs using
#' \code{\link[ggplot2]{guide_custom}}.
#'
#' @param grob A \code{glyphGrob} object.
#' @param label The labels to be plotted as a character vector. Should be equal
#'   in length to the dimensions of \code{grob} \code{glyphGrob} object. Labels
#'   are plotted from \eqn{0} to \eqn{1} (left to right or bottom to top for
#'   linear labelling and right to left in clock-wise direction for radial
#'   labelling.)
#' @param segment logical. If \code{TRUE} draws line segments connecting labels
#'   and the \code{glyphGrob} Default is \code{TRUE}.
#' @param segment.control A list of control settings for the line segments.
#'   Ignored if \code{segment = FALSE}. See
#'   \code{\link[ggmultiglyph]{ggmultiglyph.segment.control}} for details on
#'   the various control parameters.
#' @param push A numeric value indicating how far the labels have to be pushed
#'   out from the \code{glyphGrob}.
#' @param angle Text angle (in \ifelse{html}{\out{<code class="reqn">[0,
#'   360]</code>}}{\eqn{[0, 360]}}).
#' @param hjust Horizontal justification (in \ifelse{html}{\out{<code
#'   class="reqn">[0, 1]</code>}}{\eqn{[0, 1]}}).
#' @param vjust Vertical justification (in \ifelse{html}{\out{<code
#'   class="reqn">[0, 1]</code>}}{\eqn{[0, 1]}}).
#'
#' @return A \code{\link[grid]{grob}} object.
#'
#' @importFrom grid convertUnit convertX convertY curveGrob gList gTree
#' @importFrom grid textGrob unit unitType unit.c
#' @importFrom methods is
#' @importFrom utils tail
#' @export
#'
#' @examples
#' library(ggmultiglyph)
#' library(grid)
#' library(gridExtra)
#'
#' label <- c("hp", "drat", "wt", "qsec", "vs", "am")
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add labels to metroglyphGrob
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mglyph1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                           z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                           size = 20, circle.size = 2)
#'
#' mglyph2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                           z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                           size = 20, circle.size = 5,
#'                           angle.start = base::pi, angle.stop = -base::pi,
#'                           lwd.ray = 5, lwd.circle = 15,
#'                           col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                           col.circle = "white", fill = "gray")
#'
#' mglyph3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                           z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                           size = 20, circle.size = 0,
#'                           angle.start = 0, angle.stop = base::pi)
#'
#' mglyph1_lab <- addlabel.glyphGrob(grob = mglyph1, label = label,
#'                                   push = 1, segment = FALSE)
#' mglyph2_lab <- addlabel.glyphGrob(grob = mglyph2, label = label,
#'                                   push = 3)
#' mglyph3_lab <- addlabel.glyphGrob(grob = mglyph3, label = label,
#'                                   push = 1, segment = FALSE)
#'
#' grid.arrange(mglyph1, mglyph1_lab)
#' grid.arrange(mglyph2, mglyph2_lab)
#' grid.arrange(mglyph3, mglyph3_lab, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add labels to starglyphGrob
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 25)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 25,
#'                      lwd.whisker = 3,
#'                      lwd.contour = 0.1,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 25,
#'                      lwd.whisker = 3,
#'                      lwd.contour = 0.1,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      fill = "cyan")
#'
#' sg1_lab <- addlabel.glyphGrob(grob = sg1, label = label,
#'                                   push = 1, segment = FALSE)
#' sg2_lab <- addlabel.glyphGrob(grob = sg2, label = label,
#'                                   push = 3)
#' sg3_lab <- addlabel.glyphGrob(grob = sg3, label = label,
#'                                   push = 1, segment = FALSE)
#'
#' grid.arrange(sg1, sg1_lab)
#' grid.arrange(sg2, sg2_lab)
#' grid.arrange(sg3, sg3_lab, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add labels to pieglyphGrob
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, scale.radius = FALSE,
#'                    angle.start = 0, angle.stop = base::pi)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, scale.segment = TRUE, scale.radius = FALSE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg1_lab <- addlabel.glyphGrob(grob = pg1, label = label,
#'                              push = 2, segment = FALSE)
#' pg2_lab <- addlabel.glyphGrob(grob = pg2, label = label,
#'                              push = 5)
#' pg3_lab <- addlabel.glyphGrob(grob = pg3, label = label,
#'                              push = 5, segment = FALSE)
#'
#' grid.arrange(pg1, pg1_lab)
#' grid.arrange(pg2, pg2_lab)
#' grid.arrange(pg3, pg3_lab)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add labels to profileglyphGrob
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20)
#'
#' bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = FALSE,
#'                         col.bar = "cyan")
#'
#' bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = TRUE, bar = FALSE,
#'                         fill = "green")
#'
#' bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
#'                               angle = 45, push = 1, hjust = 1)
#' bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
#'                               angle = 45, push = 5, hjust = 1)
#' bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
#'                               angle = 45, push = -35, hjust = 0)
#'
#' grid.arrange(bg1, bg1_lab, nrow = 1)
#' grid.arrange(bg2, bg2_lab, nrow = 1)
#' grid.arrange(bg3, bg3_lab, nrow = 1)
#'
#' bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20,
#'                         mirror = FALSE)
#'
#' bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = FALSE, mirror = FALSE,
#'                         col.bar = "cyan")
#'
#' bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = TRUE, bar = FALSE,
#'                         mirror = FALSE, fill = "green")
#'
#' bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
#'                               angle = 45, push = 1, hjust = 1)
#' bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
#'                               angle = 45, push = 5, hjust = 1)
#' bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
#'                               angle = 45, push = -25, hjust = 0)
#'
#' grid.arrange(bg1, bg1_lab, nrow = 1)
#' grid.arrange(bg2, bg2_lab, nrow = 1)
#' grid.arrange(bg3, bg3_lab, nrow = 1)
#'
#' bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, flip.axes = TRUE,
#'                         fill = "salmon")
#'
#' bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = FALSE,
#'                         flip.axes = TRUE,
#'                         col.bar = "cyan")
#'
#' bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = TRUE, bar = FALSE,
#'                         flip.axes = TRUE)
#'
#' bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
#'                               angle = 45, push = 15, hjust = 1)
#' bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
#'                               push = 20, hjust = 1)
#' bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
#'                               angle = 45, push = -30, hjust = 0)
#'
#' grid.arrange(bg1, bg1_lab, nrow = 1)
#' grid.arrange(bg2, bg2_lab, nrow = 1)
#' grid.arrange(bg3, bg3_lab, nrow = 1)
#'
#' bg1 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, flip.axes = TRUE,
#'                         fill = "salmon", mirror = FALSE)
#'
#' bg2 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = FALSE, mirror = FALSE,
#'                         flip.axes = TRUE,
#'                         col.bar = "cyan")
#'
#' bg3 <- profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                         size = 20, line = TRUE, bar = FALSE,
#'                         flip.axes = TRUE,
#'                         mirror = FALSE)
#'
#' bg1_lab <- addlabel.glyphGrob(grob = bg1, label = label, segment = TRUE,
#'                               angle = 45, push = 5, hjust = 1)
#' bg2_lab <- addlabel.glyphGrob(grob = bg2, label = label, segment = TRUE,
#'                               push = 5, hjust = 1)
#' bg3_lab <- addlabel.glyphGrob(grob = bg3, label = label, segment = TRUE,
#'                               angle = 45, push = -25, hjust = 0)
#'
#' grid.arrange(bg1, bg1_lab, nrow = 1)
#' grid.arrange(bg2, bg2_lab, nrow = 1)
#' grid.arrange(bg3, bg3_lab, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add labels to dotglyphGrob
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' clrs <- mapply(function(a, b) rep(a, b),
#'                RColorBrewer::brewer.pal(6, "Dark2"),
#'                round(c(4, 3.5, 2.7, 6.8, 3.4, 5.7)))
#' clrs <- unlist(clrs)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     fill = "salmon", col = "black")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE,
#'                     fill = "black", col = clrs, lwd = 5)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE,
#'                     fill = "green", col = "grey")
#'
#' dg1_lab <- addlabel.glyphGrob(grob = dg1, label = label, segment = FALSE,
#'                               push = 3, hjust = 1, angle = 45)
#' dg2_lab <- addlabel.glyphGrob(grob = dg2, label = label, segment = TRUE,
#'                               angle = 45, push = 20, hjust = 1)
#' dg3_lab <- addlabel.glyphGrob(grob = dg3, label = label, segment = FALSE,
#'                               push = 3, hjust = 1)
#' dg4_lab <- addlabel.glyphGrob(grob = dg4, label = label, segment = TRUE,
#'                               push = 20,  hjust = 1)
#'
#' grid.arrange(dg1, dg1_lab, nrow = 1)
#' grid.arrange(dg2, dg2_lab, nrow = 1)
#' grid.arrange(dg3, dg3_lab, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add labels to tileglyphGrob
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' label = c("hp", "drat", "wt", "qsec", "vs", "am", "gear")
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5,
#'                      fill = RColorBrewer::brewer.pal(7, "Dark2"))
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 7,
#'                      fill = RColorBrewer::brewer.pal(7, "Dark2"))
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2,
#'                      fill = RColorBrewer::brewer.pal(7, "Dark2"))
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 3,
#'                      fill = RColorBrewer::brewer.pal(7, "Dark2"))
#'
#' tg1_lab <- addlabel.glyphGrob(grob = tg1, label = label, segment = FALSE,
#'                               angle = 45, push = -10, hjust = 1, vjust = 0.5)
#' tg2_lab <- addlabel.glyphGrob(grob = tg2, label = label, segment = FALSE,
#'                               push = -1, hjust = 0, vjust = 0.5)
#' tg3_lab <- addlabel.glyphGrob(grob = tg3, label = label)
#' tg4_lab <- addlabel.glyphGrob(grob = tg4, label = label, segment = TRUE,
#'                               push = 5, hjust = 0, vjust = 0.25)
#'
#' grid.arrange(tg1, tg2, tg3, tg4,
#'              tg1_lab, tg2_lab, tg3_lab, tg4_lab,
#'              nrow = 2, ncol = 4)
#'
addlabel.glyphGrob <- function(grob, label,
                               segment = TRUE,
                               segment.control = ggmultiglyph.segment.control(),
                               push = 10, angle = 0,
                               hjust = 0.5, vjust = 0.5) {

  # Check if grob is a glyphGrob
  if (!is(grob, "glyphGrob")) {
    stop('"grob" is not of class "glyphGrob".')
  }

  # Check if label is a character vector
  if (!(is.character(label))) {
    stop('"label" should be a charachter vector.')
  }

  # check if label and glyphGrob components are of equal length
  if (length(label) != attr(grob, "length")) {
    stop('"label" length (', length(label), ') ',
         'does not match the "grob" dimensions (',
         attr(grob, "length"), ').')
  }

  # Radial anchors (including tileglyphGrob) ----

  rad_anch_grobs <- c("starglyphGrob", "metroglyphGrob",
                      "pieglyphGrob", "tileglyphGrob")

  ## Get anchors ----

  if (any(vapply(rad_anch_grobs, inherits, logical(1), x = grob))) {

    if (any(vapply(c("starglyphGrob", "metroglyphGrob"),
                   inherits, logical(1), x = grob))) {

      # Find which of the grob children are polygonGrob/polylineGrob
      polygon_ind <- sapply(grob$children, function(k) {
        inherits(k, "polygon")
      }) |
        sapply(grob$children, function(k) {
          inherits(k, "polyline")
        })

      p_ind <- which(polygon_ind)[1]

      # Get coordinates for the anchor points on the glyphgrob
      xn <- grob$children[[p_ind]]$x
      yn <- grob$children[[p_ind]]$y

      if (inherits(grob, "metroglyphGrob")) {
        xn <- tail(xn, length(xn) / 2)
        yn <- tail(yn, length(yn) / 2)
      }
    }

    if (inherits(grob, "pieglyphGrob")) {

      # Get coordinates for the anchor points on the glyphgrob
      xn_list <- split(grob$children[[1]]$x, grob$children[[1]]$id)
      yn_list <- split(grob$children[[1]]$y, grob$children[[1]]$id)

      xn <- lapply(seq_along(xn_list), function(i) {
        sumunit_list <- xn_list[[i]]
        if (length(unitType(sumunit_list[[1]], recurse = TRUE))) {
          sumunit_list <- sumunit_list[-1]
        }
        # sumunit_list <-
        #   sumunit_list[1] + unit(0, "mm") #Add 0 mm to first unit
        boxdim(sumunit_list, "mean")
      })
      xn <- do.call(unit.c, xn)

      yn <- lapply(seq_along(yn_list), function(i) {
        sumunit_list <- yn_list[[i]]
        if (length(unitType(sumunit_list[[1]], recurse = TRUE))) {
          sumunit_list <- sumunit_list[-1]
        }
        # sumunit_list <-
        #   sumunit_list[1] + unit(0, "mm") #Add 0 mm to first unit
        boxdim(sumunit_list, "mean")
      })
      yn <- do.call(unit.c, yn)

    }

    if (inherits(grob, "tileglyphGrob")) {

      # Get coordinates for the anchor points on the glyphgrob
      xn <- grob$x
      yn <- grob$y

    }

    ## Generate label coordinates ----

    if (inherits(grob, "tileglyphGrob") &&
        (attr(grob, "nrow") == 1 ||
         attr(grob, "nrow") == attr(grob, "length"))) {

      if (inherits(grob, "tileglyphGrob") &&
          attr(grob, "nrow") == 1) {

        # Get pushed labels coordinates
        x_label <- xn
        y_label <- yn + grob$height + unit(push, "mm")

      }

      if (inherits(grob, "tileglyphGrob") &&
          attr(grob, "nrow") == attr(grob, "length")) {

        # Get pushed labels coordinates
        x_label <- xn + grob$width + unit(push, "mm")
        y_label <- yn

      }

      # justification
      just_x <- hjust
      just_y <- vjust

    } else { # starglyphGrob, metrhoglyphGrob and pieglyphGrob

      # Check if segement.control compoents are 1 or equal to no. of labels
      if (any(!(sapply(segment.control, length) %in%
                c(0, 1, length(label))))) {
        stop('"segment.control" elements should be of length 1, ',
             'or length equal to length of "label", or ',
             'a NULL object.')
      }

      # convert to absolute coordinates
      x_mm <- convertX(xn, "mm", valueOnly = TRUE)
      y_mm <- convertY(yn, "mm", valueOnly = TRUE)

      # Find the center
      cx <- boxdim(xn, "mean")
      cy <- boxdim(yn, "mean")

      cx_mm <- convertX(cx, "mm", valueOnly = TRUE)
      cy_mm <- convertY(cy, "mm", valueOnly = TRUE)

      # Compute angles
      angles <- atan2(y_mm - cy_mm, x_mm - cx_mm)

      # Get pushed labels coordinates
      x_label <- xn + unit(push * cos(angles), "mm")
      y_label <- yn + unit(push * sin(angles), "mm")

      # debug
      # # grid.newpage()
      # grid.draw(grob)
      # grid.draw(pointsGrob(x = cx, y = cy, gp = gpar(col = "red")))
      # grid.draw(pointsGrob(x = xn, y = yn, gp = gpar(col = "blue")))
      # grid.draw(pointsGrob(x = x_label, y = y_label,
      #                      gp = gpar(col = "green")))

      # Smart justification
      just_x <- ifelse(cos(angles) > 0, 0, 1)
      just_x <- ifelse(abs(round(sin(angles), 2)) == 1, 0.5, just_x)

      just_y <- ifelse(sin(angles) > 0, 0, 1)
      just_y <- ifelse(abs(round(cos(angles), 2)) == 1, 0.5, just_y)

    }
  }

  # Linear anchors (profileglyphGrob) ----

  if (inherits(grob, "profileglyphGrob")) {

    ## Get anchors ----

    pr_ind <- sapply(grob$children, function(k) {
      inherits(k, "rect")
    }) |
      sapply(grob$children, function(k) {
        inherits(k, "polygon")
      })

    pr_ind <- which(pr_ind)[1]

    # Get coordinates for the anchor points on the glyphgrob
    if (inherits(grob$children[[pr_ind]], "rect")) {

      xn <- grob$children[[pr_ind]]$x
      yn <- grob$children[[pr_ind]]$y

    }

    if (inherits(grob$children[[pr_ind]], "polygon")) {

      xn <- grob$children[[pr_ind]]$x
      yn <- grob$children[[pr_ind]]$y

      if (attr(grob, "mirror") == FALSE) {

        xn <- xn[-c(1, length(xn))]
        yn <- yn[-c(1, length(yn))]

      } else {
        xn <- xn[1:attr(grob, "length")]
        yn <- yn[1:attr(grob, "length")]
      }
    }

    ## Get pushed labels coordinates ----

    if (attr(grob, "mirror") == FALSE) {

      if (attr(grob, "flip.axes") == FALSE) {

        x_label <- xn
        if (inherits(grob$children[[pr_ind]], "rect")) {
          y_label <- yn - unit(push, "mm")
        } else {
          y_label <- boxdim(yn, "min") - unit(push, "mm")
        }

      } else { # flip.axes  == TRUE

        if (inherits(grob$children[[pr_ind]], "rect")) {
          x_label <- xn - unit(push, "mm")
        } else {
          x_label <- boxdim(xn, "min") - unit(push, "mm")
        }
        y_label <- yn

      }

    } else { # mirror ==  TRUE

      if (attr(grob, "flip.axes") == FALSE) {

        x_label <- xn
        if (inherits(grob$children[[pr_ind]], "rect")) {
          y_label <- yn - (max(grob$children[[pr_ind]]$height) / 2) -
            unit(push, "mm")
        } else {
          y_label <- boxdim(yn, "min") - unit(push, "mm")
        }

      } else { # flip.axes  == TRUE

        if (inherits(grob$children[[pr_ind]], "rect")) {
          x_label <- xn - (max(grob$children[[pr_ind]]$height) / 2) -
            unit(push, "mm")
        } else {
          x_label <- boxdim(xn, "min") - unit(push, "mm")
        }
        y_label <- yn

      }

    }

    # justification
    just_x <- hjust
    just_y <- vjust

  }

  # Linear anchors (dotglyphGrob) ----

  if (inherits(grob, "dotglyphGrob")) {

    ## Get anchors ----

    c_ind <- attr(grob, "index")

    anchor_what <- ifelse(attr(grob, "mirror") == FALSE,
                          "min", "mean")

    if (attr(grob, "flip.axes") == FALSE) {

      xn <- do.call(unit.c,
                    lapply(split(grob$x, c_ind),
                           function(cg) {
                             boxdim(cg, anchor_what)
                           }))
      yn <- do.call(unit.c,
                    lapply(split(grob$y, c_ind),
                           function(cg) {

                             cg <- do.call(unit.c, lapply(cg, simplify_mm))

                             boxdim(cg, anchor_what)
                           }))

    } else { # "flip.axes" == TRUE

      xn <- do.call(unit.c,
                    lapply(split(grob$x, c_ind),
                           function(cg) {

                             cg <- do.call(unit.c, lapply(cg, simplify_mm))

                             boxdim(cg, anchor_what)

                           }))
      yn <- do.call(unit.c,
                    lapply(split(grob$y, c_ind),
                           function(cg) {
                             boxdim(cg, anchor_what)
                           }))

    }

    ## Get pushed labels coordinates ----

    if (attr(grob, "flip.axes") == FALSE) {

      x_label <- xn
      y_label <- yn - unit(push, "mm")

    } else {

      x_label <- xn - unit(push, "mm")
      y_label <- yn

    }

    # justification
    just_x <- hjust
    just_y <- vjust

  }


  # Segment grob ----

  if (segment == TRUE) {
    segg <-
      grid::curveGrob(x1 = xn, y1 = yn,
                      x2 = x_label, y_label,
                      default.units = "native",
                      curvature = segment.control$segment.curvature,
                      angle = segment.control$segment.angle,
                      ncp = segment.control$segment.ncp,
                      shape = segment.control$segment.shape,
                      square = segment.control$segment.square,
                      squareShape = segment.control$segment.squareShape,
                      inflect = segment.control$segment.inflect,
                      debug = segment.control$segment.debug,
                      gp = gpar(col = segment.control$segment.colour,
                                lwd = segment.control$segment.size *
                                  ggplot2::.pt,
                                lty = segment.control$segment.linetype),
                      arrow = if (is.null(segment.control$segment.arrow)) {
                        NULL
                      } else {
                        segment.control$segment.arrow
                      })
  }

  # Label grob
  labelgorb <-
    textGrob(label = label, x = x_label, y = y_label,
             hjust = just_x, vjust = just_y, rot = angle)

  if (segment == TRUE) {
    gridout <-
      grid::gTree(children = gList(grob, segg, labelgorb))
  } else {
    gridout <-
      grid::gTree(children = gList(grob, labelgorb))
  }

  gridout
}
