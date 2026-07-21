### This file is part of 'ggmultiglyph' package for R.

### Copyright (C) 2014-2026, ICAR-NBPGR.
#
# ggmultiglyph is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# ggmultiglyph is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  https://www.r-project.org/Licenses/

#' Draw a Dot Profile Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a dot profile glyph
#' \insertCite{chambers_graphical_1983,dutoit_graphical_1986}{ggmultiglyph}.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the values to be plotted as dimensions
#'   of the dot glyph (number of stacked dots).
#' @param radius The radius of the glyphs.
#' @param col The line colour.
#' @param fill The fill colour.
#' @param lwd The line width.
#' @param alpha The alpha transparency value.
#' @param mirror logical. If \code{TRUE}, mirror profile is plotted.
#' @param flip.axes logical. If \code{TRUE}, axes are flipped.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{grob}} object.
#'
#' @importFrom grid circleGrob gpar
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_dotglyph}}
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
#' # Mirror and flip.axes combination
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE)
#'
#' grid.arrange(dg1, dg2, nrow = 1)
#' grid.arrange(dg3, dg4, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust radius
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 0.5)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 3)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 0.5, mirror = TRUE)
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE)
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 3, mirror = TRUE)
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 0.5, flip.axes = TRUE)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 3, flip.axes = TRUE)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 0.5, mirror = TRUE,
#'                     flip.axes = TRUE)
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE)
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 3, mirror = TRUE,
#'                     flip.axes = TRUE)
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust dot line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, lwd = 3)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, lwd = 5)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE)
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, lwd = 3)
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, lwd = 5)
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, lwd = 3)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, lwd = 5)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE)
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, lwd = 3)
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, lwd = 5)
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust dot fill
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = "salmon")
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = "cyan")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = "green")
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, fill = "salmon")
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, fill = "cyan")
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, fill = "green")
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, fill = "salmon")
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, fill = "cyan")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, fill = "green")
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, fill = "salmon")
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, fill = "cyan")
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, fill = "green")
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust dot line colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, col = "salmon")
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, col = "cyan")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, col = "green")
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, col = "salmon")
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, col = "cyan")
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, col = "green")
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, col = "salmon")
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, col = "cyan")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, col = "green")
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, col = "salmon")
#'
#' dg5 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, col = "cyan")
#'
#' dg6 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, col = "green")
#'
#' grid.arrange(dg1, dg2, dg3, nrow = 1, ncol = 4)
#' grid.arrange(dg4, dg5, dg6, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate fill colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' clrs <- mapply(function(a, b) rep(a, b),
#'                RColorBrewer::brewer.pal(6, "Dark2"),
#'                round(c(4, 3.5, 2.7, 6.8, 3.4, 5.7)))
#' clrs <- unlist(clrs)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = clrs,
#'                     col = "black")
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = clrs,
#'                     col = "white")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, fill = clrs,
#'                     col = "black")
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE, fill = clrs,
#'                     col = "white")
#'
#' grid.arrange(dg1, dg2, nrow = 1)
#' grid.arrange(dg3, dg4, nrow = 1)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, fill = clrs,
#'                     col = "black")
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE, fill = clrs,
#'                     col = "white")
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, fill = clrs,
#'                     col = "black")
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE, fill = clrs,
#'                     col = "white")
#'
#' grid.arrange(dg1, dg2, nrow = 1)
#' grid.arrange(dg3, dg4, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate dot line colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = "black", lwd = 5,
#'                     col = clrs)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, fill = "white", lwd = 5,
#'                     col = clrs)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     fill = "black", lwd = 5,
#'                     col = clrs)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     fill = "white", lwd = 5,
#'                     col = clrs)
#'
#' grid.arrange(dg1, dg2, nrow = 1)
#' grid.arrange(dg3, dg4, nrow = 1)
#'
#' dg1 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE,
#'                     fill = "black", lwd = 5,
#'                     col = clrs)
#'
#' dg2 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, flip.axes = TRUE,
#'                     fill = "white", lwd = 5,
#'                     col = clrs)
#'
#' dg3 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE,
#'                     fill = "black", lwd = 5,
#'                     col = clrs)
#'
#' dg4 <- dotglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                     z = c(4, 3.5, 2.7, 6.8, 3.4, 5.7),
#'                     radius = 2, mirror = TRUE,
#'                     flip.axes = TRUE,
#'                     fill = "white", lwd = 5,
#'                     col = clrs)
#'
#' grid.arrange(dg1, dg2, nrow = 1)
#' grid.arrange(dg3, dg4, nrow = 1)
#'
dotglyphGrob <- function(x = .5, y = .5, z,
                         radius = 1,
                         col = "black",
                         fill = NA,
                         lwd = 1,
                         alpha = 1,
                         mirror = FALSE,
                         flip.axes = FALSE) {
  # z <- round(z)
  z <- ceiling(z)
  dimension <- length(z)

  # grid::grid.points(x = x, y = y, pch =  20)
  radius <- grid::unit(radius, "mm")
  lwd2 <- grid::convertUnit(unit(lwd, "points") / 4, "mm") # how does this work ?

  if (mirror) {
    stksq <- stackseq(z, radius + lwd2)
    stksq <- unit(stksq, "mm")
    stksq <- 2 * stksq
  } else {
    stksq <- ((radius + lwd2) * 2) *
      seq(-(dimension - 1) / 2,
          (dimension - 1) / 2,
          length.out = dimension)
  }

  if (!flip.axes) {
    xpos <- unit(x, "native") + stksq
    ypos <- rep(unit(y, "native"), dimension)

    circx <- Map(function(a, b) rep(a, b), xpos, z)
    circy <- lapply(z, function(c) {
      unit(y, "native") + (1:c * ((radius + lwd2) * 2)) - (radius + lwd2)
    })

    if (mirror) {
      circy <- Map(function(a, b) a - ((radius + lwd2) * b), circy, z)
    }

  } else {
    xpos <- rep(unit(x, "native"), dimension)
    ypos <- unit(y, "native") - stksq

    circy <- Map(function(a, b) rep(a, b), ypos, z)
    circx <- lapply(z, function(c) {
      unit(x, "native") + (1:c * ((radius + lwd2) * 2)) - (radius + lwd2)
    })

    if (mirror) {
      circx <- Map(function(a, b) a - ((radius + lwd2) * b), circx, z)
    }

  }

  circx <- do.call(grid::unit.c, circx)
  circy <- do.call(grid::unit.c, circy)

  # grid::grid.points(x = xpos, y = ypos, pch =  1)

  gridout <-
    grid::circleGrob(x = circx, y = circy, r = radius,
                     # default.units = "native",
                     gp = gpar(col = col,
                               fill = fill,
                               lwd = lwd,
                               alpha = alpha))

  class(gridout) <- append(class(gridout), c("glyphGrob", "dotglyphGrob"))

  attr(gridout, "length") <- dimension
  attr(gridout, "mirror") <- mirror
  attr(gridout, "flip.axes") <- flip.axes
  attr(gridout, "index") <- rep(seq_along(z), times = z)

  gridout
}


stackseq <- function(z, r) {

  zevn <- (z %% 2) == 0
  apthm <- (sqrt(3) / 2) * r

  sq <- vector("list", length(z))

  for (i in seq_along(z)) {
    if (i == 1) {
      sq[[i]] <- r + unit(0, "mm")
    } else {
      if (zevn[i] == zevn[i - 1]) {
        sq[[i]] <- sq[[i - 1]] + r
      } else {
        sq[[i]] <- sq[[i - 1]] + apthm
      }
    }
  }

  sq <- unlist(sq)
  sq <- sq - mean(sq)

  sq
}
