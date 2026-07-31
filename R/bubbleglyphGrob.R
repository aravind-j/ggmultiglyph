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

#' Draw a Bubble Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a bubble glyph.
#'
#' The following layouts are available.
#' \describe{
#'   \item{\code{"circle"}}{Bubbles are arranged around the circumference of an
#'   invisible circle, evenly spaced by angle between \code{angle.start} and
#'   \code{angle.stop}. The radius of this invisible circle is derived from the
#'   bubble radii (the largest bubble radius plus the mean bubble radius, with
#'   a small buffer added) so that bubbles do not overlap regardless of their
#'   individual sizes. This is the default layout.}
#'   \item{\code{"line"}}{Bubbles are arranged side by side along a straight
#'   line passing through the glyph centre, each bubble touching its
#'   neighbours. The line may be rotated to any orientation using the
#'   \code{line.angle} argument (in radians).}
#'   \item{\code{"chain"}}{Bubbles are linked together in a meandering, tangent
#'   chain, with each new bubble placed so that it touches both of the two
#'   preceding bubbles while avoiding overlap with any bubble placed earlier in
#'   the chain. Successive bubbles alternate to either side of the chain,
#'   producing a compact, organic, non-linear arrangement.}
#'   \item{\code{"hub"}}{One bubble (the one with the largest radius) is
#'   treated as a central "hub", and all other bubbles are placed around it,
#'   each touching the hub bubble, at angles spaced between \code{angle.start}
#'   and \code{angle.stop}. This is a quick, deterministic layout: because the
#'   surrounding bubbles are not tested against one another for overlap,
#'   bubbles can overlap when several of them are large relative to the hub.}
#'   \item{\code{"pack"}}{Bubbles are arranged using a circle-packing algorithm
#'   (\code{\link[packcircles]{circleProgressiveLayout}}), which places bubbles
#'   as close together as possible without any overlap. This produces the most
#'   compact, space-efficient arrangement of the available layouts, at the cost
#'   of the arrangement having no inherent order or direction (bubbles are not
#'   ordered along an axis or around a hub).}
#'   \item{\code{"annulus"}}{Bubbles are arranged, in the order supplied,
#'   around the circumference of a ring (annulus), with each bubble touching
#'   its immediate neighbours on either side (the last bubble touching the
#'   first, closing the ring). The radius of the ring is solved numerically so
#'   that all adjacent bubbles are mutually tangent.}
#' }
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the radius/area of bubbles.
#' @param size The size of bubbles.
#' @param scale.radius logical. If \code{TRUE}, the values in \code{z} are used
#'   directly as the bubble radii. If \code{FALSE}, values in \code{z} are
#'   treated as bubble areas, and radii are derived as \eqn{\sqrt{z}}, so that
#'   bubble area (rather than radius) is proportional to \code{z}.
#' @param layout The layout algorithm used to position the bubbles. One of
#'   \code{"circle"}, \code{"line"}, \code{"chain"}, \code{"hub"}, \code{"pack"}
#'   or \code{"annulus"}.
#' @param connector The style used to connect bubbles to one another. One of
#'   \code{"none"} (no connectors are drawn), \code{"foreground"} (connectors
#'   are drawn on top of the bubbles) or \code{"background"} (connectors are
#'   drawn underneath the bubbles).
#' @param line.angle The angle (in radians) at which bubbles are arranged when
#'   \code{layout = "line"}.
#' @param col The bubble outline colour.
#' @param fill The bubble fill colour.
#' @param lwd.connector The line width of the connectors.
#' @param col.connector The colour of the connectors.
#' @param lwd The bubble outline line width.
#' @param linejoin The line join style for the tile polygon. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#' @param alpha The alpha transparency value.
#' @param angle.start The start angle for the bubbles in radians for
#'   \code{layout = "circle"} and \code{layout = "hub"}. Default is zero.
#' @param angle.stop The stop angle for the bubbles in radians for \code{layout
#'   = "circle"} and \code{layout = "hub"}. Default is \eqn{2\pi}.
#' @param draw.grid logical. If \code{TRUE}, grid levels are plotted as nested
#'   circles within each bubble. Default is \code{FALSE}.
#' @param grid.levels A list of grid levels (as vectors) corresponding to the
#'   values in \code{z} at which the nested circles are to be plotted. The
#'   values in \code{z} should be present in the list specified.
#' @param col.grid The colour of the grid circles.
#' @param lwd.grid The line width of the grid circles.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @importFrom grid circleGrob polylineGrob polygonGrob segmentsGrob grobTree
#' @importFrom grid gpar nullGrob unit unit.c
#' @importFrom packcircles circleProgressiveLayout
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_bubbleglyph}},
#'   \code{\link[packcircles]{circleProgressiveLayout}}
#'
#'
#' @examples
#'
#' library(ggmultiglyph)
#' llibrary(grid)
#' llibrary(gridExtra)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust layout algorithm
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "line")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "chain")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "hub")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "annulus")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "pack")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Add connectors to layout algorithms
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "line")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "chain")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "annulus")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "pack")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust connector layer position
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "circle", fill = "gray80")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle", fill = "gray80")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "background",
#'                        layout = "circle", fill = "gray80")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "hub", fill = "gray80")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub", fill = "gray80")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "background",
#'                        layout = "hub", fill = "gray80")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "circle", lwd = 3)
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        layout = "circle", lwd = 5)
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle", lwd.connector = 3)
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle", lwd.connector = 5)
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line join style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "chain",
#'                        lwd.connector = 10)
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "chain",
#'                        lwd.connector = 10, linejoin = "bevel")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "chain",
#'                        lwd.connector = 10, linejoin = "round")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub",
#'                        lwd.connector = 10)
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub",
#'                        lwd.connector = 10, linejoin = "bevel")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub",
#'                        lwd.connector = 10, linejoin = "round")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust angle for circle and hub layouts
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle",
#'                        angle.start = 2 * base::pi, angle.stop = 0)
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "circle",
#'                        angle.start = 90 * (base::pi/180),
#'                        angle.stop = 450 * (base::pi/180))
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub",
#'                        angle.start = 2 * base::pi, angle.stop = 0)
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "hub",
#'                        angle.start = 90 * (base::pi/180),
#'                        angle.stop = 450 * (base::pi/180))
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust angle for line layout
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "line")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "line", line.angle = base::pi/4)
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        layout = "line", line.angle = base::pi/2)
#'
#' grid.arrange(bg1, bg2, bg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, fill = "salmon",
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, fill = "cyan",
#'                        layout = "circle")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, fill = "green",
#'                        layout = "circle")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, fill = "salmon",
#'                        layout = "line")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, fill = "cyan",
#'                        layout = "line")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, fill = "green",
#'                        layout = "line")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, col = "salmon", lwd = 3,
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, col = "cyan", lwd = 3,
#'                        layout = "circle")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, col = "green", lwd = 3,
#'                        layout = "circle")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, col = "salmon", lwd = 3,
#'                        layout = "line")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, col = "cyan", lwd = 3,
#'                        layout = "line")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, col = "green", lwd = 3,
#'                        layout = "line")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust connector colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        col.connector = "salmon", lwd.connector = 3,
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        col.connector = "cyan", lwd.connector = 3,
#'                        layout = "circle")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        col.connector = "green", lwd.connector = 3,
#'                        layout = "circle")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        col.connector = "salmon", lwd.connector = 3,
#'                        layout = "annulus")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        col.connector = "cyan", lwd.connector = 3,
#'                        layout = "annulus")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, connector = "foreground",
#'                        col.connector = "green", lwd.connector = 3,
#'                        layout = "annulus")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate bubble fill and colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "line")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "chain")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "hub")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "annulus")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "pack")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, lwd = 3,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "circle")
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, lwd = 3,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "line")
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, lwd = 3,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "chain")
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, lwd = 3,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "hub")
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, lwd = 3,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "annulus")
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 5, lwd = 3,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"),
#'                        layout = "pack")
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust grid levels
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' gl <- split(x = c(rep(c(1, 2, 3), 4),
#'                   rep(c(1, 2, 3, 4), 2)),
#'             f = c(rep(1:4, each = 3),
#'                   rep(5:6, each = 4)))
#'
#' gl
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "circle",
#'                        draw.grid = TRUE, grid.levels = gl)
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "line",
#'                        draw.grid = TRUE, grid.levels = gl)
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "chain",
#'                        draw.grid = TRUE, grid.levels = gl)
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "hub",
#'                        draw.grid = TRUE, grid.levels = gl)
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "annulus",
#'                        draw.grid = TRUE, grid.levels = gl)
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "pack",
#'                        draw.grid = TRUE, grid.levels = gl)
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust grid level colours
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' gl <- split(x = c(rep(c(1, 2, 3), 4),
#'                   rep(c(1, 2, 3, 4), 2)),
#'             f = c(rep(1:4, each = 3),
#'                   rep(5:6, each = 4)))
#'
#' gl
#'
#' bg1 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "circle",
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' bg2 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "line",
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' bg3 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "chain",
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' bg4 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "hub",
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' bg5 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "annulus",
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' bg6 <- bubbleglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 1,
#'                        layout = "pack",
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(bg1, bg2, bg3, bg4, bg5, bg6, nrow = 2)
#'
bubbleglyphGrob <- function(x = .5,
                            y = .5,
                            z,
                            size = 1,
                            scale.radius = TRUE,
                            # scale.area = TRUE,
                            layout = c("circle",
                                       "line",
                                       "chain",
                                       "hub",
                                       "pack",
                                       "annulus"),
                            connector = c("none", "foreground", "background"),
                            line.angle = 0,
                            angle.start = 0,
                            angle.stop = 2 * base::pi,
                            col = "black",
                            fill = NA,
                            alpha = 1,
                            lwd.connector = 1,
                            col.connector = "black",
                            lwd = 1,
                            linejoin = c("mitre", "round", "bevel"),
                            draw.grid = FALSE,
                            grid.levels = NULL,
                            col.grid = "grey",
                            lwd.grid = lwd) {

  layout  <- match.arg(layout)
  connector  <- match.arg(connector)

  dimension <- length(z)

  ## Convert data values to radii
  r <- if (scale.radius) {
    z
  } else {
    sqrt(z) # scale.area
  }

  ## Apply overall glyph scaling
  r <- size * r

  n <- dimension

  ## Compute circle centres (same units as radii: mm)
  centres <- switch(layout,
                    circle = layoutCircle(r, angle.start = angle.start,
                                          angle.stop = angle.stop),
                    line = layoutLine(r, angle = line.angle),
                    chain = layoutChain(r),
                    hub = layoutHub(r, angle.start = angle.start,
                                    angle.stop = angle.stop),
                    annulus = layoutAnnulus(r),
                    pack = layoutPack(r))

  circlesGrob <-
    grid::circleGrob(x = grid::unit(x, "native") + grid::unit(centres$x, "mm"),
                     y = grid::unit(y, "native") + grid::unit(centres$y, "mm"),
                     r = grid::unit(r, "mm"),
                     gp = grid::gpar(col = col,
                                     fill = fill,
                                     alpha = alpha,
                                     lwd = lwd))

  gridGrob <- grid::nullGrob()

  # Plot grid levels as nested circles
  if (draw.grid) {
    if (!is.null(grid.levels)) { # Check if grid levels are to be plotted
      # Check if grid.levels is a list in appropriate format
      if (is.list(grid.levels) &&
          all(vapply(grid.levels, is.numeric, logical(1)))) {

        # Check if z is present in corresponding grid.levels
        if (!all(mapply(function(a, b) a %in% b, z, grid.levels))) {
          warning('Mismatch in values "z" values and corresponding ',
                  '"grid.levels".\n',
                  'Unable to plot grid levels.')
        } else {

          # Keep only levels at or below the current bubble value
          grid.levels <- mapply(function(a, b) b[b <= a], z, grid.levels,
                                SIMPLIFY = FALSE)

          # Convert grid levels to radii using the same scaling as the bubbles
          gridr <- lapply(grid.levels, function(lv) {
            if (scale.radius) {
              lv
            } else {
              sqrt(lv) # scale.area
            }
          })
          gridr <- lapply(gridr, function(rv) size * rv)

          # Repeat each bubble's centre for every one of its grid levels
          gridcx <- mapply(function(cx, rv) rep(cx, length(rv)),
                           centres$x, gridr, SIMPLIFY = FALSE)
          gridcy <- mapply(function(cy, rv) rep(cy, length(rv)),
                           centres$y, gridr, SIMPLIFY = FALSE)

          gridcx <- unlist(gridcx)
          gridcy <- unlist(gridcy)
          gridr <- unlist(gridr)

          gridGrob <-
            grid::circleGrob(x = grid::unit(x, "native") +
                               grid::unit(gridcx, "mm"),
                             y = grid::unit(y, "native") +
                               grid::unit(gridcy, "mm"),
                             r = grid::unit(gridr, "mm"),
                             gp = grid::gpar(col = col.grid,
                                             fill = NA,
                                             lwd = lwd.grid,
                                             alpha = alpha,
                                             linejoin = linejoin))
        }

      } else {
        warning('Non-standard format specified as "grid.levels".\n',
                'Unable to plot grid levels.')
      }

    } else {
      warning('"grid.levels" not specified.\n',
              'Unable to plot grid levels.')
    }
  }

  connectGrob  <- grid::nullGrob()

  if (connector != "none") {

    connectGrob <-
      switch(layout,

             circle = {
               R <- max(r) + mean(r)
               R <- R + (0.1 * R)

               grid::circleGrob(x = grid::unit(x, "native"),
                                y = grid::unit(y, "native"),
                                r = unit(R , "mm"),
                                gp = gpar(fill = NA,
                                          alpha = alpha,
                                          lwd = lwd.connector,
                                          col = col.connector,
                                          linejoin = linejoin))
             },

             line =
               grid::polylineGrob(x = unit(x, "native") +
                                    unit(centres$x, "mm"),
                                  y = unit(y, "native") +
                                    unit(centres$y, "mm"),
                                  gp = gpar(alpha = alpha,
                                            lwd = lwd.connector,
                                            col = col.connector,
                                            linejoin = linejoin)),

             chain =
               grid::polylineGrob(x = unit(x, "native") +
                                    unit(centres$x, "mm"),
                                  y = unit(y, "native") +
                                    unit(centres$y, "mm"),
                                  gp = gpar(alpha = alpha,
                                            lwd = lwd.connector,
                                            col = col.connector,
                                            linejoin = linejoin)),

             hub = {
               # largest circle
               hub <- which.max(r)

               hubSpokesGrob <-
                 grid::segmentsGrob(x0 = unit(x,"native") +
                                unit(centres$x[hub],"mm"),
                              y0 = unit(y,"native") +
                                unit(centres$y[hub],"mm"),
                              x1 = unit(x,"native") +
                                unit(centres$x[-hub],"mm"),
                              y1 = unit(y,"native") +
                                unit(centres$y[-hub],"mm"))

               # Outer polygon
               ord <- order(atan2(centres$y-centres$y[hub],
                                  centres$x-centres$x[hub]))
               ord <- ord[ord != hub]

               hubPolygonGrob <-
                 polygonGrob(x = unit(x,"native") +
                               unit(centres$x[ord],"mm"),
                             y = unit(y,"native") +
                               unit(centres$y[ord],"mm"),
                             gp = gpar(fill = NA))

               grobTree(hubSpokesGrob, hubPolygonGrob,
                        gp = gpar(alpha = alpha,
                                  lwd = lwd.connector,
                                  col = col.connector,
                                  linejoin = linejoin))
             },

             annulus = {
               polygonGrob(x = unit(x, "native") +
                             unit(centres$x, "mm"),
                           y = unit(y, "native") +
                             unit(centres$y, "mm"),
                           gp = gpar(fill = NA,
                                     alpha = alpha,
                                     lwd = lwd.connector,
                                     col = col.connector,
                                     linejoin = linejoin))
             },

             pack = {
               # Get adjacent/touching circles
               D <- as.matrix(dist(cbind(centres$x, centres$y)))
               tol <- sqrt(.Machine$double.eps)
               A <- abs(D - outer(r,r,"+")) < tol
               diag(A) <- FALSE
               idx <- which(A & upper.tri(A), arr.ind=TRUE)

               x0 <- centres$x[idx[, 1]]
               y0 <- centres$y[idx[, 1]]

               x1 <- centres$x[idx[, 2]]
               y1 <- centres$y[idx[, 2]]

               segmentsGrob(x0 = grid::unit(x, "native") +
                              grid::unit(x0, "mm"),
                            y0 = grid::unit(x, "native") +
                              grid::unit(y0, "mm"),
                            x1 = grid::unit(x, "native") +
                              grid::unit(x1, "mm"),
                            y1 = grid::unit(x, "native") +
                              grid::unit(y1, "mm"),
                            gp = gpar(alpha = alpha,
                                       lwd = lwd.connector,
                                       col = col.connector))
             }
      )
  }

  gridout <-
    switch(connector,
           none = grid::grobTree(circlesGrob, gridGrob),
           foreground = grid::grobTree(circlesGrob, gridGrob, connectGrob),
           background = grid::grobTree(connectGrob, circlesGrob, gridGrob))

  class(gridout) <-
    append(class(gridout), c("glyphGrob", "bubbleglyphGrob"))

  attr(gridout, "length") <- dimension
  attr(gridout, "layout") <- layout

  gridout
}



