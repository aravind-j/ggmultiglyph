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

#' Draw a Treemap Glyph
#'
#' Uses \code{\link[grid]{Grid}} graphics to draw a "treemap glyph": a bounding
#' region subdivided into polygons whose areas are proportional to the values
#' supplied in \code{z}. Two families of area-proportional layout algorithms are
#' supported: rectangular treemaps (via the \pkg{treemapify} packages) and
#' weighted Voronoi / power-diagram tessellations (via the
#' \pkg{WeightedTreemaps} package).
#'
#' @param x A numeric vector or unit object specifying x-locations.
#' @param y A numeric vector or unit object specifying y-locations.
#' @param z A numeric vector specifying each polygon's area.
#' @param size The size of glyphs.
#' @param ratio The aspect ratio (height / width).
#' @param layout The layout family to use. Either \code{"treemap"} for a
#'   rectangular treemap, or \code{"voronoi"} for a weighted Voronoi / power
#'   diagram tessellation.
#' @param algorithm The specific layout algorithm to use. If \code{NULL}
#'   (default), a sensible algorithm is chosen automatically.
#' @param voronoiTreemap.control A list of control settings for the vornoi
#'   treemap when \code{layout = "voronoi"}. See
#'   \code{\link[ggmultiglyph]{ggmultiglyph.voronoiTreemap.control}} for details
#'   on the various control parameters.
#' @param fill The fill colour(s) of the polygons. Recycled across polygons if a
#'   single colour or shorter vector is supplied.
#' @param col The polygon outline colour(s).
#' @param lwd The polygon outline line width(s).
#' @param alpha The alpha transparency value.
#' @param linejoin The line join style for the tile polygon. Either
#'   \code{"mitre"}, \code{"round"} or \code{"bevel"}.
#'
#' @note \itemize{ \item \strong{Degenerate polygon handling:} The
#'   \code{WeightedTreemaps} algorithm can produce degenerate polygons (fewer
#'   than 3 unique vertices) when fitting small cells to certain boundary
#'   shapes, particularly \code{shape = "rounded_rect"}. These degenerate
#'   polygons are automatically filtered out and will not be rendered. A warning
#'   is issued when this occurs, indicating which polygon indices were filtered.
#'   To avoid this issue: (1) ensure minimum cell values in \code{z} are
#'   sufficiently large relative to other values, or (2) use alternative shapes
#'   (\code{"rectangle"}, \code{"circle"}, \code{"hexagon"}) which do not
#'   produce degenerate polygons with typical data.
#' \item \strong{Empty or Zero-Area Polygons in Voronoi
#'   Layouts:} When using \code{layout = "voronoi"}, particularly with complex
#'   or curved boundaries like \code{shape = "rounded_rect"}, the underlying
#'   tessellation algorithm may occasionally squash cells with relatively small
#'   weights against the edges. These cells can return a valid coordinate
#'   structure but possess a near-zero physical area, rendering them visually
#'   missing or "empty". To resolve this convergence issue, pass a customized
#'   control list via the \code{voronoiTreemap.control} argument and try the
#'   following adjustments:
#'   \itemize{
#'     \item \strong{Change the \code{seed}:} Altering the random seed changes
#'       the initial placement of the cells, which often allows small cells to
#'       escape tight corners.
#'     \item \strong{Increase \code{maxIteration}:} Giving the algorithm more
#'       cycles (e.g., 500 or 1000) provides extra time for the squashed cell
#'       to expand to its target area.
#'     \item \strong{Adjust \code{error_tol}:} Modifying the error tolerance
#'       can help to find a stable geometric equilibrium before
#'       the algorithm terminates.
#'       }
#'   }
#'
#' @return A \code{\link[grid]{gTree}} object.
#'
#' @family grobs
#'
#' @importFrom grid gTree gList gpar nullGrob polygonGrob unit unit.c
#' @importFrom WeightedTreemaps get_polygons voronoiTreemap
#' @importFrom treemapify treemapify
#' @importFrom sf st_coordinates
#' @importFrom grDevices dev.off
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{geom_treemapglyph}},
#'   \code{\link[treemapify]{treemapify}},
#'   \code{\link[WeightedTreemaps]{voronoiTreemap}}
#'
#' @examples
#'
#' library(ggmultiglyph)
#' library(grid)
#' library(gridExtra)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust treemap space-filling algorithm
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                        z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                        size = 20, ratio = 1,
#'                        layout = "treemap") # algorithm = "squarified"
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "treemap", algorithm = "scol")
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "treemap", algorithm = "srow")
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "treemap", algorithm = "fixed")
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi") # algorithm = "power"
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi", algorithm = "centroidal")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust treemap size
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 10, ratio = 1,
#'                         layout = "treemap")
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 15, ratio = 1,
#'                         layout = "treemap")
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "treemap")
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 10, ratio = 1,
#'                         layout = "voronoi")
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 15, ratio = 1,
#'                         layout = "voronoi")
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line width
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "treemap")
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 3,
#'                         layout = "treemap")
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 5,
#'                         layout = "treemap")
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi")
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 3,
#'                         layout = "voronoi")
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 5,
#'                         layout = "voronoi")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust line join style
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 10,
#'                         layout = "treemap")
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 10,
#'                         layout = "treemap", linejoin = "bevel")
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 10,
#'                         layout = "treemap", linejoin = "round")
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 10,
#'                         layout = "voronoi")
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 10,
#'                         layout = "voronoi", linejoin = "bevel")
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1, lwd = 10,
#'                         layout = "voronoi", linejoin = "round")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust treemap polygon ratio
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 0.5,
#'                         layout = "treemap")
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "treemap")
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 2,
#'                         layout = "treemap")
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 0.5,
#'                         layout = "voronoi")
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi")
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 2,
#'                         layout = "voronoi")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Adjust enclosing shape for vornoi treemap
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi")
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = "rounded_rect",
#'                                                               seed = 42))
#' # seed is modified to avoid empty cells with default seed. (See Note)
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = "circle"))
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = "hexagon"))
#'
#' grid.arrange(tg1, tg2, tg3, tg4, nrow = 2)
#'
#' house_coords <- list(x = c(0, 10, 10, 5, 0),
#'                      y = c(0, 0, 10,15,10))
#'
#' oct_coord <- list(x = sin(seq(0, 2, 2/8)* pi) * 1000 + 1000,
#'                   y = cos(seq(0, 2, 2/8)* pi) * 1000 + 1000)
#'
#' diamond_coord <- list(x = c(0, 5, 10, 5),
#'                       y = c(5, 10, 5, 0))
#'
#' shield_coords <- list(x = c(0, 10, 10,  5,  0),
#'                       y = c(15, 15,  5,  0,  5))
#'
#' star_coords <- list(
#'   x = c(5.00, 6.18, 9.51, 6.91, 7.94, 5.00, 2.06, 3.09, 0.49, 3.82),
#'   y = c(9.51, 6.18, 6.18, 4.05, 0.49, 2.50, 0.49, 4.05, 6.18, 6.18)
#' )
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi")
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = house_coords))
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = oct_coord))
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = diamond_coord))
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = shield_coords))
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         layout = "voronoi",
#'                         voronoiTreemap.control =
#'                           ggmultiglyph.voronoiTreemap.control(shape = star_coords))
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate polygon fill
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' tg1 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                         layout = "treemap") # algorithm = "squarified"
#'
#' tg2 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                         layout = "treemap", algorithm = "scol")
#'
#' tg3 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                         layout = "treemap", algorithm = "srow")
#'
#'
#' tg4 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                         layout = "treemap", algorithm = "fixed")
#'
#' tg5 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                         layout = "voronoi") # algorithm = "power"
#'
#' tg6 <- treemapglyphGrob(x = unit(0.5, "npc"), y = unit(0.5, "npc"),
#'                         z <- c(0.5, 0.8, 1.2, 0.6, 1, 0.7),
#'                         size = 20, ratio = 1,
#'                         fill = RColorBrewer::brewer.pal(6, "Dark2"),
#'                         layout = "voronoi", algorithm = "centroidal")
#'
#' grid.arrange(tg1, tg2, tg3, tg4, tg5, tg6, nrow = 2)
#'
treemapglyphGrob <-
  function(x = .5, y = .5,
           size = 20, ratio = 1,
           z,
           layout = c("treemap", "voronoi"),
           algorithm = NULL,
           voronoiTreemap.control = ggmultiglyph.voronoiTreemap.control(),
           fill = NULL,
           col = "grey20",
           lwd = .5,
           alpha = 1,
           linejoin = c("mitre", "round", "bevel")) {

  layout <- match.arg(layout)
  linejoin <- match.arg(linejoin)

  width  <- size
  height <- size / ratio

  # Resolve algorithm defaults

  if (layout == "treemap") {
    if (is.null(algorithm)) {
      algorithm <- "fixed"
    }
  } else { # layout == "voronoi"
    if (is.null(algorithm)) {
      algorithm <- "power"
    }
  }

  # Algorithm checks
  treemap_algos <- c("squarified", "scol", "srow", "fixed")
  voronoi_algos <- c("power", "centroidal")

  valid_algos <- switch(layout,
                        treemap = treemap_algos,
                        voronoi = voronoi_algos)

  if (!algorithm %in% valid_algos) {

    stop(
      sprintf('"algorithm" must be one of "%s" when "layout" is "%s".',
              paste(valid_algos, collapse = '", "'),
              layout),
      call. = FALSE
    )
  }

  dimension <- length(z)

  # Compute the geometry
  raw <- computeLayout(z = z, layout = layout, algorithm = algorithm,
                       voronoiTreemap.control = voronoiTreemap.control)

  # Fit polygons into the requested width/height
  # centred at (x, y)
  polys <- normalisePolygons(polygons = raw$polygons,
                             x = x, y = y,
                             width = width, height = height)

  # Convert the standard polygon representation into grid grobs
  polyGrobList <- polygonListToGrobs(polygons = polys,
                                     fill = fill, col = col,
                                     lwd = lwd, alpha = alpha,
                                     linejoin = linejoin)

  gridout <- grid::grobTree(grid::gList(polyGrobList),
                            gp = grid::gpar(alpha = alpha))

  class(gridout) <- append(class(gridout), c("glyphGrob", "treemapglyphGrob"))

  attr(gridout, "length") <- dimension
  attr(gridout, "layout") <- layout
  attr(gridout, "algorithm") <- algorithm

  gridout

}

