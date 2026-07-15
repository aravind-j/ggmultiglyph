#' @param cols A character vector containing the names of at least two columns
#'   specifying the variables to be plotted in the glyphs. The selected columns
#'   must be either numeric or factor variables.
#' @param legend.glyph.dims The dimensions of the legend glyph plot. Can be a
#'   numeric vector of unit length (where all the dimensions will have same
#'   value) or a numeric vector of same length as "cols" with the "cols" as
#'   names.
#' @param ... Other arguments passed on to \code{\link[ggplot2]{layer}()}. These
#'   are often aesthetics, used to set an aesthetic to a fixed value, like
#'   \code{colour = "green"} or \code{size = 3}. They may also be parameters to
#'   the paired geom/stat.