# Circle Layout ----
layoutCircle <- function(r, angle.start = 0, angle.stop = 2 * base::pi){

  n <- length(r)

  theta <- seq(angle.start, angle.stop, length.out = n + 1)[-(n + 1)]

  R <- max(r) + mean(r)
  R <- R + (0.1 * R) # Add a 10% buffer

  data.frame(x = R * cos(theta), y = R * sin(theta))

}

# Linear Layout ----
layoutLine <- function(r, angle = 0){

  x <- numeric(length(r))

  for(i in 2:length(r))
    x[i] <- x[i-1] + r[i-1] + r[i]

  x <- x - mean(x)

  # rotate line
  theta <- angle

  data.frame(x = x * cos(theta), y = x * sin(theta))
}

# Chain Layout ----
layoutChain <- function(r){

  n <- length(r)

  if(n == 1) {
    return(data.frame(x = 0, y = 0))
  }

  if(n == 2){
    d <- r[1] + r[2]

    return(data.frame(x = c(-d/2, d/2), y = c(0, 0)))
  }

  x <- numeric(n)
  y <- numeric(n)

  ## First two circles
  x[2] <- r[1] + r[2]

  ## Alternate side
  side <- 1
  tol <- 1e-8

  for(i in 3:n){

    x1 <- x[i-2]
    y1 <- y[i-2]

    x2 <- x[i-1]
    y2 <- y[i-1]

    R1 <- r[i-2] + r[i]
    R2 <- r[i-1] + r[i]

    dx <- x2 - x1
    dy <- y2 - y1

    d <- sqrt(dx^2 + dy^2)

    ## Degenerate case (shouldn't happen)
    if(d < tol) {
      stop("Coincident centres.")
    }

    ex <- dx / d
    ey <- dy / d

    ## Distance from first centre to chord
    a <- (R1^2 - R2^2 + d^2) / (2*d)

    h2 <- R1^2 - a^2
    h <- sqrt(max(h2, 0))

    xm <- x1 + a*ex
    ym <- y1 + a*ey

    ## Two candidate centres
    cand1 <- c(xm - side*h*ey, ym + side*h*ex)
    cand2 <- c(xm + side*h*ey, ym - side*h*ex)

    candidates <- rbind(cand1, cand2)

    placed <- FALSE

    for(k in 1:2){
      xi <- candidates[k,1]
      yi <- candidates[k,2]

      ok <- TRUE

      if(i > 3){
        for(j in seq_len(i-3)){
          dij <- sqrt((xi-x[j])^2 + (yi-y[j])^2)

          if(dij < r[i] + r[j] - tol){

            ok <- FALSE
            break
          }
        }
      }

      if(ok){
        x[i] <- xi
        y[i] <- yi
        placed <- TRUE
        break
      }
    }

    if(!placed){

      ## Fall back to first candidate
      x[i] <- cand1[1]
      y[i] <- cand1[2]

    }
    side <- -side
  }

  ## Centre layout
  x <- x - mean(range(x))
  y <- y - mean(range(y))

  data.frame(x = x, y = y)
}

