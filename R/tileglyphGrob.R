#' Draw a Tile Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a tile glyph similar to
#' 'autoglyph' \insertCite{beddow_shape_1990}{ggmultiglyph} or 'stripe glyph'
#' \insertCite{fuchs_evaluation_2013}{ggmultiglyph}.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the values to be plotted as dimensions
#'   in the tileglyph.
#' @param size The size of glyphs.
#' @param ratio The aspect ratio (height / width).
#' @param nrow The number of rows.
#' @param col The line colour.
#' @param fill The fill colour.
#' @param lwd The line width.
#' @param alpha The alpha transparency value.
#' @param linejoin The line join style for the tile polygon. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{grob}} object.
#'
#' @importFrom grid rectGrob gpar
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_tileglyph}}
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#' library(ggmultiglyph)
#' library(grid)
#' library(gridExtra)
#'
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust tile size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 3)
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5)
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 8)
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 3, nrow = 2)
#'
#' tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2)
#'
#' tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 8, nrow = 2)
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
#'              nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5)
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, lwd = 3)
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, lwd = 5)
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2)
#'
#' tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2, lwd = 3)
#'
#' tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2, lwd = 5)
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
#'              nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line join style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4),
#'                      size = 5, lwd = 10)
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4),
#'                      size = 5, lwd = 10, linejoin = "bevel")
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4),
#'                      size = 5, lwd = 10, linejoin = "round")
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4),
#'                      size = 5, nrow = 2, lwd = 10)
#'
#' tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4),
#'                      size = 5, nrow = 2, lwd = 10,
#'                      linejoin = "bevel")
#'
#' tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4),
#'                      size = 5, nrow = 2, lwd = 10,
#'                      linejoin = "round")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
#'              nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust rows
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5)
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                      size = 5)
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2)
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                      size = 5, nrow = 2)
#'
#' grid.arrange(tg1, tg2, tg3, tg4,
#'              nrow = 2, ncol = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust tile ratio
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5)
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, ratio = 0.5)
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, ratio = 3)
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2)
#'
#' tg5 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2, ratio = 0.5)
#'
#' tg6 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2, ratio = 3)
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6,
#'              nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate tile fill
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5,
#'                      fill = RColorBrewer::brewer.pal(7, "Dark2"))
#'
#' tg2 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                      size = 5,
#'                      fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' tg3 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7, 4.3),
#'                      size = 5, nrow = 2,
#'                      fill = RColorBrewer::brewer.pal(7, "Dark2"))
#'
#' tg4 <- tileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                      size = 5, nrow = 2,
#'                      fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(tg1, tg2, tg3, tg4,
#'              nrow = 2, ncol = 2)
#'
#'
tileglyphGrob <- function(x = .5, y = .5, z,
                          size = 10,
                          ratio = 1,
                          nrow = 1,
                          col = "black",
                          fill = NA,
                          lwd = 1,
                          alpha = 1,
                          linejoin = c("mitre", "round", "bevel")) {

  linejoin <- match.arg(linejoin)

  # grid::grid.points(x = x, y = y, pch =  20)

  dimension <- length(z)

  width <- unit(size, "mm")
  height <- unit(size, "mm") * ratio

  dim <- ceiling(dimension / nrow)

  zs <- split(z, sort(rep_len(1:nrow, length(z))))

  if (nrow > 1) {
    ys <- unit(y, "native") +
      (height * seq(-(nrow - 1) / 2, (nrow - 1) / 2,
                    length.out = nrow))
  } else {
    # ys <- y
    ys <- unit(y, "native") + unit(0, "mm")
  }

  xs <- unit(x, "native") +
    (width * seq(-(dim - 1) / 2, (dim - 1) / 2,
                 length.out = dim))

  xlist <- vector("list", nrow)
  ylist <- vector("list", nrow)

  for (i in 1:nrow) {
    nz <- length(zs[[i]])
    xlist[[i]] <- xs[1:nz]
    ylist[[i]] <- rep(ys[[i]], nz)
  }

  xlist <- upgradeUnit.unit.list(xlist)
  ylist <- upgradeUnit.unit.list(ylist)

  # grid::grid.points(x = xlist, y = ylist, pch =  1)

  gridout <-
    grid::rectGrob(x = xlist,
                   y = ylist,
                   width = width, height = height,
                   # default.units = "native",
                   just = "centre",
                   gp = gpar(col = col,
                             fill = fill,
                             lwd = lwd,
                             alpha = alpha,
                             linejoin = linejoin))

  class(gridout) <- append(class(gridout), c("glyphGrob", "tileglyphGrob"))

  attr(gridout, "length") <- dimension
  attr(gridout, "ratio") <- ratio
  attr(gridout, "nrow") <- nrow

  return(gridout)
}
