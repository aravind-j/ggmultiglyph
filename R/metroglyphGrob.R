#' Draw a Metroglyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a metroglyph
#' \insertCite{anderson_semigraphical_1957,dutoit_graphical_1986}{gglyph}.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the length of rays.
#' @param size The size of rays.
#' @param circle.size The size of the central circle (radius).
#' @param col.circle The circle colour.
#' @param col.ray The colour of rays.
#' @param col.points The colour of grid points.
#' @param fill The circle fill colour.
#' @param lwd.circle The circle line width.
#' @param lwd.ray The ray line width.
#' @param alpha The alpha transparency value.
#' @param angle.start The start angle for the glyph rays in radians. Default is
#'   zero.
#' @param angle.stop The stop angle for the glyph rays in radians. Default is
#'   \eqn{2\pi}.
#' @param lineend The line end style for the rays. Either \code{"round"},
#'   \code{"butt"} or \code{"square"}.
#' @param draw.grid logical. If \code{TRUE}, grid points are plotted along the
#'   whiskers. Default is \code{FALSE}.
#' @param grid.levels A list of grid levels (as vectors) corresponding to the
#'   values in \code{z} at which points are to be plotted. The values in
#'   \code{z} should be present in the list specified.
#' @param grid.point.size The size of the grid points in native units.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @importFrom grid circleGrob polylineGrob grobTree gpar nullGrob unit unit.c
#' @export
#'
#' @seealso \code{\link[gglyph]{geom_metroglyph}}
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#' library(gglyph)
#' library(grid)
#' library(gridExtra)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust ray size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20)
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 20,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust circle size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       circle.size = 0, size = 15)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       circle.size = 2, size = 15)
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       circle.size = 5, size = 15)
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       circle.size = 0, size = 15,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       circle.size = 2, size = 15,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       circle.size = 5, size = 15,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust angle
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       size = 15, circle.size = 2)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       size = 15, circle.size = 2,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       size = 15, circle.size = 2,
#'                       angle.start = 90 * (base::pi/180),
#'                       angle.stop = 270 * (base::pi/180))
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       size = 15, circle.size = 2,
#'                       angle.start = 2 * base::pi,
#'                       angle.stop = 0)
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       size = 15, circle.size = 2,
#'                       angle.start = base::pi, angle.stop = 0)
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                       size = 15, circle.size = 2,
#'                       angle.start = 270 * (base::pi/180),
#'                       angle.stop = 90 * (base::pi/180))
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust circle and ray line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 3, lwd.circle = 0.1)
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 0.1, lwd.circle = 3)
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 3, lwd.circle = 0.1,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 0.1, lwd.circle = 3,
#'                       angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       fill = "salmon")
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 3, lwd.circle = 0.1,
#'                       fill = "cyan")
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 0.1, lwd.circle = 3,
#'                       fill = "green")
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       fill = "salmon")
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 3, lwd.circle = 0.1,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       fill = "cyan")
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 0.1, lwd.circle = 3,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       fill = "green")
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust ray colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       col.circle = "gray")
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 3, lwd.circle = 0.1,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       col.circle = "gray")
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 0.1, lwd.circle = 3,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       col.circle = "gray")
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       col.circle = "gray")
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 3, lwd.circle = 0.1,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       col.circle = "gray")
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                       lwd.ray = 0.1, lwd.circle = 3,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       col.circle = "gray")
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line end style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                       lwd.ray = 10)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                       lwd.ray = 10, lineend = "butt")
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(0.28, 0.33, 0.8, 1.2, 0.6, 0.5, 0.7), size = 15,
#'                       lwd.ray = 10, lineend = "square")
#'
#' grid.arrange(mg1, mg2, mg3, nrow = 1, ncol = 3)
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
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.01)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       lwd.ray = 3, col.points = "white",
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.05)
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       draw.grid = FALSE, grid.levels = gl,
#'                       grid.point.size = 0.05)
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.01)
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       lwd.ray = 3,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.05)
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       draw.grid = FALSE, grid.levels = gl)
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill, ray and grid level colours
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' mg1 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       col.points = NA,
#'                       grid.point.size = 0.05)
#'
#' mg2 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       lwd.ray = 3,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.05)
#'
#' mg3 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       circle.size = 0, col.points = "white",
#'                       lwd.ray = 3,
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       grid.point.size = 0.05)
#'
#' mg4 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.01)
#'
#' mg5 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       col.circle = "gray",
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       angle.start = 0, angle.stop = base::pi,
#'                       draw.grid = TRUE, grid.levels = gl,
#'                       grid.point.size = 0.03, col.points = "gray")
#'
#' mg6 <- metroglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                       z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                       angle.start = 0, angle.stop = base::pi,
#'                       draw.grid = FALSE, grid.levels = gl,
#'                       col.ray = RColorBrewer::brewer.pal(6, "Dark2"),
#'                       grid.point.size = 0.05)
#'
#' grid.arrange(mg1, mg2, mg3, mg4, mg5, mg6, nrow = 2, ncol = 3)
#'
metroglyphGrob <- function(x = .5, y = .5, z,
                          size = 1, circle.size = 5,
                          col.circle = "black",
                          col.ray = "black",
                          col.points = "black",
                          fill = NA,
                          lwd.circle = 1,
                          lwd.ray = 1,
                          alpha = 1,
                          angle.start = 0,
                          angle.stop = 2 * base::pi,
                          lineend = c("round", "butt", "square"),
                          grid.levels = NULL,
                          draw.grid = FALSE,
                          grid.point.size = 10) {

  lineend <- match.arg(lineend)

  # grid::grid.points(x = x, y = y, pch =  20)

  circGrob <- grid::circleGrob(x = x, y = y,
                               # r = circle.size,
                               r = unit(circle.size, "mm"),
                               default.units = "native",
                               gp = grid::gpar(lwd = lwd.circle,
                                               alpha = alpha,
                                               col = col.circle,
                                               fill = fill))

  # Get polygon points
  dimension <- length(z)

  if (abs(angle.start - angle.stop) == 2 * base::pi) {
    angle <- seq(angle.start, angle.stop,
                 length.out = dimension + 1)[1:dimension]
  } else {
    angle <- seq(angle.start, angle.stop, length.out = dimension)
  }

  # rayx <- x + (z * size * cos(angle))
  # rayy <- y + (z * size * sin(angle))
  # grid.points(rayx, rayy)

  # rayxstp <- x + ((circle.size + (z * size)) * cos(angle))
  # rayystp <- y + ((circle.size + (z * size)) * sin(angle))

  rayxstp <- unit(x, "native") +
    unit((circle.size + (z * size)) * cos(angle), "mm")
  rayystp <- unit(y, "native") +
    unit((circle.size + (z * size)) * sin(angle), "mm")
  # grid.points(rayxstp, rayystp, pch = 4)

  # rayxstrt <- x + (circle.size * cos(angle))
  # rayystrt <- y + (circle.size * sin(angle))

  rayxstrt <- unit(x, "native") + unit(circle.size * cos(angle), "mm")
  rayystrt <- unit(y, "native") + unit(circle.size * sin(angle), "mm")
  # grid.points(rayxstrt, rayystrt, pch = 20)

  # rayx <- c(rayxstrt, rayxstp)
  # rayy <- c(rayystrt, rayystp)

  rayx <- grid::unit.c(rayxstrt, rayxstp)
  rayy <- grid::unit.c(rayystrt, rayystp)
  rayid <- rep(1:dimension, 2)

  rayGrob <- grid::polylineGrob(x = rayx,
                                y = rayy,
                                id = rayid,
                                # default.units = "native",
                                gp = grid::gpar(col = col.ray,
                                                lwd = lwd.ray,
                                                alpha = alpha,
                                                lineend = lineend))

  gpointsGrob <- grid::nullGrob()

  # Plot grid points
  if (draw.grid) {
    if (!is.null(grid.levels)) { # Check if grid points are to be plotted
      # Check if grid.levels is a list in appropriate format
      if (is.list(grid.levels) &
          all(unlist(lapply(grid.levels,
                            function(x) is.numeric(x) | is.integer(x))))) {
        # Check if z is present in corresponding grid.levels
        if (!all(mapply(function(a, b) a %in% b, z, grid.levels))) {
          warning('Mismatch in values "z" values and corresponding "grid.levels".\n',
                  'Unable to plot grid points.')
        } else {
          # plot points
          grid.levels <- mapply(function(a, b) b[b <= a], z, grid.levels)

          # gridx <- mapply(function(a, b) x + ((circle.size +
          #                                        (a * size)) * cos(b)),
          #                  grid.levels, angle)
          # gridy <- mapply(function(a, b) y + ((circle.size +
          #                                        (a * size)) * sin(b)),
          #                  grid.levels, angle)
          #
          # gridx <- unlist(gridx)
          # gridy <- unlist(gridy)

          gridx <- mapply(function(a, b)unit(x, "native")  +
                            unit((circle.size + (a * size)) * cos(b), "mm"),
                          grid.levels, angle)
          gridy <- mapply(function(a, b) unit(y, "native")  +
                            unit((circle.size + (a * size)) * sin(b), "mm"),
                          grid.levels, angle)

          gridx <- upgradeUnit.unit.list(gridx)
          gridy <- upgradeUnit.unit.list(gridy)

          if (is.na(col.points)) {
            if (length(col.ray == length(grid.levels))) {
              col.points <- mapply(function(a, b) rep(a, length(b)),
                                   col.ray, grid.levels)
              col.points <- unlist(col.points)
            } else {
              col.points <- col.ray
            }
          }

          gpointsGrob <- grid::pointsGrob(gridx, gridy,
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
    grid::grobTree(circGrob, rayGrob, gpointsGrob,
                   gp = grid::gpar(alpha = alpha, fill = fill,
                                   lineend = lineend))

  class(gridout) <- append(class(gridout), c("glyphGrob", "metroglyphGrob"))

  attr(gridout, "length") <- dimension

  return(gridout)

}
