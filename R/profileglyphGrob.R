#' Draw a Profile Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a profile glyph
#' \insertCite{chambers_graphical_1983,dutoit_graphical_1986}{ggmultiglyph}.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the values to be plotted as dimensions
#'   of the profile (length of the bars).
#' @param size The size of glyphs.
#' @param col.bar The colour of bars.
#' @param col.line The colour of profile line(s).
#' @param fill The fill colour.
#' @param lwd.line The line width of the profile line(s)
#' @param lwd.bar The line width of the bars.
#' @param alpha The alpha transparency value.
#' @param width The width of the bars.
#' @param flip.axes logical. If \code{TRUE}, axes are flipped.
#' @param bar logical. If \code{TRUE}, profile bars are plotted.
#' @param line logical. If \code{TRUE}, profile line is plotted.
#' @param mirror logical. If \code{TRUE}, mirror profile is plotted.
#' @param linejoin The line join style for the profile line(s) and bars. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#' @param lineend The line end style for the whisker lines. Either
#'   \code{"round"}, \code{"butt"} or \code{"square"}.
#' @param draw.grid logical. If \code{TRUE}, grid lines are plotted along the
#'   bars. Default is \code{FALSE}.
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
#' @importFrom grid rectGrob polygonGrob polylineGrob nullGrob
#' @importFrom grid grobTree gpar unit.c
#'
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_profileglyph}}
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
#' # Profile bar, line, mirror and flip.axes combination
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE, mirror = FALSE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, , mirror = FALSE,
#'                    line = TRUE, bar = FALSE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, mirror = FALSE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE, flip.axes = TRUE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, flip.axes = TRUE)
#'
#' barglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, , mirror = FALSE, flip.axes = TRUE,
#'                    line = TRUE, bar = FALSE)
#'
#' barprofileglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, mirror = FALSE, flip.axes = TRUE)
#'
#' grid.arrange(barglyph1, profileglyph1, barprofileglyph1,
#'              barglyph2, profileglyph2, barprofileglyph2,
#'              nrow = 2, ncol = 3)
#' grid.arrange(barglyph3, profileglyph3, barprofileglyph3,
#'              barglyph4, profileglyph4, barprofileglyph4,
#'              nrow = 2, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = FALSE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = TRUE, bar = FALSE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE, bar = FALSE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = TRUE, bar = FALSE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = FALSE, mirror = FALSE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = TRUE,
#'                    bar = FALSE, mirror = FALSE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, mirror = FALSE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE, mirror = FALSE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE,
#'                    bar = FALSE, mirror = FALSE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, mirror = FALSE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE, mirror = FALSE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = TRUE,
#'                    bar = FALSE, mirror = FALSE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, mirror = FALSE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = FALSE, flip.axes = TRUE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, flip.axes = TRUE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, flip.axes = TRUE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE, flip.axes = TRUE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, flip.axes = TRUE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, line = TRUE,
#'                    bar = FALSE, mirror = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 5, mirror = FALSE, flip.axes = TRUE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE,
#'                    bar = FALSE, mirror = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, mirror = FALSE, flip.axes = TRUE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = TRUE,
#'                    bar = FALSE, mirror = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, mirror = FALSE, flip.axes = TRUE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = FALSE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = TRUE, bar = FALSE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = FALSE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = TRUE, bar = FALSE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = FALSE, mirror = FALSE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = TRUE,
#'                    bar = FALSE, mirror = FALSE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, mirror = FALSE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = FALSE, mirror = FALSE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = TRUE,
#'                    bar = FALSE, mirror = FALSE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, mirror = FALSE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE, mirror = FALSE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE,
#'                    bar = FALSE, mirror = FALSE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, mirror = FALSE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = FALSE, flip.axes = TRUE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, flip.axes = TRUE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, flip.axes = TRUE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE, flip.axes = TRUE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE,
#'                    flip.axes = TRUE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, flip.axes = TRUE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, line = TRUE,
#'                    bar = FALSE, mirror = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 1, mirror = FALSE, flip.axes = TRUE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, line = TRUE,
#'                    bar = FALSE, mirror = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, width = 3, mirror = FALSE, flip.axes = TRUE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE,
#'                    bar = FALSE, mirror = FALSE, flip.axes = TRUE)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, mirror = FALSE, flip.axes = TRUE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust bar and profile line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE,
#'                    lwd.bar= 3)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE,
#'                    lwd.line = 3)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, lwd.bar= 3, lwd.line = 3)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = FALSE,
#'                    lwd.bar= 5)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, line = TRUE, bar = FALSE,
#'                    lwd.line = 5)
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 10, lwd.bar= 5, lwd.line = 5)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3,
#'              profileglyph1, profileglyph2, profileglyph3,
#'              barprofileglyph1, barprofileglyph2, barprofileglyph3,
#'              nrow = 3, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust bar and line colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE,
#'                    col.bar = "cyan")
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE, bar = FALSE,
#'                    col.line = "green")
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15,
#'                    col.bar = "salmon", col.line = "salmon")
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE,
#'                    fill = "cyan")
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE, bar = FALSE,
#'                    fill = "green")
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15,
#'                    fill = "salmon")
#'
#' grid.arrange(barglyph1, barglyph2, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE,
#'                    mirror = FALSE, col.bar = "cyan")
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE, bar = FALSE,
#'                    mirror = FALSE, col.line = "green")
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15,
#'                    mirror = FALSE, col.bar = "salmon", col.line = "salmon")
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = FALSE,
#'                    mirror = FALSE, fill = "cyan")
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15, line = TRUE, bar = FALSE,
#'                    mirror = FALSE, fill = "green")
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 15,
#'                    mirror = FALSE, fill = "salmon")
#'
#' grid.arrange(barglyph1, barglyph2, nrow = 1)
#' grid.arrange(profileglyph1, profileglyph2, nrow = 1)
#' grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate bar fill colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE, mirror = FALSE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, mirror = FALSE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE, flip.axes = TRUE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, flip.axes = TRUE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, line = FALSE,
#'                    mirror = FALSE, flip.axes = TRUE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 20, mirror = FALSE, flip.axes = TRUE,
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(barglyph1, barprofileglyph1,
#'              barglyph2, barprofileglyph2,
#'              nrow = 2, ncol = 2)
#' grid.arrange(barglyph3, barprofileglyph3,
#'              barglyph4, barprofileglyph4,
#'              nrow = 2, ncol = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line join style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.bar = 10, width = 5,
#'                    line = FALSE)
#'
#' barglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.bar = 10, width = 5,
#'                    linejoin = "round", line = FALSE)
#'
#' barglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.bar = 10, width = 5,
#'                    linejoin = "bevel", line = FALSE)
#'
#' grid.arrange(barglyph1, barglyph2, barglyph3,
#'              nrow = 1, ncol = 3)
#'
#' profileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.line = 10, width = 5,
#'                    bar = FALSE)
#'
#' profileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.line = 10, width = 5,
#'                    linejoin = "round", bar = FALSE)
#'
#' profileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.line = 10, width = 5,
#'                    linejoin = "bevel", bar = FALSE)
#'
#' grid.arrange(profileglyph1, profileglyph2, profileglyph3,
#'              nrow = 1, ncol = 3)
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.bar = 10, width = 5)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.bar = 10, width = 5,
#'                    linejoin = "round")
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.bar = 10, width = 5,
#'                    linejoin = "bevel")
#'
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3,
#'              nrow = 1, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line end style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.line = 10, width = 5)
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.line = 10, width = 5,
#'                    lineend = "butt")
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33),
#'                    size = 25, lwd.line = 10, width = 5,
#'                    lineend = "square")
#'
#' grid.arrange(barprofileglyph1, barprofileglyph2, barprofileglyph3,
#'              nrow = 1, ncol = 3)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust grid levels
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Grid lines
#' gl <- split(x = rep(c(1, 2, 3), 6),
#'             f = rep(1:6, each = 3))
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5,
#'                    draw.grid = TRUE, lwd.bar = 5,
#'                    grid.levels = gl, col.grid = "black")
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5, lwd.bar = 5,
#'                    draw.grid = TRUE, mirror = FALSE,
#'                    grid.levels = gl, col.grid = "black")
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5, flip.axes = TRUE,
#'                    draw.grid = TRUE, lwd.bar = 5,
#'                    grid.levels = gl, col.grid = "black")
#'
#' barprofileglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5, flip.axes = TRUE,
#'                    draw.grid = TRUE, lwd.bar = 5, mirror = FALSE,
#'                    grid.levels = gl, col.grid = "black")
#'
#' grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)
#' grid.arrange(barprofileglyph3, barprofileglyph4, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust grid level colours
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Grid lines
#' gl <- split(x = rep(c(1, 2, 3), 6),
#'             f = rep(1:6, each = 3))
#'
#' barprofileglyph1 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5,
#'                    draw.grid = TRUE, lwd.bar = 5,
#'                    grid.levels = gl, line = FALSE,
#'                    col.grid = "white", col.bar = "white",
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph2 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5, lwd.bar = 5,
#'                    draw.grid = TRUE, mirror = FALSE,
#'                    grid.levels = gl, line = FALSE,
#'                    col.grid = "white", col.bar = "white",
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph3 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5, flip.axes = TRUE,
#'                    draw.grid = TRUE, lwd.bar = 5,
#'                    grid.levels = gl, line = FALSE,
#'                    col.grid = "white", col.bar = "white",
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' barprofileglyph4 <-
#'   profileglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                    z = c(1, 3, 2, 1, 2, 3),
#'                    size = 10, width = 5, flip.axes = TRUE,
#'                    draw.grid = TRUE, lwd.bar = 5, mirror = FALSE,
#'                    grid.levels = gl, line = FALSE,
#'                    col.grid = "white", col.bar = "white",
#'                    fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(barprofileglyph1, barprofileglyph2, nrow = 1)
#' grid.arrange(barprofileglyph3, barprofileglyph4, nrow = 1)
#'
profileglyphGrob <- function(x = .5, y = .5, z,
                             size = 1,
                             col.bar = "black",
                             col.line = "black",
                             fill = NA,
                             lwd.bar = 1,
                             lwd.line = 1,
                             alpha = 1,
                             width = 5,
                             flip.axes = FALSE,
                             bar = TRUE,
                             line = TRUE,
                             mirror = TRUE,
                             linejoin = c("mitre", "round", "bevel"),
                             lineend = c("round", "butt", "square"),
                             grid.levels = NULL,
                             draw.grid = FALSE,
                             col.grid = "grey",
                             lwd.grid = 1) {

  linejoin <- match.arg(linejoin)

  # grid::grid.rect(gp=gpar(col="gray"))
  # grid::grid.points(x = x, y = y, pch =  20)

  # Checks for grid lines
  drawgridlines <- FALSE
  if (draw.grid) {
    if (!is.null(grid.levels)) { # Check if grid lines are to be plotted
      # Check if grid.levels is a list in appropriate format
      if (is.list(grid.levels) &&
          all(vapply(grid.levels, is.numeric, logical(1)))) {
        # Check if z is present in corresponding grid.levels
        if (!all(mapply(function(a, b) a %in% b, z, grid.levels))) {
          warning('Mismatch in values "z" values and corresponding ',
                  '"grid.levels".\n',
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
  }

  # Empty grobs
  bargrob <- grid::nullGrob()
  blinegrob <- grid::nullGrob()
  glinesGrob <- grid::nullGrob()

  dimension <- length(z)

  width <- grid::unit(width, "mm")

  if (!flip.axes) {
    # Get bar central points
    xpos <- unit(x, "native") +
      (width * seq(-(dimension - 1) / 2, (dimension - 1) / 2,
                   length.out = dimension))

    ypos <- unit(y, "native") + unit(z * size, "mm")

    # Specify justification
    if (mirror) {
      barjust <- "center"
      # Line y points
      ypos1 <- unit(y, "native") - unit((z / 2) * size, "mm")
      ypos2 <- unit(y, "native") + unit((z / 2) * size, "mm")
    } else {
      barjust <- "bottom"
    }

    # Bar profile with/without line
    if (bar) {
      bargrob <- grid::rectGrob(x = xpos,
                                y = rep(unit(y, "native") + unit(0, "mm"),
                                        dimension),
                                width = width,
                                height = unit(z * size, "mm"),
                                # default.units = "native",
                                just = barjust,
                                gp = grid::gpar(lwd = lwd.bar, alpha = alpha,
                                                col = col.bar, fill = fill,
                                                linejoin = linejoin))
      if (line) {
        if (mirror) {
          blinegrob <- grid::polylineGrob(x = grid::unit.c(xpos, rev(xpos)),
                                          y = grid::unit.c(ypos1, rev(ypos2)),
                                          id = rep(1:2, each = dimension),
                                          # default.units = "native",
                                          gp = grid::gpar(lwd = lwd.line,
                                                          alpha = alpha,
                                                          col = col.line,
                                                          lineend = lineend,
                                                          linejoin = linejoin))
        } else {
          blinegrob <- grid::polylineGrob(x = xpos, y = ypos,
                                          # default.units = "native",
                                          gp = grid::gpar(lwd = lwd.line,
                                                          alpha = alpha,
                                                          col = col.line,
                                                          lineend = lineend,
                                                          linejoin = linejoin))
        }
      }

    }

    # Line porfile without bar
    if (!bar && line) {
      if (mirror) {
        blinegrob <- grid::polygonGrob(x = grid::unit.c(xpos, rev(xpos)),
                                       y = grid::unit.c(ypos1, rev(ypos2)),
                                       # default.units = "native",
                                       gp = grid::gpar(lwd = lwd.line,
                                                       alpha = alpha,
                                                       col = col.line,
                                                       lineend = lineend,
                                                       linejoin = linejoin))
      } else {
        blinegrob <-
          grid::polygonGrob(x = grid::unit.c(xpos[1],
                                             xpos,
                                             xpos[dimension]),
                            y = grid::unit.c(unit(y, "native") + unit(0, "mm"),
                                             ypos,
                                             unit(y, "native") + unit(0, "mm")),
                            # default.units = "native",
                            gp = grid::gpar(lwd = lwd.line,
                                            alpha = alpha,
                                            col = col.line,
                                            lineend = lineend,
                                            linejoin = linejoin))
      }
    }

    # grid::grid.points(x= xpos, y = rep(y, dimension),
    #                   default.units = "native")
    # grid::grid.points(x= xpos, y = rep(unit(y, "native"), dimension),
    #                   default.units = "native")

    if (drawgridlines) {
      # plot grid lines
      grid.levels <- mapply(function(a, b) b[b <= a], z, grid.levels,
                            SIMPLIFY = FALSE)

      if (mirror) {
        gridy <- mapply(function(a, b) a - unit(b * size, "mm"),
                        ypos2, grid.levels, SIMPLIFY = FALSE)
        # gridy <- mapply(function(a, b) setdiff(b, a), ypos1, gridy)
      } else {
        gridy <- lapply(grid.levels, function(a) unit(y, "native") +
                          unit(a * size, "mm"))
        # gridy <- mapply(function(a, b) setdiff(b, a), y - (z * size), gridy)
      }

      gridx <- mapply(function(a, b) rep(a, length(b)), xpos, gridy,
                      SIMPLIFY = FALSE)

      gridx <- upgradeUnit.unit.list(gridx)
      gridy <- upgradeUnit.unit.list(gridy)

      if (is.na(col.grid)) {
        if (length(col.bar == length(grid.levels))) {
          col.grid <- mapply(function(a, b) rep(a, length(b)),
                             col.bar, grid.levels, SIMPLIFY = FALSE)
          col.grid <- unlist(col.grid)
        } else {
          col.grid <- col.bar
        }
      }

      # grid.draw(pointsGrob(gridx, gridy, pch = 3))

      gridxstrt <- gridx - (width / 2)
      gridxstp <- gridx + (width / 2)

      # grid::grid.points(c(gridxstrt, gridxstp), rep(gridy, 2), pch = 20)

      glinesGrob <- grid::polylineGrob(x = grid::unit.c(gridxstrt, gridxstp),
                                       y = rep(gridy, 2),
                                       id = rep(seq_along(gridx), 2),
                                       # default.units = "native",
                                       gp = gpar(col = col.grid,
                                                 lwd = lwd.grid,
                                                 lineend = "butt",
                                                 alpha = alpha))
    }

    #---------------------------------------------------------------------------


  } else {
    # Get bar central points
    xpos <- unit(x, "native") + unit(z * size, "mm")
    ypos <- unit(y, "native") +
      (width * seq(-(dimension - 1) / 2, (dimension - 1) / 2,
                   length.out = dimension))

    # Specify justification
    if (mirror) {
      barjust <- "center"
      barjusth <- NULL
      # Line x points
      xpos1 <- unit(x, "native") - unit((z / 2) * size, "mm")
      xpos2 <- unit(x, "native") + unit((z / 2) * size, "mm")
    } else {
      barjust <- "center"
      barjusth <- 0
    }

    # Bar profile with/without line
    if (bar) {
      bargrob <- grid::rectGrob(x = rep(unit(x, "native") + unit(0, "mm"),
                                        dimension),
                                y = ypos,
                                width = unit(z * size, "mm"),
                                height = width,
                                # default.units = "native",
                                just = barjust,
                                hjust = barjusth,
                                gp = grid::gpar(lwd = lwd.bar, alpha = alpha,
                                                col = col.bar, fill = fill,
                                                linejoin = linejoin))
      if (line) {
        if (mirror) {
          blinegrob <- grid::polylineGrob(x = grid::unit.c(xpos1, rev(xpos2)),
                                          y = grid::unit.c(ypos, rev(ypos)),
                                          id = rep(1:2, each = dimension),
                                          # default.units = "native",
                                          gp = grid::gpar(lwd = lwd.line,
                                                          alpha = alpha,
                                                          col = col.line,
                                                          lineend = lineend,
                                                          linejoin = linejoin))
        } else {
          blinegrob <- grid::polylineGrob(x = xpos, y = ypos,
                                          # default.units = "native",
                                          gp = grid::gpar(lwd = lwd.line,
                                                          alpha = alpha,
                                                          col = col.line,
                                                          lineend = lineend,
                                                          linejoin = linejoin))
        }
      }

    }

    # Line porfile without bar
    if (!bar && line) {
      if (mirror) {
        blinegrob <- grid::polygonGrob(x = grid::unit.c(xpos1, rev(xpos2)),
                                       y = grid::unit.c(ypos, rev(ypos)),
                                       # default.units = "native",
                                       gp = grid::gpar(lwd = lwd.line,
                                                       alpha = alpha,
                                                       col = col.line,
                                                       lineend = lineend,
                                                       linejoin = linejoin))
      } else {
        blinegrob <-
          grid::polygonGrob(x = grid::unit.c(unit(x, "native") + unit(0, "mm"),
                                             xpos,
                                             unit(x, "native") + unit(0, "mm")),
                            y = grid::unit.c(ypos[1],
                                             ypos,
                                             ypos[dimension]),
                            default.units = "native",
                            gp = grid::gpar(lwd = lwd.line,
                                            alpha = alpha,
                                            col = col.line,
                                            lineend = lineend,
                                            linejoin = linejoin))
      }
    }

    # grid::grid.points(x= rep(y, dimension), y = ypos,
    #                   default.units = "native")

    if (drawgridlines) {
      # plot grid lines
      grid.levels <- mapply(function(a, b) b[b <= a], z, grid.levels,
                            SIMPLIFY = FALSE)

      if (mirror) {
        gridx <- mapply(function(a, b) a - unit(b * size, "mm"),
                        xpos2, grid.levels,
                        SIMPLIFY = FALSE)
        # gridx <- mapply(function(a, b) a - (b * size), xpos2, grid.levels)
      } else {
        gridx <- lapply(grid.levels, function(a) unit(x, "native") +
                          unit(a * size, "mm"))
        # gridx <- mapply(function(a, b) setdiff(b, a), x + (z * size), gridx)
      }

      gridy <- mapply(function(a, b) rep(a, length(b)), ypos, gridx,
                      SIMPLIFY = FALSE)

      gridx <- upgradeUnit.unit.list(gridx)
      gridy <- upgradeUnit.unit.list(gridy)

      if (is.na(col.grid)) {
        if (length(col.bar == length(grid.levels))) {
          col.grid <- mapply(function(a, b) rep(a, length(b)),
                             col.bar, grid.levels,
                             SIMPLIFY = FALSE)
          col.grid <- unlist(col.grid)
        } else {
          col.grid <- col.bar
        }
      }

      # grid.draw(pointsGrob(gridx, gridy, pch = 3))

      gridystrt <- gridy - (width / 2)
      gridystp <- gridy + (width / 2)

      # grid::grid.points(rep(gridx, 2), c(gridystrt, gridystp), pch = 20)

      glinesGrob <- grid::polylineGrob(x = rep(gridx, 2),
                                       y = grid::unit.c(gridystrt, gridystp),
                                       id = rep(seq_along(gridy), 2),
                                       # default.units = "native",
                                       gp = gpar(col = col.grid,
                                                 lwd = lwd.grid,
                                                 lineend = "butt",
                                                 alpha = alpha))
    }

  }

  gridout <- grid::grobTree(bargrob, blinegrob, glinesGrob,
                            gp = grid::gpar(alpha = alpha,
                                            fill = fill,
                                            linejoin = linejoin))

  class(gridout) <- append(class(gridout), c("glyphGrob", "profileglyphGrob"))

  attr(gridout, "length") <- dimension
  attr(gridout, "mirror") <- mirror
  attr(gridout, "flip.axes") <- flip.axes

  gridout

}
