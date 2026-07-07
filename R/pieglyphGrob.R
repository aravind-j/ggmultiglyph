#' Draw a Pie Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a circular pie or clock glyph
#' \insertCite{ward_visualization_2000,fuchs_evaluation_2013}{ggmultiglyph}.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the values to be plotted as dimensions
#'   of the pie glyph according to the arguments \code{scale.segment} or
#'   \code{scale.radius}.
#' @param size The size of glyphs (radius).
#' @param edges The number of edges of the polygon to depict the circular glyph
#'   outline.
#' @param col The line colour.
#' @param fill The fill colour.
#' @param lwd The line width.
#' @param alpha The alpha transparency value.
#' @param angle.start The start angle for the glyph in radians. Default is zero.
#' @param angle.stop The stop angle for the glyph in radians. Default is
#'   \eqn{2\pi}.
#' @param linejoin The line join style for the pie segment polygons. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#' @param scale.segment logical. If \code{TRUE}, the segments (pie slices) are
#'   scaled according to value of \code{z}.
#' @param scale.radius logical. If \code{TRUE}, the radius of segments (pie
#'   slices) are scaled according to value of \code{z}.
#' @param draw.grid logical. If \code{TRUE}, grid lines are plotted along the
#'   segments when \code{scale.radius = TRUE}. Default is \code{FALSE}.
#' @param grid.levels A list of grid levels (as vectors) corresponding to the
#'   values in \code{z} at which grid lines are to be plotted. The values in
#'   \code{z} should be present in the list specified.
#' @param lwd.grid The line width of the grid lines.
#' @param col.grid The colour of the grid lines.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @importFrom grid gpar polygonGrob nullGrob grobTree unit unit.c
#' @importFrom scales rescale
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_pieglyph}}
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
#' # Adjust radius and segment scaling
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, scale.radius = FALSE)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, scale.radius = FALSE,
#'                    angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, scale.segment = TRUE, scale.radius = FALSE,
#'                    angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 5)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 5,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                      z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                      angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 5,
#'                     scale.radius = FALSE)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.radius = FALSE)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 5,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 5,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 5,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 3)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 3,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.radius = FALSE)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 3,
#'                     scale.radius = FALSE)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5,
#'                     scale.radius = FALSE)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 3,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 3,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 15,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 3,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust angle
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     angle.start = 90 * (base::pi/180),
#'                     angle.stop = 270 * (base::pi/180))
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE)
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE,
#'                     angle.start = 90 * (base::pi/180),
#'                     angle.stop = 270 * (base::pi/180))
#'
#' pg7 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE)
#'
#' pg8 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi)
#'
#' pg9 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 90 * (base::pi/180),
#'                     angle.stop = 270 * (base::pi/180))
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, pg7, pg8, pg9,
#'              nrow = 3, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     angle.start = 0, angle.stop = base::pi,
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     angle.start = 90 * (base::pi/180),
#'                     angle.stop = 270 * (base::pi/180),
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE,
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg5 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi,
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg6 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.radius = FALSE,
#'                     angle.start = 90 * (base::pi/180),
#'                     angle.stop = 270 * (base::pi/180),
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg7 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg8 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 0, angle.stop = base::pi,
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg9 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33), size = 10,
#'                     scale.segment = TRUE, scale.radius = FALSE,
#'                     angle.start = 90 * (base::pi/180),
#'                     angle.stop = 270 * (base::pi/180),
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(pg1, pg2, pg3, pg4, pg5, pg6, pg7, pg8, pg9,
#'              nrow = 3, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line join style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5)
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5, linejoin = "round")
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                     size = 15, lwd = 5, linejoin = "bevel")
#'
#' grid.arrange(pg1, pg2, pg3, nrow = 1, ncol = 3)
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
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col.grid = "black")
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     angle.start = 0, angle.stop = base::pi,
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col.grid = "black")
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     scale.segment = TRUE,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col.grid = "black")
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     angle.start = 0, angle.stop = base::pi,
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     scale.segment = TRUE,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col.grid = "black")
#'
#' grid.arrange(pg1, pg2, pg3, pg4, nrow = 2, ncol = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust grid level colours
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Grid levels
#' gl <- split(x = c(rep(c(1, 2, 3), 4),
#'                   rep(c(1, 2, 3, 4), 2)),
#'             f = c(rep(1:4, each = 3),
#'                   rep(5:6, each = 4)))
#' gl
#'
#' pg1 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col = "white", col.grid = "white",
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg2 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     angle.start = 0, angle.stop = base::pi,
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col = "white", col.grid = "white",
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg3 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     scale.segment = TRUE,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col = "white", col.grid = "white",
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' pg4 <- pieglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     angle.start = 0, angle.stop = base::pi,
#'                     z = c(1, 3, 2, 1, 2, 3), size = 5,
#'                     scale.segment = TRUE,
#'                     draw.grid = TRUE, grid.levels = gl,
#'                     lwd = 2, col = "white", col.grid = "white",
#'                     fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(pg1, pg2, pg3, pg4, nrow = 2, ncol = 2)
#'
pieglyphGrob <- function(x = .5, y = .5, z,
                         size = 1, edges = 200,
                         col = "black",
                         fill = NA,
                         lwd = 1,
                         alpha = 1,
                         angle.start = 0,
                         angle.stop = 2 * base::pi,
                         linejoin = c("mitre", "round", "bevel"),
                         scale.segment = FALSE,
                         scale.radius = TRUE,
                         grid.levels = NULL,
                         draw.grid = FALSE,
                         col.grid = "grey",
                         lwd.grid = lwd) {

  linejoin <- match.arg(linejoin)

  # grid::grid.points(x = x, y = y, pch =  20)

  drawgridlines <- FALSE

  # Checks for grid lines
  drawgridlines <- FALSE

  if (draw.grid) {
    if (scale.radius ) {
      if (!is.null(grid.levels)) { # Check if grid lines are to be plotted
        # Check if grid.levels is a list in appropriate format
        if (is.list(grid.levels) &
            all(unlist( lapply(grid.levels,
                               function(x) is.numeric(x) | is.integer(x))))) {
          # Check if z is present in corresponding grid.levels
          if (!all(mapply(function(a, b) a %in% b, z, grid.levels))) {
            warning('Mismatch in values "z" values and corresponding "grid.levels".\n',
                    'Unable to plot grid lines.')
          } else {
            drawgridlines <- TRUE
          }

        } else {
          warning('Non-standard format specified as "grid.levels".\n',
                  'Unable to plot grid lines.')
        }

      } else {
        warning('"grid.levels" not specified.\n',
                'Unable to plot grid lines.')
      }

    } else {
      warning('"scale.radius" is FALSE.\n',
              'Unable to plot grid lines.')
    }

  }

  # Get polygon points
  dimension <- length(z)
  # angle <- seq(angle.start, 2*base::pi, length.out = dimension + 1)[1:dimension]

  # Convert z to cumulative proportions
  if (scale.segment) {
    cumpropz <- c(0, cumsum(z) / sum(z))
  } else {
    # Convert z to cumulative proportions
    # cumpropz <- c(0, scales::rescale(1:dimension))
    cumpropz <- c(scales::rescale(0:dimension))
  }

  diffz <- diff(cumpropz)

  # segxylist <- vector("list", dimension)
  segarcx <- vector("list", dimension)
  segarcy <- vector("list", dimension)
  segarcid <- vector("list", dimension)

  if (drawgridlines) {
    # gridxylist <- vector("list", dimension)
    gridarcx <- vector("list", dimension)
    gridarcy <- vector("list", dimension)
    gridarcid <- vector("list", dimension)

    # grid.levels <- mapply(function(a, b) b[b <= a], z, grid.levels)
    # grid.levels <- mapply(function(a, b) setdiff(b, a), z, grid.levels)

    grid.levels <- mapply(function(a, b) b[b <= a],
                          z, grid.levels,
                          SIMPLIFY = FALSE)

    # grid.levels <- mapply(function(a, b) setdiff(b, a),
    #                       z, grid.levels,
    #                       SIMPLIFY = FALSE)
  }

  for (i in 1:dimension) {
    # No. of nodes for sector arc
    n <- max(2, floor(edges * diffz[i]))

    # Sector arc points
    arcp <- seq.int(cumpropz[i], cumpropz[i + 1], length.out = n)

    # Sector arc point radians
    # arcpr <- (angle.stop * arcp) + (angle.start * (pi / 180))
    arcpr <- angle.start + arcp * (angle.stop - angle.start)

    # Sector arc coordinates

    if (!scale.radius) {
      # segxylist[[i]] <-
      #   data.frame(arcx = c(x, x + (size * cos(arcpr))),
      #              arcy = c(y, y + (size * sin(arcpr))),
      #              arcid = i)
      segarcx[[i]] <- unit.c(unit(x, "native") + unit(0, "mm"),
                             unit(x, "native") +
                               unit(size * cos(arcpr), "mm"))
      segarcy[[i]] <- unit.c(unit(y, "native") + unit(0, "mm"),
                             unit(y, "native") +
                               unit(size * sin(arcpr), "mm"))
      segarcid[[i]]  <- rep(i, length(arcp) + 1)
    } else {
      # segxylist[[i]] <-
      #   data.frame(arcx = c(x, x + (z[i] * size * cos(arcpr))),
      #              arcy = c(y, y + (z[i] * size * sin(arcpr))),
      #              arcid = i)
      # segarcx[[i]] <- unit.c(unit(x, "native"),
      #                        unit(x, "native") +
      #                          unit(z[i] * size * cos(arcpr),
      #                               "mm"))
      # segarcy[[i]] <- unit.c(unit(y, "native"),
      #                        unit(y, "native") +
      #                          unit(z[i] * size * sin(arcpr),
      #                               "mm"))
      segarcx[[i]] <- unit.c(unit(x, "native") + unit(0, "mm"),
                             unit(x, "native") +
                               unit(z[i] * size * cos(arcpr),
                                    "mm"))
      segarcy[[i]] <- unit.c(unit(y, "native") + unit(0, "mm"),
                             unit(y, "native") +
                               unit(z[i] * size * sin(arcpr),
                                    "mm"))
      segarcid[[i]] <- rep(i, length(arcp) + 1)

      if (drawgridlines) {
        lvls_i <- grid.levels[[i]]
        if (length(lvls_i) == 0) {
          gridarcx[[i]] <- NULL
          gridarcy[[i]] <- NULL
          gridarcid[[i]] <- NULL
        } else {
          gridarcx[[i]] <-
            upgradeUnit.unit.list(
              lapply(lvls_i, function(b) {
                unit.c(unit(x, "native") +
                         unit(b * size * cos(arcpr), "mm"))
              }))
          gridarcy[[i]] <-
            upgradeUnit.unit.list(
              lapply(lvls_i, function(b) {
                unit.c(unit(y, "native") +
                         unit(b * size * sin(arcpr), "mm"))
              }))
          gridarcid[[i]] <-
            unlist(lapply(lvls_i, function(b)
              rep(paste(i, "_", b, sep = ""), length(arcp))))
        }
      }
    }
  }

  # segxy <- dplyr::bind_rows(segxylist)
  segarcx <- upgradeUnit.unit.list(segarcx)
  segarcy <- upgradeUnit.unit.list(segarcy)
  segarcid <- unlist(segarcid)
  # segarcid <- rep(1:dimension, each = length(arcp) +1)

  #NullGrobs
  circsegGrob <- grid::nullGrob()
  glinesGrob <- grid::nullGrob()

  circsegGrob <- grid::polygonGrob(x = segarcx,
                                   y = segarcy,
                                   id = segarcid,
                                   # x = segxy$arcx,
                                   # y = segxy$arcy,
                                   # id = segxy$arcid,
                                   # default.units = "native",
                                   gp = grid::gpar(col = col,
                                                   fill = fill,
                                                   lwd = lwd,
                                                   alpha = alpha,
                                                   linejoin = linejoin))

  if (drawgridlines) {
    # gridxy <- dplyr::bind_rows(lapply(gridxylist, dplyr::bind_rows))

    gridarcx <- gridarcx[!sapply(gridarcx, is.null)]
    gridarcy <- gridarcy[!sapply(gridarcy, is.null)]
    gridarcid <- gridarcid[!sapply(gridarcid, is.null)]

    gridarcx <- upgradeUnit.unit.list(gridarcx)
    gridarcy <- upgradeUnit.unit.list(gridarcy)
    gridarcid <- unlist(gridarcid)

    gridarcid <- as.numeric(as.factor(gridarcid))

    # gridxy$arcid <- as.numeric(as.factor(gridxy$arcid))

    glinesGrob <- grid::polylineGrob(x = gridarcx,
                                     y = gridarcy,
                                     id = gridarcid,
                                     # x = gridxy$arcx,
                                     # y = gridxy$arcy,
                                     # id = gridxy$arcid,
                                     # default.units = "native",
                                     gp = grid::gpar(col = col.grid,
                                                     lwd = lwd.grid,
                                                     lineend = "butt",
                                                     alpha = alpha))
  }

  gridout <- grid::grobTree(circsegGrob, glinesGrob,
                            gp = grid::gpar(lwd = lwd, alpha = alpha,
                                            fill = fill,
                                            linejoin = linejoin))

  class(gridout) <- append(class(gridout), c("glyphGrob", "pieglyphGrob"))

  attr(gridout, "length") <- dimension

  return(gridout)

}
