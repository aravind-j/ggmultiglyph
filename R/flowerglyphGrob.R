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

#' Draw a Flower Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a flower glyph. Each variable
#' in \code{z} is depicted as a "petal" radiating from a central point, with the
#' petal length scaled according to the corresponding value in \code{z}. The
#' silhouette of each petal is generated from a continuous parametric taper
#' profile whose widening from the base and tapering towards the tip are
#' controlled independently by \code{petal.base.shape} and
#' \code{petal.tip.shape}. An optional notch at the tip, controlled by
#' \code{petal.tip.notch}, can be used to produce cleft (bifid) or heart-shaped
#' petals.
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying the values to be plotted as the length
#'   of the flower glyph petals.
#' @param size The size of the glyph (scales both petal length and width).
#' @param petal.width The width of a petal (as a proportion of \code{size|}) at
#'   its widest point.
#' @param petal.base.shape A positive numeric value controlling how rapidly the
#'   petal widens from its base. Smaller values produce a broader attachment to
#'   the centre of the glyph, whereas larger values delay the expansion of the
#'   petal, producing a narrower, more clawed base.
#' @param petal.tip.shape A positive numeric value controlling how rapidly the
#'   petal tapers towards its tip. Smaller values produce broader, more rounded
#'   tips, whereas larger values concentrate the petal width closer to its
#'   middle, producing progressively narrower, more pointed or lanceolate tips.
#' @param petal.tip.notch A numeric value controlling deformation of the petal
#'   tip. A value of \code{0} produces a smooth, unmodified tip. Positive values
#'   (typically \eqn{> 0}) create an increasingly deep inward cleft with smooth
#'   shoulders, producing retuse, emarginate, obcordate, or bifid petal tips.
#'   Negative values extend the tip beyond its nominal length, producing
#'   progressively more acuminate, cuspidate, or aristate tips.
#' @param petal.tip.notch.width A positive numeric value controlling the breadth
#'   of the tip notch. Smaller values produce a narrow, sharply incised cleft,
#'   or point, whereas larger values produce a broader, more rounded indentation
#'   or extension.
#' @param petal.base.notch A numeric value controlling deformation of the petal
#'   base. A value of \code{0} produces a smooth, unmodified base. Positive
#'   values shift the basal shoulders backward relative to the central notch
#'   vertex (which remains anchored at the origin), producing cordate,
#'   sagittate, reniform, hastate, or auriculate petal shapes. Negative values
#'   extend the base into a basal protrusion or claw.
#' @param petal.base.notch.width A positive numeric value controlling the
#'   breadth of the basal notch or protrusion. Smaller values produce a narrow,
#'   sharply defined sinus or point, whereas larger values produce a broader,
#'   more rounded basal indentation or extension.
#' @param petal.waist A numeric value controlling the depth of a constriction
#'   along the petal. A value of \code{0} produces a uniformly tapered petal,
#'   whereas larger values produce an increasingly pronounced narrowing,
#'   resulting in pandurate, fiddle-shaped, or otherwise constricted petals.
#' @param petal.waist.position A numeric value between \code{0} and \code{1}
#'   controlling the position of the waist along the petal axis, where \code{0}
#'   corresponds to the base and \code{1} to the tip.
#' @param petal.waist.width A positive numeric value controlling the breadth of
#'   the waist. Smaller values produce a sharp, localized constriction, whereas
#'   larger values produce a broader, more gradual narrowing.
#' @param petal.curvature A numeric value or vector controlling the curvature of
#'   the petal centreline. A value of \code{0} produces a straight petal,
#'   whereas single positive or negative values produce simple arcuate or
#'   falcate (C-shaped) curvature in opposite directions. Passing a vector
#'   specifies multiple curvature bends along the petal axis; for example, a
#'   vector of length 2 with opposing signs (e.g., \code{c(3.0, -3.0)}) produces
#'   a sigmoid (S-shaped) petal.
#' @param petal.curvature.position A numeric value or vector between \code{0}
#'   and \code{1} controlling the position of maximum curvature along the petal
#'   axis, where \code{0} corresponds to the base and \code{1} to the tip. When
#'   \code{petal.curvature} is a vector specifying multiple bends (e.g., for
#'   sigmoid shapes), this parameter specifies the location along the axis for
#'   each corresponding bend.
#' @param petal.curvature.width A positive numeric value controlling the breadth
#'   of the region over which the petal bends. Smaller values concentrate the
#'   curvature into a localized bend, whereas larger values distribute the
#'   curvature more evenly along the petal, producing a broader, more gradual
#'   arc.
#' @param edges The number of points used to approximate the taper profile of
#'   one side of a petal. Higher values give smoother petal outlines.
#' @param col The petal outline colour.
#' @param fill The petal fill colour.
#' @param lwd The petal outline line width.
#' @param alpha The alpha transparency value.
#' @param angle.start The start angle for the petals in radians. Default is
#'   zero.
#' @param angle.stop The stop angle for the petals in radians. Default is
#'   \eqn{2\pi}.
#' @param linejoin The line join style for the petal outlines. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#' @param centre logical. If \code{TRUE}, a central point is drawn at the glyph
#'   origin. Default is \code{TRUE}.
#' @param centre.size The size (radius, in mm) of the central point.
#' @param col.centre The line colour of the central point.
#' @param fill.centre The fill colour of the central point.
#' @param draw.grid logical. If \code{TRUE}, grid levels are plotted as nested
#'   petals. Default is \code{FALSE}.
#' @param grid.levels A list of grid levels (as vectors) corresponding to the
#'   values in \code{z} at which points are to be plotted. The values in
#'   \code{z} should be present in the list specified.
#' @param grid.point.size The size of the grid levels in native units.
#' @param col.points The colour of grid levels.
#'
#' @family grobs
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @importFrom grid polygonGrob circleGrob pointsGrob nullGrob grobTree
#' @importFrom grid gpar unit unit.c
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_flowerglyph}}
#'
#' @examples
#'
#' library(ggmultiglyph)
#' library(grid)
#' library(gridExtra)
#'
#' z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust length and area scaling
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust flower size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 10,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 10,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 10,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust circle size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 1,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 2.5,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 5,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 1,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 2.5,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 5,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 1,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 2.5,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 5,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust angle
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        angle.start = 0, angle.stop = base::pi)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        angle.start = 90 * (base::pi/180),
#'                        angle.stop = 270 * (base::pi/180))
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 1,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 1,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        angle.start = 0, angle.stop = base::pi)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20, centre.size = 1,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        angle.start = 90 * (base::pi/180),
#'                        angle.stop = 270 * (base::pi/180))
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        angle.start = 0, angle.stop = base::pi)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        angle.start = 90 * (base::pi/180),
#'                        angle.stop = 270 * (base::pi/180))
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line widths
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        lwd = 3)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        lwd = 5)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        lwd = 3)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        lwd = 5)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        lwd = 3)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        lwd = 5)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust centre colour and fill
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        col.centre = "salmon", fill.centre = "white")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        col.centre = "cyan", fill.centre = "white")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        col.centre = "green", fill.centre = "white")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        centre.size = 5,
#'                        col.centre = "salmon", fill.centre = "white")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        centre.size = 5,
#'                        col.centre = "cyan", fill.centre = "white")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        centre.size = 5,
#'                        col.centre = "green", fill.centre = "white")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        col.centre = "salmon", fill.centre = "white")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        col.centre = "cyan", fill.centre = "white")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        col.centre = "green", fill.centre = "white")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        fill.centre = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        fill.centre = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        fill.centre = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        centre.size = 5,
#'                        fill.centre = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        centre.size = 5,
#'                        fill.centre = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        centre.size = 5,
#'                        fill.centre = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        fill.centre = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        fill.centre = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        centre.size = 5,
#'                        fill.centre = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust petal colour and fill
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        col = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        col = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        col = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        col = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        col = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        col = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        col = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        col = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        col = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        fill = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        fill = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        fill = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        fill = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        fill = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        fill = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        fill = "salmon")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        fill = "cyan")
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        fill = "green")
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate petal fill and colour
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25, lwd = 3,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25, lwd = 3,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = z,
#'                        size = 20,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25, lwd = 3,
#'                        scale.area = FALSE, scale.length = FALSE,
#'                        col = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
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
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        fill = "white", col.grid = "black")
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        fill = "white", col.grid = "black")
#'
#' grid.arrange(fg1, fg2, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust fill and grid level colours
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' gl <- split(x = c(rep(c(1, 2, 3), 4),
#'                   rep(c(1, 2, 3, 4), 2)),
#'             f = c(rep(1:4, each = 3),
#'                   rep(5:6, each = 4)))
#'
#' gl
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = TRUE, scale.length = FALSE,
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1, 3, 2, 1, 2, 3),
#'                        size = 15,
#'                        petal.base.shape = 1.25, petal.tip.shape = 1,
#'                        petal.width = 0.25,
#'                        scale.area = FALSE, scale.length = TRUE,
#'                        draw.grid = TRUE, grid.levels = gl,
#'                        col = "white", col.grid = "white",
#'                        fill = RColorBrewer::brewer.pal(6, "Dark2"))
#'
#' grid.arrange(fg1, fg2, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjusting petal shape
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Petal width
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 1,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 2,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Tip shape
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 0.5,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 2,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Base shape
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 2, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjusting petal notch
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Base notch
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = 0.9,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = 0,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg4 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = -0.9,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg5 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = -0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(arrangeGrob(fg1, fg2, nrow = 1),
#'              arrangeGrob(fg3),
#'              arrangeGrob(fg4, fg4, nrow = 1),
#'              nrow = 3)
#'
#' # Base notch width
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = 0.5,
#'                        petal.base.notch.width = 0.05,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = 0.5,
#'                        petal.base.notch.width = 0.1,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.base.notch = 0.5,
#'                        petal.base.notch.width = 0.15,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Tip notch
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = 0.9,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = 0,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg4 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = -0.9,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg5 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = -0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(arrangeGrob(fg1, fg2, nrow = 1),
#'              arrangeGrob(fg3),
#'              arrangeGrob(fg4, fg4, nrow = 1),
#'              nrow = 3)
#'
#' # Base notch width
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = 0.5,
#'                        petal.tip.notch.width = 0.05,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = 0.5,
#'                        petal.tip.notch.width = 0.1,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        petal.tip.notch = 0.5,
#'                        petal.tip.notch.width = 0.15,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjusting petal curvature
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Curvature
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = 0,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = 2.5,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Curvature position
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        petal.curvature.position = 0.2,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        petal.curvature.position = 0.5,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        petal.curvature.position = 0.8,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Curvature width
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        petal.curvature.width = 0.05,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        petal.curvature.width = 0.2,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = -2.5,
#'                        petal.curvature.width = 0.5,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Sigmoid curve
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = c(4, -4),
#'                        petal.curvature.position = c(0.2, 0.5),
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = c(0, 0),
#'                        petal.curvature.position = 0.2,
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(1), size = 20,
#'                        petal.base.shape = 0.5, petal.tip.shape = 1,
#'                        petal.width = 0.15,
#'                        petal.curvature = c(-4, 4),
#'                        petal.curvature.position = c(0.2, 0.5),
#'                        scale.area = FALSE, scale.length = TRUE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjusting petal waist
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Waist
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.75,
#'                        petal.waist = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.75,
#'                        petal.waist = 0,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.75,
#'                        petal.waist = -0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Waist width
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.5,
#'                        petal.waist = 0.5,
#'                        petal.waist.width = 0.05,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.5,
#'                        petal.waist = 0.5,
#'                        petal.waist.width = 0.15,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.5,
#'                        petal.waist = 0.5,
#'                        petal.waist.width = 0.3,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' # Waist position
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.5,
#'                        petal.waist = 0.5,
#'                        petal.waist.width = 0.05,
#'                        petal.waist.position = 0.1,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.5,
#'                        petal.waist = 0.5,
#'                        petal.waist.width = 0.05,
#'                        petal.waist.position = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape  = 1,
#'                        petal.width = 0.5,
#'                        petal.waist = 0.5,
#'                        petal.waist.width = 0.05,
#'                        petal.waist.position = 0.9,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' grid.arrange(fg1, fg2, fg3, nrow = 1)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Generate botanical shapes
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Linear
#' fg1 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 0.2, petal.tip.shape = 0.2,
#'                        petal.width = 0.2,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant1 <- textGrob(label = "Linear",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Lanceolate
#' fg2 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 0.8, petal.tip.shape = 2.5,
#'                        petal.width = 0.4,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant2 <- textGrob(label = "Lanceolate",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Oblong
#' fg3 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 0.3, petal.tip.shape = 0.3,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant3 <- textGrob(label = "Oblong",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Elliptic
#' fg4 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 1,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant4 <- textGrob(label = "Elliptic",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Ovate
#' fg5 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 0.8, petal.tip.shape = 1.8,
#'                        petal.width = 0.6,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant5 <- textGrob(label = "Ovate",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#'
#' # Obovate
#' fg6 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1.8, petal.tip.shape = 0.8,
#'                        petal.width = 0.6,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant6 <- textGrob(label = "Obovate",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Orbicular
#' fg7 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 1, petal.tip.shape = 0.6,
#'                        petal.width = 1,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant7 <- textGrob(label = "Orbicular",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Spatulate
#' fg8 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 4, petal.tip.shape = 0.9,
#'                        petal.width = 0.5,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant8 <- textGrob(label = "Spatulate",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Cuneate
#' fg9 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 2, petal.tip.shape = 0.4,
#'                        petal.width = 0.6,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant9 <- textGrob(label = "Cuneate",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Cuneate
#' fg9 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                        z = c(0.5), size = 20,
#'                        petal.base.shape = 2, petal.tip.shape = 0.4,
#'                        petal.width = 0.6,
#'                        scale.area = FALSE, scale.length = FALSE)
#'
#' ant9 <- textGrob(label = "Cuneate",
#'                  x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                  gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Deltoid
#' fg10 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 0.3, petal.tip.shape = 2.5,
#'                         petal.width = 0.7,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant10 <- textGrob(label = "Deltoid",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Rhomboid
#' fg11 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 1.5, petal.tip.shape = 1.5,
#'                         petal.width = 0.7,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant11 <- textGrob(label = "Rhomboid",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Flabellate
#' fg12 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 2, petal.tip.shape = 0.2,
#'                         petal.width = 0.8,
#'                         petal.tip.notch = -0.05,
#'                         petal.tip.notch.width = 0.01,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant12 <- textGrob(label = "Flabellate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Oblanceolate
#' fg13 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 2.5, petal.tip.shape  = 0.8,
#'                         petal.width = 0.45,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant13 <- textGrob(label = "Oblanceolate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Pandurate (fiddle-shaped)
#' fg14 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 1, petal.tip.shape  = 1,
#'                         petal.width = 0.75,
#'                         petal.waist = 0.65,
#'                         petal.waist.position = 0.50,
#'                         petal.waist.width = 0.12,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant14 <- textGrob(label = "Pandurate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Falcate (sickle-shaped)
#' fg15 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 0.5, petal.tip.shape  = 2,
#'                         petal.width = 0.2,
#'                         petal.curvature = 2.8,
#'                         petal.curvature.position = 0.3,
#'                         petal.curvature.width = 0.5,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant15 <- textGrob(label = "Falcate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Cordate (Heart-shaped)
#' fg16 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 0.6, petal.tip.shape = 2,
#'                         petal.width = 0.8,
#'                         petal.base.notch = 0.25,
#'                         petal.base.notch.width = 0.01,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant16 <- textGrob(label = "Cordate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Obcordate (Inverted heart-shaped)
#' fg17 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 2, petal.tip.shape = 0.6,
#'                         petal.width = 0.8,
#'                         petal.tip.notch = 0.25,
#'                         petal.tip.notch.width = 0.01,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant17 <- textGrob(label = "Obcordate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Reniform (Kidney-shaped)
#' fg18 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 0.6, petal.tip.shape = 0.5,
#'                         petal.width = 1.3,
#'                         petal.base.notch = 0.35,
#'                         petal.base.notch.width = 0.01,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant18 <- textGrob(label = "Reniform",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Sagittate (Arrowhead-shaped)
#' fg19 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 0.4, petal.tip.shape = 2.5,
#'                         petal.width = 0.3,
#'                         petal.base.notch = 0.25,
#'                         petal.base.notch.width = 0.01,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant19 <- textGrob(label = "Sagittate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Hastate (Spear-shaped, flaring lobes)
#' fg20 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 0.2, petal.tip.shape = 2.8,
#'                         petal.width = 0.75,
#'                         petal.base.notch = 0.12,
#'                         petal.base.notch.width = 0.01,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant20 <- textGrob(label = "Hastate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#' # Auriculate (Ear-lapped base)
#' fg21 <- flowerglyphGrob(x = unit(0.5, "npc"), y = unit(0.1, "npc"),
#'                         z = c(0.5), size = 20,
#'                         petal.base.shape = 1.5, petal.tip.shape = 1.0,
#'                         petal.width = 0.5,
#'                         petal.base.notch = 0.10,
#'                         petal.base.notch.width = 0.04,
#'                         scale.area = FALSE, scale.length = FALSE)
#'
#' ant21 <- textGrob(label = "Auriculate",
#'                   x = unit(0.5, "npc"), y = unit(0.4, "npc"),
#'                   gp = gpar(fontsize = 12, fontface = "bold"))
#'
#'
#' grid.arrange(
#'   arrangeGrob(fg1, ant1, nrow = 2),
#'   arrangeGrob(fg2, ant2, nrow = 2),
#'   arrangeGrob(fg3, ant3, nrow = 2),
#'   arrangeGrob(fg4, ant4, nrow = 2),
#'   arrangeGrob(fg5, ant5, nrow = 2),
#'   arrangeGrob(fg6, ant6, nrow = 2),
#'   nrow = 2)
#'
#' grid.arrange(
#'   arrangeGrob(fg7, ant7, nrow = 2),
#'   arrangeGrob(fg8, ant8, nrow = 2),
#'   arrangeGrob(fg9, ant9, nrow = 2),
#'   arrangeGrob(fg10, ant10, nrow = 2),
#'   arrangeGrob(fg11, ant11, nrow = 2),
#'   arrangeGrob(fg12, ant12, nrow = 2),
#'   nrow = 2)
#'
#' grid.arrange(
#'   arrangeGrob(fg13, ant13, nrow = 2),
#'   arrangeGrob(fg14, ant14, nrow = 2),
#'   arrangeGrob(fg15, ant15, nrow = 2),
#'   arrangeGrob(fg16, ant16, nrow = 2),
#'   arrangeGrob(fg17, ant17, nrow = 2),
#'   arrangeGrob(fg18, ant18, nrow = 2),
#'   nrow = 2)
#'
#' grid.arrange(
#'   arrangeGrob(fg19, ant19, nrow = 2),
#'   arrangeGrob(fg20, ant20, nrow = 2),
#'   nrow = 1)
#'
flowerglyphGrob <- function(x = .5, y = .5, z,
                            size = 1,
                            petal.width = 0.6,
                            petal.base.shape = 1,
                            petal.tip.shape = 1,
                            petal.tip.notch = 0,
                            petal.tip.notch.width = 0.15,
                            petal.base.notch = 0,
                            petal.base.notch.width = 0.15,
                            petal.waist = 0,
                            petal.waist.position = 0.5,
                            petal.waist.width = 0.15,
                            petal.curvature = 0,
                            petal.curvature.position = 0.7,
                            petal.curvature.width = 0.2,
                            edges = 30,
                            col = "black",
                            fill = NA,
                            lwd = 1,
                            alpha = 1,
                            angle.start = 0,
                            angle.stop = 2 * base::pi,
                            linejoin = c("mitre", "round", "bevel"),
                            scale.length = TRUE,
                            scale.area = FALSE,
                            centre = TRUE,
                            centre.size = 1,
                            col.centre = "black",
                            fill.centre = "black",
                            draw.grid = FALSE,
                            grid.levels = NULL,
                            col.grid = "grey",
                            lwd.grid = lwd) {

  if (scale.length && scale.area) {
    stop(
      'Only one of "scale.length" and "scale.area" may be TRUE.'
    )
  }

  linejoin <- match.arg(linejoin)

  scale_petal <- function(value) {

    if (scale.length) {

      list(length.scale = value, width.scale = 1)

    } else if (scale.area) {

      s <- sqrt(value)
      list(length.scale = s, width.scale = s)

    } else {

      list(length.scale = 1, width.scale = 1)

    }
  }

  # grid::grid.points(x = x, y = y, pch =  20)

  # Get petal angles
  dimension <- length(z)

  if (abs(angle.start - angle.stop) == 2 * base::pi) {
    angle <- seq(angle.start, angle.stop,
                 length.out = dimension + 1)[1:dimension]
  } else {
    angle <- seq(angle.start, angle.stop, length.out = dimension)
  }

  # Build each petal outline in its own local frame, then rotate it to
  # point along its "angle" and translate it to (x, y).
  petalx <- vector("list", dimension)
  petaly <- vector("list", dimension)
  petalid <- vector("list", dimension)

  for (i in 1:dimension) {

    sc <- scale_petal(z[i])

    len <- size * sc$length.scale
    halfwidth <- (petal.width * size / 2) * sc$width.scale

    outline <- petal_outline(len = len,
                             halfwidth = halfwidth,
                             base.shape = petal.base.shape,
                             tip.shape = petal.tip.shape,
                             tip.notch = petal.tip.notch,
                             tip.notch.width = petal.tip.notch.width,
                             base.notch = petal.base.notch,
                             base.notch.width = petal.base.notch.width,
                             waist = petal.waist,
                             waist.position = petal.waist.position,
                             waist.width = petal.waist.width,
                             curvature = petal.curvature,
                             curvature.position = petal.curvature.position,
                             curvature.width = petal.curvature.width,
                             edges = edges)

    # Rotate the local (length, width) petal outline by "angle[i]"
    rx <- outline$x * cos(angle[i]) - outline$y * sin(angle[i])
    ry <- outline$x * sin(angle[i]) + outline$y * cos(angle[i])

    petalx[[i]] <- unit(x, "native") + unit(rx, "mm")
    petaly[[i]] <- unit(y, "native") + unit(ry, "mm")
    petalid[[i]] <- rep(i, length(rx))
  }

  petalx <- do.call(grid::unit.c, petalx)
  petaly <- do.call(grid::unit.c, petaly)
  petalid <- unlist(petalid)

  petalGrob <- grid::polygonGrob(x = petalx,
                                 y = petaly,
                                 id = petalid,
                                 # default.units = "native",
                                 gp = grid::gpar(col = col,
                                                 fill = fill,
                                                 lwd = lwd,
                                                 alpha = alpha,
                                                 linejoin = linejoin))

  # Central point
  centreGrob <- grid::nullGrob()
  if (centre) {
    centreGrob <- grid::circleGrob(x = x, y = y,
                                   r = grid::unit(centre.size, "mm"),
                                   default.units = "native",
                                   gp = grid::gpar(col = col.centre,
                                                   fill = fill.centre,
                                                   alpha = alpha))
  }

  gpetalsGrob <- grid::nullGrob()

  # Plot grid levels along the central axis of each petal
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

          gridGrobs <- list()

          if (length(grid.levels) == dimension) {

            dim.fill <- rep_len(fill, dimension)

            for (i in seq_len(dimension)) {

              levels <- sort(grid.levels[[i]], decreasing = TRUE)

              # keep only levels inside current petal
              levels <- levels[levels <= z[i]]

              if (length(levels) > 0) {

                for (j in seq_along(levels)) {

                  sc <- scale_petal(levels[j])

                  outline <-
                    petal_outline(len = size * sc$length.scale,
                                  halfwidth = (petal.width * size / 2) *
                                    sc$width.scale,
                                  base.shape = petal.base.shape,
                                  tip.shape = petal.tip.shape,
                                  tip.notch = petal.tip.notch,
                                  tip.notch.width = petal.tip.notch.width,
                                  base.notch = petal.base.notch,
                                  base.notch.width = petal.base.notch.width,
                                  waist = petal.waist,
                                  waist.position = petal.waist.position,
                                  waist.width = petal.waist.width,
                                  curvature = petal.curvature,
                                  curvature.position = petal.curvature.position,
                                  curvature.width = petal.curvature.width,
                                  edges = edges)

                  rx <- outline$x * cos(angle[i]) - outline$y * sin(angle[i])
                  ry <- outline$x * sin(angle[i]) + outline$y * cos(angle[i])

                  k <- length(gridGrobs) + 1

                  gridGrobs[[k]] <-
                    grid::polygonGrob(x = unit(x, "native") + unit(rx, "mm"),
                                      y = unit(y, "native") + unit(ry, "mm"),
                                      gp = grid::gpar(col = col.grid,
                                                      fill = dim.fill[i],
                                                      lwd = lwd.grid,
                                                      alpha = alpha))

                }
              }
            }
          }

          if (length(gridGrobs) > 0) {

            gpetalsGrob <- do.call(grid::grobTree, gridGrobs)

          }

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

  gridout <-
    grid::grobTree(petalGrob, gpetalsGrob, centreGrob,
                   gp = grid::gpar(alpha = alpha, fill = fill))

  class(gridout) <- append(class(gridout), c("glyphGrob", "flowerglyphGrob"))

  attr(gridout, "length") <- dimension

  gridout

}

# Function to draw the petal outline
petal_outline <- function(len, halfwidth,
                          base.shape,
                          tip.shape,
                          tip.notch = 0,
                          tip.notch.width = 0.15,
                          base.notch = 0,
                          base.notch.width = 0.15,
                          waist = 0,
                          waist.position = 0.5,
                          waist.width = 0.15,
                          curvature = 0,
                          curvature.position = 0.7,
                          curvature.width = 0.2,
                          edges = 50) {

  ## Parameter along petal axis
  u <- seq(0, 1, length.out = edges)

  ## Beta taper profile ----

  ## Handle 0 parameter edge-cases to prevent NaN / division by zero
  if (base.shape == 0 && tip.shape == 0) {
    peak <- 1
  } else if (base.shape == 0) {
    peak <- 1
  } else if (tip.shape == 0) {
    peak <- 1
  } else {
    peak <- (base.shape / (base.shape + tip.shape))^base.shape *
      (tip.shape / (base.shape + tip.shape))^tip.shape
  }

  ## Beta-like taper profile
  profile <- u^base.shape * (1 - u)^tip.shape
  profile <- profile / peak

  w <- halfwidth * profile

  ## Waist modifier ----

  if (waist != 0) {

    waist.modifier <- 1 - waist *
      exp(-((u - waist.position)^2) / (2 * waist.width^2))
    waist.modifier <- pmax(waist.modifier, 0)

    w <- w * waist.modifier
  }

  ## Centreline ----

  centre.x <- u * len
  centre.y <- numeric(length(u))

  ## Centreline curvature ----

  if (any(curvature != 0)) {

    ### Width of the region over which the petal bends
    sigma <- curvature.width

    ### Parameter increment
    du <- diff(u)[1]

    ### Curvature parameter vectors
    n_curves <- max(length(curvature),
                    length(curvature.position), length(sigma))
    curv <- rep_len(curvature, n_curves)
    pos  <- rep_len(curvature.position, n_curves)
    wid  <- rep_len(sigma, n_curves)

    ### Cumulative curvature field (Gaussian) across all inflection points
    kappa <- numeric(length(u))
    for (k in seq_len(n_curves)) {
      if (curv[k] != 0) {
        kappa <- kappa + curv[k] * exp(-((u - pos[k])^2) / (2 * wid[k]^2))
      }
    }

    ### Integrate curvature to obtain tangent angle
    theta <- cumsum(kappa) * du

    ### Integrate tangent to obtain centreline
    centre.x <- cumsum(c(0, cos(theta[-length(theta)]))) * du
    centre.y <- cumsum(c(0, sin(theta[-length(theta)]))) * du

    ### Scale to desired petal length
    centre.x <- centre.x * len / max(centre.x)
    centre.y <- centre.y * len
  }

  ## Construct petal boundary around centreline ----

  ### Calculate local normal vectors

  dx <- c(diff(centre.x), tail(diff(centre.x), 1))
  dy <- c(diff(centre.y), tail(diff(centre.y), 1))

  tangent.length <- sqrt(dx^2 + dy^2)

  ### Prevent tangent length zero division
  tangent.length[tangent.length == 0] <- 1

  nx <- -dy / tangent.length
  ny <- dx / tangent.length

  ### Left and right sides of petal

  left.x <- centre.x + nx * w
  left.y <- centre.y + ny * w

  right.x <- centre.x - nx * w
  right.y <- centre.y - ny * w

  ## Notch & Protrusion modifiers ----

  # Calculate unit tangent vectors for longitudinal shifts
  tx <- ifelse(tangent.length > 0, dx / tangent.length, 0)
  ty <- ifelse(tangent.length > 0, dy / tangent.length, 0)

  ### Tip Notch ----
  if (tip.notch != 0) {
    tip_shift <- tip.notch * len * exp(-((1 - u)^2) / (2 * tip.notch.width^2))

    left.x <- left.x - tx * tip_shift
    left.y <- left.y - ty * tip_shift
    right.x <- right.x - tx * tip_shift
    right.y <- right.y - ty * tip_shift
    centre.x <- centre.x - tx * tip_shift
    centre.y <- centre.y - ty * tip_shift
  }

  ### 2. Base Notch ----
  if (base.notch != 0) {
    base_shift <- base.notch * len * exp(-(u^2) / (2 * base.notch.width^2))

    left.x <- left.x + tx * base_shift
    left.y <- left.y + ty * base_shift
    right.x <- right.x + tx * base_shift
    right.y <- right.y + ty * base_shift
    centre.x <- centre.x + tx * base_shift
    centre.y <- centre.y + ty * base_shift

    # Re-anchor
    # Translate entire polygon so base notch vertex (u = 0) sits at (0,0)
    base_vtx_x <- centre.x[1]
    base_vtx_y <- centre.y[1]

    left.x <- left.x - base_vtx_x
    left.y <- left.y - base_vtx_y
    right.x <- right.x - base_vtx_x
    right.y <- right.y - base_vtx_y
    centre.x <- centre.x - base_vtx_x
    centre.y <- centre.y - base_vtx_y
  }

  ## Final polygon ----

  ### Remove duplicated tip vertices

  left.x <- left.x[-length(left.x)]
  left.y <- left.y[-length(left.y)]

  right.x <- right.x[-length(right.x)]
  right.y <- right.y[-length(right.y)]

  xpoly <- c(
    left.x,
    centre.x[length(centre.x)],
    rev(right.x)
  )

  ypoly <- c(
    left.y,
    centre.y[length(centre.y)],
    rev(right.y)
  )

  list(x = xpoly, y = ypoly)
}


