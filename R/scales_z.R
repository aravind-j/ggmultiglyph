#' Alter scales for continuous data mapped to glyphs
#'
#' Scale variable(s) mapped to the glyphs to the given range using
#' \code{\link[scales]{rescale_pal}}.
#'
#' @param ... Additional arguments to be passed on to
#'   \code{\link[ggplot2]{continuous_scale}}.
#' @param range The range to which the variable(s) specified in argument
#'   \code{z} are to be scaled.
#' @param palette One of the following:
#' \itemize{
#'   \item \code{NULL} for the default palette stored in the theme.
#'   \item a character vector of colours.
#'   \item a single string naming a palette.
#'   \item a palette function that when called with a numeric vector with
#'   values between 0 and 1 returns the corresponding output values.
#' }
#' @param guide A function used to create a guide or its name. See
#'   \code{\link[ggplot2]{guides}}for more information.
#' @param z The variable(s) mapped to the glyph as a character vector.
#'
#' @name scales_z
#' @rdname scales_z
#'
#' @importFrom scales rescale_pal
#' @importFrom ggplot2 continuous_scale discrete_scale guide_colourbar guide_coloursteps scale_color_continuous scale_color_distiller scale_color_viridis_c
#'
NULL

# scale_z_continuous ----
#' @rdname scales_z
#' @export
#'
scale_z_continuous <- function(..., range = c(0.1, 1), z) {
  continuous_scale(
    aesthetics = z,
    scale_name = "z_continuous",
    palette = scales::rescale_pal(range),
    ...
  )
}

# scale_z_discrete ----
#' @rdname scales_z
#' @export
#'
scale_z_discrete <- function(..., z, na.translate = TRUE, na.value = NA,
                             guide = "legend") {
  # Handle both single variable and vector of variables
  z <- as.character(z)

  dots <- list(...)

  make_one <- function(var) {
    do.call(discrete_scale, c(
      list(
        aesthetics = var,
        scale_name = "z_discrete",
        palette = scales::identity_pal(),
        na.translate = na.translate,
        na.value = na.value,
        guide = guide,
        super = ScaleDiscreteZIdentity
      ),
      dots
    ))
  }

  if (length(z) == 1) {
    # Single variable: return a single discrete scale
    make_one(z)
  } else {
    # Multiple variables: return a list of scales, one per variable
    lapply(z, make_one)
  }
}


#
# scale_z_discrete <- function(..., palette = seq_len, z) {
#   discrete_scale(
#     aesthetics = z,
#     scale_name = "z_discrete",
#     palette = palette,
#     ...
#   )
# }

# scale_z_discrete <- function(..., name = waiver(),palette = seq_len,
#                              expand = waiver(), guide = waiver(), z) {
#   discrete_scale(
#     aesthetics = z,
#     scale_name = "z_discrete",
#     palette = palette,
#     name = name,
#     expand = expand,
#     guide = guide,
#     ...
#   )
# }

# scale_z_fill_continuous ----
#' @rdname scales_z
#' @export
#'
scale_z_fill_continuous <- function(..., palette, z,
                                    guide = c("legend")) {

  rcb <- c("Blues", "BuGn", "BuPu", "GnBu", "Greens", "Greys", "Oranges", "OrRd", "PuBu",
           "PuBuGn", "PuRd", "Purples", "RdPu", "Reds", "YlGn", "YlGnBu", "YlOrBr", "YlOrRd",
           "Accent", "Dark2", "Paired", "Pastel1", "Pastel2", "Set1", "Set2", "Set3",
           "BrBG", "PiYG", "PRGn", "PuOr", "RdBu", "RdGy", "RdYlBu", "RdYlGn", "Spectral")
  rcb_num <- 1:18
  v <- c("magma", "inferno", "plasma", "viridis", "cividis", "rocket", "mako", "turbo",
         "A", "B", "C", "D", "E", "F", "G", "H")

  if (guide == "colorbar") {
    guide = "colourbar"
  }

  if (guide == "colorsteps") {
    guide = "coloursteps"
  }

  guide <- match.arg(guide, c("legend", "colourbar", "coloursteps"))

  if (guide == "colourbar") {
    guide = guide_colourbar(available_aes = z)
  }

  if (guide == "coloursteps") {
    guide = guide_coloursteps(available_aes = z)
  }

  if(any(palette == rcb) | any(palette == rcb_num)){
    scale_color_distiller(palette= palette, aesthetics = z, guide = guide, ...)
  } else if(any(palette == v)){
    scale_color_viridis_c(option= palette, aesthetics = z, guide = guide, ...)
  } else{
    scale_color_continuous(type= palette, aesthetics = z, guide = guide, ...)
  }

}
