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
#'   \item{\code{"chain"}}{Bubbles are linked together in a meandering tangent
#'   chain. Each new bubble is placed tangent to its immediate predecessor,
#'   alternating between opposite sides of the chain to produce a distinctive
#'   zig-zag arrangement. Where necessary, the placement is adjusted to
#'   minimise overlap with previously placed bubbles while preserving the
#'   ordering of the data.}
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
#'   directly as the bubble radii.
#' @param scale.area logical. If \code{TRUE}, values in \code{z} are
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
#' @param lwd The bubble outline line width.
#' @param linejoin The line join style for the tile polygon. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#' @param alpha The alpha transparency value.
#' @param angle.start The start angle for the bubbles in radians for
#'   \code{layout = "circle"} and \code{layout = "hub"}. Default is zero.
#' @param angle.stop The stop angle for the bubbles in radians for \code{layout
#'   = "circle"} and \code{layout = "hub"}. Default is \eqn{2\pi}.
#' @param lwd.connector The line width of the connectors.
#' @param col.connector The colour of the connectors.
#' @param connector.point logical. If \code{TRUE}, a small point is drawn at
#'   the centre of each bubble where connectors meet. Default is \code{FALSE}.
#' @param connector.point.size The size of the connector points as a fraction of
#'   native coordinates. Default is \code{0.01}.
#' @param col.connector.point The colour of the connector points. Default is
#'   \code{"black"}.
#' @param draw.grid logical. If \code{TRUE}, grid levels are plotted as nested
#'   circles within each bubble. Default is \code{FALSE}.
#' @param grid.levels A list of grid levels (as vectors) corresponding to the
#'   values in \code{z} at which the nested circles are to be plotted. The
#'   values in \code{z} should be present in the list specified.
#' @param col.grid The colour of the grid circles.
#' @param lwd.grid The line width of the grid circles.
#' @param preserve.zeros logical. If \code{TRUE}, bubbles with zero values in
#'   \code{z} are still displayed with a minimum radius to ensure visibility in
#'   the layout computation. If \code{FALSE}, zero values result in no visible
#'   bubble. Default is \code{TRUE}.
#' @param layout.eps A small numerical tolerance value used in layout
#'   computations to avoid numerical instability. If \code{NULL} (default), a
#'   value is automatically computed based on the largest bubble radius.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @importFrom grid circleGrob polylineGrob polygonGrob segmentsGrob grobTree
#' @importFrom grid gpar nullGrob unit unit.c pointsGrob
#' @importFrom packcircles circleProgressiveLayout
#' @importFrom stats dist median uniroot
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_bubbleglyph}},
#'   \code{\link[packcircles]{circleProgressiveLayout}}
#'
#'
#' @examples
#'
#' library(ggmultiglyph)
#' library(grid)
#' library(gridExtra)
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
                            scale.area = FALSE,
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
                            connector.point = FALSE,
                            connector.point.size = 0.01,
                            col.connector.point = "black",
                            preserve.zeros = TRUE,
                            lwd = 1,
                            linejoin = c("mitre", "round", "bevel"),
                            draw.grid = FALSE,
                            grid.levels = NULL,
                            col.grid = "grey",
                            lwd.grid = lwd,
                            layout.eps = NULL) {

  if (scale.radius && scale.area) {
    stop(
      'Only one of "scale.radius" and "scale.area" may be TRUE.'
    )
  }

  layout  <- match.arg(layout)
  connector  <- match.arg(connector)

  dimension <- length(z)

  ## Convert data values to radii
  scale_bubble <- function(value) {

    if (scale.radius) {

      value

    } else if (scale.area) {

      sqrt(value)

    } else {

      rep(1, dimension)

    }
  }

  r <- scale_bubble(z)

  if (is.null(layout.eps)) {
    layout.eps <- sqrt(.Machine$double.eps) * max(r)
  }

  ## Apply overall glyph scaling
  r <- size * r

  ## Handle zero values
  r.draw <- r.layout <- r

  if (preserve.zeros) {
    r.layout <- layout.radius(r.draw)
    # r.layout <- layout.radius(r)
  }

  n <- dimension

  ## Compute circle centres (same units as radii: mm)
  centres <- switch(layout,
                    circle = layoutCircle(r.layout, angle.start = angle.start,
                                          angle.stop = angle.stop),
                    line = layoutLine(r.layout, angle = line.angle),
                    chain = layoutChain(r.layout),
                    hub = layoutHub(r.layout, angle.start = angle.start,
                                    angle.stop = angle.stop),
                    annulus = layoutAnnulus(r.layout),
                    pack = layoutPack(r.layout))


  pgrob <- grid::pointsGrob(x = grid::unit(x, "native") +
                              grid::unit(centres$x, "mm"),
                            y = grid::unit(y, "native") +
                              grid::unit(centres$y, "mm"),
                            pch =  20,
                            size = grid::unit(connector.point.size,
                                              "native"),
                            gp = grid::gpar(col = col.connector.point,
                                            alpha = alpha))

  circlesGrob <-
    grid::circleGrob(x = grid::unit(x, "native") + grid::unit(centres$x, "mm"),
                     y = grid::unit(y, "native") + grid::unit(centres$y, "mm"),
                     r = grid::unit(r.draw, "mm"),
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
               D <- as.matrix(stats::dist(cbind(centres$x, centres$y)))
               # tol <- sqrt(.Machine$double.eps)
               tol <- sqrt(.Machine$double.eps) *
                 pmax(outer(r,r,"+"),1)
               A <- abs(D - outer(r,r,"+")) < tol
               diag(A) <- FALSE
               idx <- which(A & upper.tri(A), arr.ind=TRUE)

               x0 <- centres$x[idx[, 1]]
               y0 <- centres$y[idx[, 1]]

               x1 <- centres$x[idx[, 2]]
               y1 <- centres$y[idx[, 2]]

               segmentsGrob(x0 = grid::unit(x, "native") +
                              grid::unit(x0, "mm"),
                            y0 = grid::unit(y, "native") +
                              grid::unit(y0, "mm"),
                            x1 = grid::unit(x, "native") +
                              grid::unit(x1, "mm"),
                            y1 = grid::unit(y, "native") +
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
           foreground = grid::grobTree(circlesGrob, gridGrob,
                                       connectGrob, pgrob),
           background = grid::grobTree(connectGrob, pgrob,
                                       circlesGrob, gridGrob))

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

# Chain layout ----
layoutChain <- function(r,
                        max.rotate = pi/2,
                        n.rotate = 90,
                        tol = 1e-8) {

  n <- length(r)

  if (n == 1)
    return(data.frame(x = 0, y = 0))

  if (n == 2) {

    d <- r[1] + r[2]

    return(data.frame(
      x = c(-d/2, d/2),
      y = c(0, 0)
    ))
  }

  x <- numeric(n)
  y <- numeric(n)

  x[2] <- r[1] + r[2]

  side <- 1

  overlap_score <- function(xx, yy, i) {

    ov <- 0

    for(j in seq_len(i-2)) {

      d <- sqrt((xx-x[j])^2 + (yy-y[j])^2)

      ov <- ov + max(0, r[i] + r[j] - d)^2
    }

    ov
  }

  for(i in 3:n){

    ## previous edge
    dx <- x[i-1] - x[i-2]
    dy <- y[i-1] - y[i-2]

    d <- sqrt(dx^2 + dy^2)

    ex <- dx/d
    ey <- dy/d

    ## tangent-intersection (your current construction)
    R1 <- r[i-2] + r[i]
    R2 <- r[i-1] + r[i]

    a <- (R1^2 - R2^2 + d^2)/(2*d)
    h <- sqrt(max(R1^2 - a^2, 0))

    xm <- x[i-2] + a*ex
    ym <- y[i-2] + a*ey

    ## preferred zig-zag candidate
    xc <- xm - side*h*ey
    yc <- ym + side*h*ex

    theta0 <- atan2(yc-y[i-1], xc-x[i-1])

    R <- r[i-1] + r[i]

    ## search by opening the bend while staying
    ## on the same side of the chain
    delta <- seq(0, max.rotate, length.out=n.rotate)
    delta <- c(delta, -delta[-1])

    best.score <- Inf

    for(dd in delta){

      th <- theta0 + side*dd

      xx <- x[i-1] + R*cos(th)
      yy <- y[i-1] + R*sin(th)

      score <- overlap_score(xx, yy, i)

      ## slight penalty for moving away
      score <- score + 1e-6*abs(dd)

      if(score < best.score){

        best.score <- score

        x[i] <- xx
        y[i] <- yy

        if(score < tol)
          break
      }
    }

    side <- -side
  }

  ## centre
  x <- x - mean(range(x))
  y <- y - mean(range(y))

  data.frame(x=x, y=y)
}

layout.radius <- function(r, frac = 0.2){

  nz <- r[r > 0]

  if(!length(nz))
    return(r)

  rmin <- frac * stats::median(nz)

  pmax(r, rmin)
}

# Hub Layout ----
# quick deterministic layout -  can have overlaps
layoutHub <- function(r, angle.start = 0, angle.stop = 2 * base::pi){

  n <- length(r)

  ord <- order(r, decreasing = TRUE)

  rr <- r[ord]

  xy <- matrix(0, n, 2)

  theta <- seq(angle.start, angle.stop, length.out = n)
  # theta <- seq(angle.start,
  #              angle.stop,
  #              length.out=n+1)[-1]

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

# Annulus layout ----
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
  rf <- function(R) {
    # sum(2 * asin(rsum / (2 * R))) - 2 * pi
    sum(2 * asin(pmin(rsum/(2*R), 1))) - 2 * pi
  }

  ## Smallest feasible radius
  Rmin <- max(rsum) / 2 * (1 + 1e-8)

  ## Find an upper bound with opposite sign
  Rmax <- Rmin * 2
  while (rf(Rmax) > 0)
    Rmax <- Rmax * 2

  ## Solve for ring radius
  R <- stats::uniroot(rf, c(Rmin, Rmax))$root

  ## Angular increments
  dtheta <- 2 * asin(rsum / (2 * R))

  ## Starting angles
  theta <- c(0, cumsum(dtheta[-n]))

  ## Centre the configuration
  theta <- theta - mean(theta)

  data.frame(x = R * cos(theta), y = R * sin(theta))
}



