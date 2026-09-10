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
#' Control Parameters for Vornoi Treemaps
#'
#' Set the contol parameters for drawing vornoi treemaps in
#' \code{\link[ggmultiglyph]{treemapglyphGrob}}.
#'
#' @inheritParams WeightedTreemaps::voronoiTreemap
#'
#' @return A list with the following components to control the repel algorithm
#'   corresponding to the same in \strong{Arguments}. \item{sort}{}
#'   \item{filter}{} \item{shape}{} \item{maxIteration}{} \item{error_tol}{}
#'   \item{convergence}{} \item{seed}{} \item{positioning}{}
#'
#' @encoding UTF-8
#'
#' @seealso \code{\link[ggmultiglyph]{treemapglyphGrob}}
#'
#' @export
ggmultiglyph.voronoiTreemap.control <-
  function(sort = FALSE,
           filter = 0,
           shape = "rectangle",
           maxIteration = 50,
           error_tol = 0.05,
           convergence = "intermediate",
           seed = 123,
           positioning = "regular") {

    list(filter = filter,
         shape = shape,
         maxIteration = maxIteration,
         error_tol = error_tol,
         convergence = convergence,
         seed = seed,
         positioning = positioning)

  }
