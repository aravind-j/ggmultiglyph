#' Draw a Star Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a star glyph
#' \insertCite{siegel_surgical_1972,chambers_graphical_1983,dutoit_graphical_1986}{ggmultiglyph}.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the distance of star glyph points from
#'   the centre.
#' @param size The size of glyphs.
#' @param col.whisker The colour of whiskers.
#' @param col.contour The colour of contours.
#' @param col.points The colour of grid points.
#' @param fill The fill colour.
#' @param lwd.whisker The whisker line width.
#' @param lwd.contour The contour line width.
#' @param alpha The alpha transparency value.
#' @param angle.start The start angle for the glyph in radians. Default is zero.
#' @param angle.stop The stop angle for the glyph in radians. Default is
#'   \eqn{2\pi}.
#' @param whisker logical. If \code{TRUE}, plots the star glyph whiskers.
#' @param contour logical. If \code{TRUE}, plots the star glyph contours.
#' @param linejoin The line join style for the contour polygon. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#' @param lineend The line end style for the whisker lines. Either
#'   \code{"round"}, \code{"butt"} or \code{"square"}.
#' @param draw.grid logical. If \code{TRUE}, grid points are plotted along the
#'   whiskers. Default is \code{FALSE}.
#' @param grid.levels A list of grid levels (as vectors) corresponding to the
#'   values in \code{z} at which points are to be plotted. The values in
#'   \code{z} should be present in the list specified.
#' @param grid.point.size The size of the grid points in native units.
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @family grobs
#'
#' @importFrom grid polygonGrob polylineGrob nullGrob grobTree gpar unit unit.c
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_starglyph}}
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
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Whisker and contour combination
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      whisker = FALSE)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      contour = FALSE)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      whisker = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      contour = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                      whisker = FALSE)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      whisker = FALSE)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20,
#'                      whisker = FALSE)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                      whisker = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      whisker = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20,
#'                      whisker = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#'
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                      contour = FALSE)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      contour = FALSE)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20,
#'                      contour = FALSE)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                      contour = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      contour = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20,
#'                      contour = FALSE,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust angle
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 90 * (base::pi/180),
#'                      angle.stop = 270 * (base::pi/180))
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 2 * base::pi,
#'                      angle.stop = 0)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = base::pi, angle.stop = 0)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 270 * (base::pi/180),
#'                      angle.stop = 90 * (base::pi/180))
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust whisker and contour line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      fill = "salmon")
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      fill = "cyan")
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      fill = "green")
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      fill = "salmon")
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      fill = "cyan")
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      fill = "green")
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust whisker and contour colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      col.whisker = "salmon", col.contour = "salmon")
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      col.whisker = "cyan", col.contour = "gray")
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      col.whisker = "gray", col.contour = "green")
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      col.whisker = "salmon", col.contour = "salmon")
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      col.whisker = "cyan", col.contour = "gray")
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      col.whisker = "gray", col.contour = "green")
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate whisker colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 3, lwd.contour = 0.1,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      lwd.whisker = 0.1, lwd.contour = 3,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      col.contour = "gray")
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line join style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                      lwd.contour = 10)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                      lwd.contour = 10, linejoin = "bevel")
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                      lwd.contour = 10, linejoin = "round")
#'
#' grid.arrange(sg1, sg2, sg3, nrow = 1, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line end style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                      lwd.whisker = 10, contour = FALSE)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                      lwd.whisker = 10, lineend = "butt", contour = FALSE)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                      lwd.whisker = 10, lineend = "square", contour = FALSE)
#'
#' grid.arrange(sg1, sg2, sg3, nrow = 1, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust grid levels
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Grid levels
#' gl <- split(x = c(rep(c(1, 2, 3), 4),
#'                   rep(c(1, 2, 3, 4), 2)),
#'             f = c(rep(1:4, each = 3),
#'                   rep(5:6, each = 4)))
#' gl
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.01)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      lwd.whisker = 3, col.points = "white",
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.05,
#'                      contour = FALSE)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      lwd.contour = 3,
#'                      draw.grid = FALSE, grid.levels = gl,
#'                      grid.point.size = 0.05,
#'                      whisker = FALSE)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.01)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      lwd.whisker = 3,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.05, contour = FALSE)
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      lwd.contour = 3,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      draw.grid = FALSE, grid.levels = gl,
#'                      whisker = FALSE)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill, whisker, contour and grid level colours
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' sg1 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      col.points = NA, fill = "black",
#'                      grid.point.size = 0.05)
#'
#' sg2 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      contour = FALSE,
#'                      lwd.whisker = 3,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.05)
#'
#' sg3 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      whisker = FALSE,
#'                      lwd.contour = 3,
#'                      draw.grid = FALSE, grid.levels = gl,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      grid.point.size = 0.05)
#'
#' sg4 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.01)
#'
#' sg5 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      col.contour = "gray",
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      angle.start = 0, angle.stop = base::pi,
#'                      draw.grid = TRUE, grid.levels = gl,
#'                      grid.point.size = 0.01, col.points = "gray")
#'
#' sg6 <- starglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                      lwd.contour = 3,
#'                      whisker = FALSE,
#'                      angle.start = 0, angle.stop = base::pi,
#'                      draw.grid = FALSE, grid.levels = gl,
#'                      col.whisker = RColorBrewer::brewer.pal(6, "Dark2"),
#'                      grid.point.size = 0.05)
#'
#' grid.arrange(sg1, sg2, sg3, sg4, sg5, sg6, nrow = 2, ncol = 3)
#'
starglyphGrob <- function(x = .5, y = .5, z,
                          size = 1,
                          col.whisker = "black",
                          col.contour = "black",
                          col.points = "black",
                          fill = NA,
                          lwd.whisker = 1,
                          lwd.contour = 1,
                          alpha = 1,
                          angle.start = 0,
                          angle.stop = 2 * base::pi,
                          whisker = TRUE,
                          contour = TRUE,
                          linejoin = c("mitre", "round", "bevel"),
                          lineend = c("round", "butt", "square"),
                          grid.levels = NULL,
                          draw.grid = FALSE,
                          grid.point.size = 10) {

  linejoin <- match.arg(linejoin)
  lineend <- match.arg(lineend)

  # grid::grid.rect(gp=gpar(col="gray"))
  # grid::grid.points(x = x, y = y, pch =  20)

  # Get polygon points
  dimension <- length(z)

  if (abs(angle.start - angle.stop) == 2 * base::pi) {
    angle <- seq(angle.start, angle.stop,
                 length.out = dimension + 1)[1:dimension]
  } else {
    angle <- seq(angle.start, angle.stop,
                 length.out = dimension)
  }

  starx <- unit(x, "native") + unit(z * size * cos(angle), "mm")
  stary <- unit(y, "native") + unit(z * size * sin(angle), "mm")

  # Empty Grobs
  contourGrob <- grid::nullGrob()
  whiskerGrob <- grid::nullGrob()
  gpointsGrob <- grid::nullGrob()

  # Plot contours/polygon
  if (contour == TRUE) {
    # grid::grid.points(x = starx, y = stary, pch = 3)
    contourGrob <- grid::polygonGrob(x = starx,
                                     y = stary,
                                     # default.units = "native",
                                     gp = grid::gpar(fill = fill,
                                                     col = col.contour,
                                                     lwd = lwd.contour,
                                                     alpha = alpha,
                                                     linejoin = linejoin))
  }

  # Plot whiskers
  if (whisker == TRUE) {

    rayx <- grid::unit.c(rep(unit(x, "native") + unit(0, "mm"), dimension),
                         starx)
    rayy <- grid::unit.c(rep(unit(y, "native") + unit(0, "mm"), dimension),
                         stary)
    rayid <- rep(1:dimension, 2)

    whiskerGrob <- grid::polylineGrob(x = rayx,
                                      y = rayy,
                                      id = rayid,
                                      # default.units = "native",
                                      gp = grid::gpar(col = col.whisker,
                                                      lwd = lwd.whisker,
                                                      alpha = alpha,
                                                      lineend = lineend))
  }

  # Plot grid points

  if (draw.grid) {
    if (!is.null(grid.levels)) { # Check if grid points are to be plotted
      # Check if grid.levels is a list in appropriate format
      if (is.list(grid.levels) &&
          all(vapply(grid.levels, is.numeric, logical(1)))) {
        # Check if z is present in corresponding grid.levels
        if (!all(mapply(function(a, b) a %in% b, z, grid.levels))) {
          warning('Mismatch in values "z" values and corresponding ',
                  '"grid.levels".\n',
                  'Unable to plot grid points.')
        } else {

          # plot points
          grid.levels <- mapply(function(a, b) b[b <= a], z, grid.levels,
                                SIMPLIFY = FALSE)

          starpx <- mapply(function(a, b) {
            unit(x, "native") + unit(a * size * cos(b), "mm")
          },
          grid.levels, angle, SIMPLIFY = FALSE)
          starpy <- mapply(function(a, b) {
            unit(y, "native") + unit(a * size * sin(b), "mm")
          },
          grid.levels, angle, SIMPLIFY = FALSE)

          starpx <- upgradeUnit.unit.list(starpx)
          starpy <- upgradeUnit.unit.list(starpy)

          if (is.na(col.points)) {
            if (length(col.whisker) == length(grid.levels)) {
              col.points <- mapply(function(a, b) rep(a, length(b)),
                                   col.whisker, grid.levels)
              col.points <- unlist(col.points)
            } else {
              col.points <- col.whisker
            }
          }

          gpointsGrob <- grid::pointsGrob(starpx, starpy,
                                          # default.units = "native",
                                          pch = 20,
                                          size = grid::unit(grid.point.size,
                                                      "native"),
                                          gp = grid::gpar(col = col.points,
                                                          alpha = alpha))
        }

      } else {
        warning('Non-standard format specified as "grid.levels".\n',
                'Unable to plot grid points.')
      }

    } else {
      warning('"grid.levels" not specified.\n',
              'Unable to plot grid points.')
    }
  }

  gridout <-
    grid::grobTree(contourGrob, whiskerGrob, gpointsGrob,
                   gp = grid::gpar(alpha = alpha,
                                   fill = fill))

  class(gridout) <- append(class(gridout), c("glyphGrob", "starglyphGrob"))

  attr(gridout, "length") <- dimension

  return(gridout)
}
