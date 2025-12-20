

# labels start from left to right in clock-wise direction


addlabel.glyphGrob <- function(grob, label,
                               segment = TRUE,
                               segment.control = gglyph.segment.control(),
                               push = 10) {

  # Check if grob is a glyphGrob
  if (!is(grob, "glyphGrob")) {
    stop('"grob" is not of class "glyphGrob".')
  }

  # Check if label is a character vector
  if (!(is.character(label))) {
    stop('"label" should be a charachter vector.')
  }

  # Radial ----
  # any(class(grob) %in% c("starglyphGrob", "metroglyphGrob", "pieglyphGrob"))
  #
  # any(class(grob) %in% c("tileglyphGrob"))

  if (any(class(grob) %in% c("starglyphGrob", "metroglyphGrob"))) {
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

    if (any(class(grob) %in% c("metroglyphGrob"))) {
      xn <- tail(xn, length(xn) / 2)
      yn <- tail(yn, length(yn) / 2)
    }
  }

  if (any(class(grob) %in% c("pieglyphGrob"))) {

    # Get coordinates for the anchor points on the glyphgrob
    xn_list <- split(grob$children[[1]]$x, grob$children[[1]]$id)
    yn_list <- split(grob$children[[1]]$y, grob$children[[1]]$id)

    xn <- lapply(seq_along(xn_list), function(i) {
      boxdim(xn_list[[i]], "mean")
    })
    xn <- do.call(unit.c, xn)
    yn <- lapply(seq_along(yn_list), function(i) {
      boxdim(yn_list[[i]], "mean")
    })
    yn <- do.call(unit.c, yn)


  }


  # check if label and glyphGrob components are of equal length
  if (length(label) != length(xn)) {
    stop('"label" length (', length(label), ') ',
         'does not match the "grob" dimenstions (',
         length(xn), ').')
  }

  # Check if segement.control compoents are 1 or equal to no. of labels
  if(any(!(sapply(segment.control, length) %in%
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
  # grid.draw(pointsGrob(x = x_label, y = y_label, gp = gpar(col = "green")))

  # Smart justification
  just_x <- ifelse(cos(angles) > 0, 0, 1)
  just_x <- ifelse(abs(round(sin(angles), 2)) == 1, 0.5, just_x)

  just_y <- ifelse(sin(angles) > 0, 0, 1)
  just_y <- ifelse(abs(round(cos(angles), 2)) == 1, 0.5, just_y)

  # Segment grob

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
                                lwd = segment.control$segment.size * ggplot2::.pt,
                                lty = segment.control$segment.linetype),
                      arrow = if(is.null(segment.control$segment.arrow)) {
                        NULL
                      } else {
                        segment.control$segment.arrow
                      })
  }

  # Label grob
  labelgorb <-
    textGrob(label = label, x = x_label, y = y_label,
             hjust = just_x, vjust = just_y)


  if (segment == TRUE) {
    gridout <-
      grid::gTree(children = gList(grob, segg, labelgorb))
  } else {
    gridout <-
      grid::gTree(children = gList(grob, labelgorb))
  }

  # Linear ----

  any(class(grob) %in% c("profileglyphGrob", "dotglyphgrob"))

  any(class(grob) %in% c("tileglyphGrob"))


  return(gridout)
}

# attr
# mirror
# flip.axes
# ratio
# ndim
# nrow