# Compute a Treemap Glyph Layout
computeLayout <- function(z,
                          layout = c("treemap", "voronoi"),
                          algorithm = NULL,
                          voronoiTreemap.control) {

  layout <- match.arg(layout, c("treemap", "voronoi"))

  dimension <- length(z)

  if (layout == "treemap") {

    df <- data.frame(id = seq_len(dimension), value = z)

    # Get treemap rectangles
    tmdf <- treemapify::treemapify(data = df,
                                 area = "value",
                                 layout = algorithm)

    # 'treemapify' returns rectangles as (xmin, xmax, ymin, ymax).
    polygons <-
      lapply(seq_len(nrow(tmdf)),
             function(i) {
               list(id = i,
                    x = c(tmdf$xmin[i], tmdf$xmax[i], tmdf$xmax[i], tmdf$xmin[i]),
                    y = c(tmdf$ymin[i], tmdf$ymin[i], tmdf$ymax[i], tmdf$ymax[i]),
                    gp = NULL)
             })


  } else { # layout == "voronoi"

    df <- data.frame(id = as.character(seq_len(dimension)), weight = z)

    # Replace zero with small value
    df$weight[df$weight == 0] <- .Machine$double.eps

    enclosing <- voronoiTreemap.control$shape
    if (is.null(enclosing)) {
      # Default enclosing polygon is the unit square.
      enclosing <- data.frame(x = c(0, 1, 1, 0), y = c(0, 0, 1, 1))
    } else if (is.list(enclosing)) {
      enclosing <- as.data.frame(enclosing)
      colnames(enclosing) <- c("x", "y")
    } else if (!(enclosing %in% c("rectangle", "rounded_rect",
                                  "circle", "hexagon"))) {
      stop('shape is not a coordinate list, nor one of "rectangle", ',
           '"rounded_rect", "circle", or "hexagon".')
    }

    vt <-
      WeightedTreemaps::voronoiTreemap(data = df,
                                       levels = "id",
                                       shape = enclosing,
                                       cell_size = "weight",
                                       # positioning =
                                       #   if (algorithm == "centroidal") {
                                       #   "regular"
                                       #   } else {
                                       #     "clustered"
                                       # },
                                       filter = voronoiTreemap.control$filter,
                                       maxIteration =
                                         voronoiTreemap.control$maxIteration,
                                       error_tol =
                                         voronoiTreemap.control$error_tol,
                                       convergence =
                                         voronoiTreemap.control$convergence,
                                       seed =
                                         voronoiTreemap.control$seed,
                                       positioning =
                                         voronoiTreemap.control$positioning)

    # Extract the leaf-level cell polygons
    cells <- WeightedTreemaps::get_polygons(vt, levels = 1)

    polygons <- lapply(seq_along(cells), function(i) {
      cell <- cells[[i]]
      cell_st <- sf::st_coordinates(cell)
      list(id = i, x = cell_st[, "X"], y = cell_st[, "Y"],
           gp = NULL)
    })
  }

  list(polygons = polygons)

}

