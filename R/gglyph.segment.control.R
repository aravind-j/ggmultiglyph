#' Control Parameters for Drawing Curved Connecting Segments
#'
#' Set the contol parameters for drawing xurved segments connecting grobs to
#' labels in \code{\link[gglyph]{addlabel.glyphGrob}}.
#'
#' @param nudge_x,nudge_y Horizontal and vertical adjustments to nudge the
#'   starting position of each glyph. The units for \code{nudge_x} and
#'   \code{nudge_y} are the same as for the data units on the x-axis and y-axis.
#' @param xlim,ylim Limits for the x and y axes. Glyphs will be constrained to
#'   these limits. By default, glyphs are constrained to the entire plot area.
#' @param box.padding Amount of padding around bounding box, as unit or number.
#'   Defaults to 0.25. (Default unit is lines, but other units can be specified
#'   by passing \code{unit(x, "units")}).
#' @param point.padding Amount of padding around labeled point, as unit or
#'   number. Defaults to 0. (Default unit is lines, but other units can be
#'   specified by passing \code{unit(x, "units")}).
#' @param min.segment.length Skip drawing segments shorter than this, as unit or
#'   number. Defaults to 0.5. (Default unit is lines, but other units can be
#'   specified by passing \code{unit(x, "units")}).
#' @param arrow specification for arrow heads, as created by
#'   \code{\link[grid]{arrow}}.
#' @param force Force of repulsion between overlapping glyphs. Defaults to 1.
#' @param force_pull Force of attraction between a glyph and its corresponding
#'   data point. Defaults to 1.
#' @param max.time Maximum number of seconds to try to resolve overlaps.
#'   Defaults to 0.5.
#' @param max.iter Maximum number of iterations to try to resolve overlaps.
#'   Defaults to 10000.
#' @param max.overlaps Exclude glyphs that overlap too many things. Defaults to
#'   10.
#' @param direction "both", "x", or "y" -- direction in which to adjust position
#'   of glyphs.
#' @param seed Random seed passed to \code{\link[base]{set.seed}}. Defaults to
#'   \code{NA}, which means that \code{set.seed} will not be called.
#' @param verbose If \code{TRUE}, some diagnostics of the repel algorithm are
#'   printed.
#' @param segment.curvature Numeric, negative for left-hand and positive for
#'   right-hand curves, 0 for straight lines. Defaults to 0.
#' @param segment.angle 0-180, less than 90 skews control points toward the
#'   start point. Defaults to 90.
#' @param segment.ncp Number of control points to make a smoother curve.
#'   Defaults to 1.
#' @param segment.shape Curve shape by control points
#'   approximation/interpolation (1 for cubic B-spline, -1 for Catmull-Rom
#'   spline). Defaults to 0.5.
#' @param segment.square \code{TRUE} to place control points in city-block
#'   fashion, \code{FALSE} for oblique placement. Default is \code{TRUE}.
#' @param segment.squareShape Shape of the curve relative to additional control
#'   points inserted if square is \code{TRUE}. Defaults to 1.
#' @param segment.inflect Curve inflection at the midpoint. Default is
#'   \code{FALSE}.
#' @param segment.debug Display the curve debug information. Default is
#'   \code{FALSE}.
#' @param segment.colour The line segment color. Default is \code{"black"}.
#' @param segment.size The line segment thickness. Default is 0.5 mm.
#' @param segment.linetype The line segment solid, dashed, etc. Default is 1
#'   (solid).
#' @param segment.arrow Render line segment as an arrow with
#'   \code{grid::arrow()}.
#'
#'
#' @return A list with the following components to control the repel algorithm
#'   corresponding to the same in \strong{Arguments}. \item{segment.curvature}{}
#'   \item{segment.angle}{} \item{segment.ncp}{} \item{segment.shape}{}
#'   \item{segment.square}{} \item{segment.squareShape}{}
#'   \item{segment.inflect}{} \item{segment.debug}{}
#'   \item{segment.colour}{} \item{segment.size}{} \item{segment.linetype}{}
#'   \item{segment.arrow}{}
#'
#' @encoding UTF-8
#'
#' @seealso \code{\link[ggrepel]{addlabel.glyphGrob}}
#'
#' @export
#'
#' @export
gglyph.segment.control <- function(segment.curvature = 0,
                                   segment.angle = 90,
                                   segment.ncp = 1,
                                   segment.shape = 0.5,
                                   segment.square = TRUE,
                                   segment.squareShape = 1,
                                   segment.inflect = FALSE,
                                   segment.debug = FALSE,
                                   segment.colour = "black",
                                   segment.size = 0.2,
                                   segment.linetype = 1,
                                   segment.arrow = NULL) {

  out <- list(segment.curvature = 0,
              segment.angle = 90,
              segment.ncp = 1,
              segment.shape = 0.5,
              segment.square = TRUE,
              segment.squareShape = 1,
              segment.inflect = FALSE,
              segment.debug = FALSE,
              segment.colour = "black",
              segment.size = 0.2,
              segment.linetype = 1,
              segment.arrow = NULL)

  return(out)

}