# Hub Layout ---
# quick deterministic layout -  can have overlaps
layoutHub <- function(r, angle.start = 0, angle.stop = 2 * base::pi){

  n <- length(r)

  ord <- order(r, decreasing = TRUE)

  rr <- r[ord]

  xy <- matrix(0, n, 2)

  theta <- seq(angle.start, angle.stop, length.out = n)

  for(i in 2:n){

    d <- rr[1] + rr[i]

    xy[i,] <- d*c(cos(theta[i]), sin(theta[i]))
  }

  xy <- xy[order(ord),]

  data.frame(x = xy[, 1], y = xy[, 2])
}

# Circlepack layout ----
layoutPack <- function(r){

  packing <-
    packcircles::circleProgressiveLayout(r,
                                         sizetype = "radius")

  data.frame(x=packing$x, y=packing$y)
}

# Tries to satisfy 2Rsin(pi/n) >= r_{i} + r_{i+1} for every adjacent pair
layoutAnnulus <- function(r) {

  n <- length(r)

  if (n == 1) {
    return(data.frame(x = 0, y = 0))
  }

  if (n == 2) {
    d <- r[1] + r[2]
    return(data.frame(x = c(-d/2, d/2),
                      y = c(0, 0)))
  }

  ## Adjacent sums (last circle adjacent to first)
  rsum <- r + c(r[-1], r[1])

  ## Function whose root gives the required ring radius
  f <- function(R) {
    sum(2 * asin(rsum / (2 * R))) - 2 * pi
  }

  ## Smallest feasible radius
  Rmin <- max(rsum) / 2 * (1 + 1e-8)

  ## Find an upper bound with opposite sign
  Rmax <- Rmin * 2
  while (f(Rmax) > 0)
    Rmax <- Rmax * 2

  ## Solve for ring radius
  R <- uniroot(f, c(Rmin, Rmax))$root

  ## Angular increments
  dtheta <- 2 * asin(rsum / (2 * R))

  ## Starting angles
  theta <- c(0, cumsum(dtheta[-n]))

  ## Centre the configuration
  theta <- theta - mean(theta)

  data.frame(x = R * cos(theta), y = R * sin(theta))
}