# Fit Polygons Within a Requested Width and Height
normalisePolygons <- function(polygons, x = .5, y = .5,
                              width = 20, height = 20) {

  if (length(polygons) == 0) {
    return(polygons)
  }

  allx <- unlist(lapply(polygons, function(p) p$x))
  ally <- unlist(lapply(polygons, function(p) p$y))

  rx <- range(allx)
  ry <- range(ally)

  # Guard against degenerate (zero-width or zero-height) bounding boxes.
  spanx <- diff(rx)
  spany <- diff(ry)

  if (spanx == 0) {
    spanx <- 1
  }
  if (spany == 0) {
    spany <- 1
  }

  # Scale factors mapping the raw layout coordinates onto the requested
  # width/height (in mm).
  sx <- width  / spanx
  sy <- height / spany

  midx <- mean(rx)
  midy <- mean(ry)

  lapply(polygons, function(p) {

    # Centre on the origin, then scale to the requested physical size.
    px <- (p$x - midx) * sx
    py <- (p$y - midy) * sy

    list(id = p$id,
         x = grid::unit(x, "native") + grid::unit(px, "mm"),
         y = grid::unit(y, "native") + grid::unit(py, "mm"),
         gp = p$gp)
  })

}

# Convert Standard-Representation Polygons into Grid Grobs
polygonListToGrobs <- function(polygons,
                               fill = NULL,
                               col = "grey20",
                               lwd = .5,
                               alpha = 1,
                               linejoin = c("mitre", "round", "bevel")) {

  n <- length(polygons)

  if (n == 0) {
    return(grid::gList(grid::nullGrob()))
  }
#--------------------
  # Check for degenerate polygons (< 3 vertices - cannot form a valid polygon)
  poly_vertex_counts <- sapply(polygons, function(p) length(p$x))
  degenerate_indices <- which(poly_vertex_counts < 3)

  if (length(degenerate_indices) > 0) {
    warning(
      "Found ", length(degenerate_indices), " degenerate polygon(s) with < 3 vertices ",
      "(indices: ", paste(degenerate_indices, collapse = ", "), "). ",
      "These will not be rendered. This may occur with certain boundary shapes ",
      "in Voronoi treemaps (e.g., 'rounded_rect').",
      call. = FALSE
    )

    # Filter out degenerate polygons
    polygons <- polygons[-degenerate_indices]
    n <- length(polygons)

    if (n == 0) {
      return(grid::gList(grid::nullGrob()))
    }
  }
  #--------------------
  # Recycle graphical parameters to one value per polygon.
  recycle <- function(v, default) {
    if (is.null(v)) v <- default
    rep_len(v, n)
  }

  fill <- recycle(fill, NA)
  col <- recycle(col, "grey20")
  lwd <- recycle(lwd, .5)
  alpha <- recycle(alpha, 1)

  # Concatenate all polygon vertex coordinates and build a matching "id"
  xs <- do.call(grid::unit.c, lapply(polygons, function(p) p$x))
  ys <- do.call(grid::unit.c, lapply(polygons, function(p) p$y))

  ids <- unlist(lapply(seq_len(n), function(i) {
    rep(polygons[[i]]$id, length(polygons[[i]]$x))
  }))

  polyGrob <- grid::polygonGrob(x = xs, y = ys, id = ids,
                                gp = grid::gpar(fill = fill,
                                                col = col,
                                                lwd = lwd,
                                                alpha = alpha,
                                                linejoin))

  grid::gList(polyGrob)

}
