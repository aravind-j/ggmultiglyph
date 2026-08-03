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

#' Add Bubble Glyphs as a Scatterplot
#'
#' The bubbleglyph geom is used to plot multivariate data as bubble glyphs in a
#' scatterplot. Each variable specified in \code{cols} is depicted as a circle,
#' with the radius (or area) scaled according to the corresponding value.
#'
#' @inheritSection bubbleglyphGrob Layouts
#'
#' @template general-arg
#' @template fill.gradient-arg
#' @template repel-arg
#' @inheritParams ggplot2::layer
#' @inheritParams bubbleglyphGrob
#' @inheritParams bubbleglyphGrob
#' @param colour.bubble The colour of bubbles.
#' @param colour.grid The colour of grid lines.
#' @param linewidth The line width of the circles.
#' @param linewidth.grid The line width of the grid circles.
#' @param fill.bubble The fill colour of the bubbles.
#'
#' @section Aesthetics: \code{geom_bubbleglyph()} understands the following
#'   aesthetics (required aesthetics are in bold): \itemize{ \item{\strong{x}}
#'   \item{\strong{y}} \item{alpha} \item{colour} \item{fill} \item{group}
#'   \item{size} \item{centre.size} }
#'
#'   See \code{vignette("ggplot2-specs", package = "ggplot2")} for further
#'   details on setting these aesthetics.
#'
#'   The following additional aesthetics are considered if \code{repel = TRUE}:
#'   \itemize{ \item{point.size} \item{segment.linetype} \item{segment.colour}
#'   \item{segment.size} \item{segment.alpha} \item{segment.curvature}
#'   \item{segment.angle} \item{segment.ncp} \item{segment.shape}
#'   \item{segment.square} \item{segment.squareShape} \item{segment.inflect}
#'   \item{segment.debug} }
#'
#'   See \code{ggrepel}
#'   \href{https://ggrepel.slowkow.com/articles/examples.html}{examples} page
#'   for further details on setting these aesthetics.
#'
#' @family geoms
#'
#' @return A \code{geom} layer.
#'
#' @importFrom rlang as_quosures syms
#' @importFrom utils modifyList
#' @importFrom ggplot2 layer ggproto aes guide_legend guides
#' @importFrom grid grobTree addGrob makeContent gTree setChildren
#' @export
#'
#' @encoding UTF-8
#'
#' @seealso \code{\link[ggmultiglyph]{bubbleglyphGrob}}
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' \dontshow{ggmultiglyph::.ggmultiglyph_ex_setup()}
#'
#' library(ggplot2)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Prepare the data ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Variables to map to glyphs
#' zs <- c("hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
#'
#' # Keep a copy of the original data
#' mtcars_fct <- mtcars
#'
#' # Scaled numeric data
#' mtcars[zs] <- lapply(mtcars[zs], scales::rescale)
#'
#' mtcars$cyl <- factor(mtcars$cyl)
#' mtcars$lab <- row.names(mtcars)
#'
#' # Ordered factor data
#' mtcars_fct[zs[1:3]] <-
#'   lapply(mtcars_fct[zs[1:3]], function(x)
#'     ordered(cut(x, breaks = 3,
#'                 labels = c("low", "medium", "high"))))
#'
#' mtcars_fct[zs[4:8]] <-
#'   lapply(mtcars_fct[zs[4:8]], function(x)
#'     ordered(cut(x, breaks = 4,
#'                 labels = c("tiny", "small", "medium", "large"))))
#'
#' mtcars_fct$cyl <- factor(mtcars_fct$cyl)
#' mtcars_fct$lab <- row.names(mtcars_fct)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped fill + scaled radius ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped fill + scaled area ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    scale.radius = FALSE, scale.area = TRUE,
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' \donttest{
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped colour + scaled radius ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
#'                    cols = zs, size = 1.5, fill = "white",
#'                    alpha =  0.8, linewidth = 2) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped colour + scaled area ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
#'                    cols = zs, size = 1.5, fill = "white",
#'                    scale.radius = FALSE, scale.area = TRUE,
#'                    alpha =  0.8, linewidth = 2) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Bubble layout variations ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Annulus
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' # Circle
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    layout = "circle",
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' # Line
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    layout = "line",
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' # Chain
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    layout = "chain",
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' # Hub
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    layout = "hub",
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' # Pack
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    layout = "pack",
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Bubbles with multivariate colours ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp),
#'                    cols = zs, size = 1.5,
#'                    fill.bubble = RColorBrewer::brewer.pal(8, "Dark2"),
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Gradient fill ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp),
#'                    cols = zs, size = 1.5,
#'                    fill.gradient = "viridis",
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Faceted ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
#'                    cols = zs, size = 1.5,
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp),
#'                    cols = zs, size = 1.5,
#'                    fill.bubble = RColorBrewer::brewer.pal(8, "Dark2"),
#'                    alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Repel glyphs ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1.5,
#'                    alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, colour = cyl),
#'                    cols = zs, size = 1.5,
#'                    alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Grid lines (ordered factor variables) ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 0.5,
#'                    alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Legend options ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' # Theme modifications for legend
#' legend_theme <-
#'   theme_bw(base_size = 7.5) +
#'   theme(legend.direction = "vertical",
#'         legend.box = "horizontal",
#'         legend.position = "bottom",
#'         legend.text = element_text(margin = margin(l = 7)),
#'         legend.key.height = unit(1, 'lines'))
#'
#' # Glyph variable-wise legends
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1,
#'                    alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   scale_z_continuous(z = zs) +
#'   guide_z_order(z = zs, default_aes = "fill") +
#'   legend_theme
#'
#' # Using custom guide
#' # bubbleglyphGrob
#' guide_bubblegrob <- bubbleglyphGrob(
#'   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33, 0.6, 0.25),
#'   layout = "annulus",
#'   size = 5)
#' # guide_bubblegrob <-
#' #   addlabel.glyphGrob(grob = guide_bubblegrob, label = zs,
#' #                      push = 1, segment = FALSE)
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_bubbleglyph(aes(x = mpg, y = disp, fill = cyl),
#'                    cols = zs, size = 1,
#'                    alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_bubblegrob,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 40, b = 30))))
#' }
#'
geom_bubbleglyph <-
  function(mapping = NULL, data = NULL, stat = "identity",
           position = "identity", ...,
           cols = character(0L),
           scale.radius = TRUE,
           scale.area = FALSE,
           bubble.layout = c("annulus",
                             "circle",
                             "line",
                             "chain",
                             "hub",
                             "pack"),
           connector = c("none", "foreground", "background"),
           fill.bubble = NULL,
           fill.gradient = NULL,
           colour.bubble = NULL,
           colour.grid = NULL,
           linewidth = 1,
           linewidth.grid = linewidth,
           linejoin = c("mitre", "round", "bevel"),
           angle.start = 0,
           angle.stop = 2 * base::pi,
           draw.grid = FALSE,
           legend.glyph.dims = setNames(rep(0.5, length(cols)), cols),
           show.legend = NA,
           repel = FALSE,
           repel.control = ggmultiglyph.repel.control(),
           inherit.aes = TRUE) {

    bubble.layout <- match.arg(bubble.layout)
    connector <- match.arg(connector)

    # Check cols
    if (!(is.character(cols) && length(cols) >= 2)) {
      stop('"cols" should be a charachter vector of at least length 2.')
    }

    if (scale.radius && scale.area) {
      stop(
        'Only one of "scale.radius" and "scale.area" may be TRUE.'
      )
    }

    linejoin <- match.arg(linejoin)

    # Check legend.glyph.dims
    if (is.numeric(legend.glyph.dims) && length(legend.glyph.dims) == 1) {

      legend.glyph.dims <- setNames(rep(legend.glyph.dims, length(cols)), cols)

    } else { # Check if legend.glyph.dims has same length as cols
      if (is.numeric(legend.glyph.dims)
          && length(legend.glyph.dims) == length(cols)) {

        # Check names of legend.glyph.dims
        if (!(all(names(legend.glyph.dims) %in% cols)
              && all(cols %in% names(legend.glyph.dims)))) {
          stop('Names specified in "legend.glyph.dims" and "cols" ',
               'do not match.')
        }

      } else {
        stop('"legend.glyph.dims" should be a numeric vector of unit ',
             'length or a numeric vector of same length as "cols" ',
             'with the "cols" as names.')
      }
    }

    # Modify mapping to include cols
    mcols <- rlang::as_quosures(rlang::syms(cols), .GlobalEnv)
    names(mcols) <- cols
    mapping <- modifyList(mapping, mcols)

    params <- list(
      scale.radius = scale.radius,
      scale.area = scale.area,
      bubble.layout = bubble.layout,
      connector = connector,
      fill.bubble = fill.bubble,
      fill.gradient = fill.gradient,
      colour.bubble = colour.bubble,
      colour.grid = colour.grid,
      linewidth = linewidth,
      linewidth.grid = linewidth.grid,
      linejoin = linejoin,
      angle.start = angle.start,
      angle.stop = angle.stop,
      draw.grid = draw.grid,
      cols = cols,
      repel = repel,
      box.padding = unit(repel.control$box.padding, "lines"),
      point.padding = unit(repel.control$point.padding, "lines"),
      min.segment.length = unit(repel.control$min.segment.length, "lines"),
      arrow = repel.control$arrow,
      force = repel.control$force,
      force_pull = repel.control$force_pull,
      max.time = repel.control$max.time,
      max.iter = repel.control$max.iter,
      max.overlaps = repel.control$max.overlaps,
      nudge_x = repel.control$nudge_x,
      nudge_y = repel.control$nudge_y,
      xlim = repel.control$xlim,
      ylim = repel.control$ylim,
      direction = repel.control$direction,
      seed = repel.control$seed,
      verbose = repel.control$verbose,
      ...)

    # Modify geom aesthetics to include cols
    geomout <-
      ggplot2::ggproto(NULL, GeomBubbleGlyph,
                       required_aes = c(GeomBubbleGlyph$required_aes,
                                        cols),
                       default_aes = {
                         aes_new <- c(GeomBubbleGlyph$default_aes,
                                      legend.glyph.dims)
                         class(aes_new) <- "uneval"
                         aes_new
                       })

    ggplot2::layer(
      data = data,
      mapping = mapping,
      stat = stat,
      geom = geomout,
      position = position,
      show.legend = show.legend,
      inherit.aes = inherit.aes,
      params = params)

  }

GeomBubbleGlyph <-
  ggplot2::ggproto(
    "GeomBubbleGlyph", ggplot2::Geom,
    required_aes = c("x", "y"),
    default_aes = ggplot2::aes(colour = "black",
                               size = 1,
                               fill = NA,
                               alpha = 1,
                               centre.size = 0.5,
                               # repel aes
                               point.size = 1,
                               segment.linetype = 1,
                               segment.colour = NULL,
                               segment.size = 0.5,
                               segment.alpha = NULL,
                               segment.curvature = -1e-20,
                               segment.angle = 20,
                               segment.ncp = 3,
                               segment.shape = 0.5,
                               segment.square = TRUE,
                               segment.squareShape = 1,
                               segment.inflect = FALSE,
                               segment.debug = FALSE),

    setup_params = function(data, params) {

      # Precompute factor levels for each col for use in draw_key
      if (params$draw.grid) {
        cols <- params$cols

        params$col_levels <- lapply(cols, function(cn) {
          if (is.factor(data[[cn]])) levels(data[[cn]]) else NULL
        })
        names(params$col_levels) <- cols

      }

      params
    },

    setup_data = function(data, params) {

      cols <- params$cols

      # Check if "cols" exist in data
      if (FALSE %in% (cols %in% colnames(data))) {
        stop(paste('The following column(s) specified as "cols" are not ',
                   'present in "data":\n',
                   paste(cols[!(cols %in% colnames(data))],
                         collapse = ", "),
                   sep = ""))
      }

      # Check if cols are numeric or factor
      intfactcols <-
        vapply(data[, cols],
               function(x) {
                 !(is.integer(x) || is.numeric(x) || is.factor(x))
               },
               logical(1))

      if (TRUE %in% intfactcols) {
        stop('The following column(s) specified as "cols" in ',
             '"data" are not of type numeric, integer or factor:\n',
             paste(names(intfactcols[intfactcols]), collapse = ", "))
      }

      draw.grid <- params$draw.grid

      if (draw.grid &
          !all(vapply(data[, cols],
                      function(x) is.factor(x) && is.ordered(x),
                      logical(1)))) {
        draw.grid <- FALSE
        warning(
          'Not all columns specified in "cols" are ordered factors.\n',
          'Unable to plot grid levels.'
        )
      }

      # Remove rows with missing values in "cols"
      # check for missing values
      missvcols <- unlist(lapply(data[, cols], function(x) TRUE %in% is.na(x)))
      if (TRUE %in% missvcols) {
        warning(paste('The following column(s) in "data" have missing ',
                      'values:\n',
                      paste(names(missvcols[missvcols]), collapse = ", ")))

        data <- remove_missing(df = data, vars = cols)
      }

      # Check if fill.bubble are valid
      if (!is.null(params$fill.bubble)) {
        if (length(params$fill.bubble) != length(cols))
          stop('The number of colours specified in',
               '"fill.bubble" are not equal to the number',
               'of variables specified in "cols".')

        if (!all(iscolour(params$fill.bubble))) {
          stop('Invalid colour(s) specified in "fill.bubble".')
        }

        data$fill <- NULL
      }

      # Check if colour.bubble are valid
      if (!is.null(params$colour.bubble)) {
        if (length(params$colour.bubble) != length(cols))
          stop('The number of colours specified in',
               '"colour.bubble" are not equal to the number',
               'of variables specified in "cols".')

        if (!all(iscolour(params$colour.bubble))) {
          stop('Invalid colour(s) specified in "colour.bubble".')
        }

        data$colour <- NULL
      }

      data$linewidth <- params$linewidth
      data$linewidth.grid <- params$linewidth.grid
      data$linejoin <- params$linejoin
      data

    },

    draw_panel = function(data, panel_params,
                          coord, cols,
                          scale.radius,
                          scale.area,
                          bubble.layout,
                          connector,
                          fill.bubble,
                          fill.gradient,
                          colour.bubble,
                          colour.grid,
                          linewidth,
                          linewidth.grid,
                          linejoin,
                          angle.start,
                          angle.stop,
                          draw.grid,
                          repel,
                          point.size,
                          box.padding,
                          point.padding,
                          min.segment.length,
                          arrow,
                          force,
                          force_pull,
                          max.time,
                          max.iter,
                          max.overlaps,
                          nudge_x,
                          nudge_y,
                          xlim,
                          ylim,
                          direction,
                          seed,
                          verbose) {

      # if needed rename columns using our convention
      for (this_dim in c("x", "y")) {
        this_orig <- sprintf("%s_orig", this_dim)
        this_nudge <- sprintf("nudge_%s", this_dim)
        if (!this_nudge %in% colnames(data)) {
          data[[this_nudge]] <- data[[this_dim]]
          if (this_orig %in% colnames(data)) {
            data[[this_dim]] <- data[[this_orig]]
            data[[this_orig]] <- NULL
          }
        }
      }

      # Transform the nudges to the panel scales.
      nudges <- data.frame(x = data$nudge_x, y = data$nudge_y)
      nudges <- coord$transform(nudges, panel_params)

      data <- coord$transform(data, panel_params)

      astrt <- angle.start
      astp <- angle.stop

      grid.levels <- NULL

      # Convert factor columns to equivalent numeric
      if (draw.grid) {
        grid.levels <-
          lapply(data[, cols], function(a) {
            as.integer(levels(as.factor(as.integer(a))))
          })
        data[, cols] <- lapply(data[, cols], function(a) as.integer(a))
      }

      # Gradient colour mapping
      gdata <- NULL
      if (is.null(fill.bubble) & !is.null(fill.gradient)) {
        gdata <- data[, cols]

        gdata <-
          lapply(gdata,
                 function(x) {
                   scales::col_numeric(palette = fill.gradient,
                                       domain = min(x):max(x))(x)
                 })
        gdata <- data.frame(gdata)
      }

      # The nudge is relative to the data.
      data$nudge_x <- nudges$x - data$x
      data$nudge_y <- nudges$y - data$y

      # Transform limits to panel scales.
      limits <- data.frame(x = xlim, y = ylim)
      limits <- coord$transform(limits, panel_params)

      # Allow Inf.
      if (length(limits$x) == length(xlim)) {
        limits$x[is.infinite(xlim)] <- xlim[is.infinite(xlim)]
      }
      if (length(limits$y) == length(ylim)) {
        limits$y[is.infinite(ylim)] <- ylim[is.infinite(ylim)]
      }

      # Fill NAs with defaults.
      limits$x[is.na(limits$x)] <- c(0, 1)[is.na(limits$x)]
      limits$y[is.na(limits$y)] <- c(0, 1)[is.na(limits$y)]

      ggname("geom_bubbleglyph",
             grid::gTree(data = data,
                         cols = cols,
                         scale.radius = scale.radius,
                         scale.area = scale.area,
                         bubble.layout = bubble.layout,
                         connector = connector,
                         # fill = fill,
                         fill.gradient = fill.gradient,
                         fill.bubble = fill.bubble,
                         colour.bubble = colour.bubble,
                         # colour = colour,
                         # alpha = alpha,
                         colour.grid = colour.grid,
                         linewidth = linewidth,
                         linewidth.grid = linewidth.grid,
                         linejoin = linejoin,
                         astrt = astrt,
                         astp = astp,
                         astrt = astrt,
                         astp = astp,
                         gdata = gdata,
                         grid.levels = grid.levels,
                         draw.grid = draw.grid,
                         colour.grid = colour.grid,
                         repel = repel,
                         limits = limits,
                         box.padding = box.padding,
                         point.padding = point.padding,
                         min.segment.length = min.segment.length,
                         arrow = arrow,
                         force = force,
                         force_pull = force_pull,
                         max.time = max.time,
                         max.iter = max.iter,
                         max.overlaps = max.overlaps,
                         nudge_x = nudge_x,
                         nudge_y = nudge_y,
                         xlim = xlim,
                         ylim = ylim,
                         direction = direction,
                         seed = seed,
                         verbose = verbose,
                         cl = "bubbleglyphtree"))

      # ggname("geom_bubbleglyph",
      #        grid::gTree(
      #          children = grid::gList(
      #            grid::pointsGrob(x = data$x,
      #                             y = data$y,
      #                             default.units = "native",
      #                             pch = 20,
      #                             gp = grid::gpar(col = data$colour,
      #                                             fill = data$fill))
      #          )))
    },

    draw_key = function(data, params, size) {

      astrt <- params$angle.start
      astp <- params$angle.stop

      grid.levels <- NULL
      if (params$draw.grid) {

        vals <- data[, params$cols, drop = FALSE]

        vals[] <- Map(function(x, cn) {
          if (is.character(x) || is.factor(x)) {
            lvls <- params$col_levels[[cn]]
            if (!is.null(lvls)) {
              match(as.character(x), lvls)
            } else {
              as.numeric(factor(x, levels = unique(x)))
            }
          } else {
            x
          }
        }, vals, names(vals))

        grid.levels <- lapply(vals, function(a) seq_len((ceiling(a))))
        names(grid.levels) <- params$cols
      }

      bubbleglyphGrob(
        x = .5,
        y = .5,
        z = if (params$draw.grid) {
          unlist(ceiling(vals))
        } else {
          unlist(data[, params$cols])
        },
        size = data$size,
        scale.radius = params$scale.radius,
        scale.area = params$scale.area,
        bubble.layout = params$bubble.layout,
        connector = params$connector,
        col = if (is.null(params$colour.bubble)) {
          data$colour
        } else {
          params$colour.bubble
        },
        fill = if (is.null(params$fill.bubble)) {
          data$fill
        } else {
          params$fill.bubble
        },
        lwd = params$linewidth,
        alpha = data$alpha,
        angle.start = astrt,
        angle.stop = astp,
        linejoin = params$linejoin,
        draw.grid = params$draw.grid,
        grid.levels = grid.levels,
        col.grid = if (is.null(params$colour.grid)) {
          data$colour
        } else {
          params$colour.grid
        },
        lwd.grid = params$linewidth.grid
      )
    }
  )

#' grid::makeContent function for the grobTree of bubbleglyphGrob objects
#' @param x A grid grobTree.
#' @export
#' @noRd
makeContent.bubbleglyphtree <- function(x) {

  g <- x

  if (g$repel) {

    repel.debug <- getOption("ggmultiglyph.repel.debug", default = FALSE)

    # The padding around each bounding box.
    box_padding_x <- grid::convertWidth(g$box.padding, "native",
                                        valueOnly = TRUE)
    box_padding_y <- grid::convertHeight(g$box.padding, "native",
                                         valueOnly = TRUE)

    # The padding around each point.
    if (is.na(g$point.padding)) {
      g$point.padding = unit(0, "lines")
    }

    # Minimal Original glyph grob
    glorg <- lapply(seq_along(g$data$x),
                    function(i) {
                      bubbleglyphGrob(x = g$data$x[i],
                                      y = g$data$y[i],
                                      z = unlist(g$data[i, g$cols]),
                                      size = g$data$size[i],
                                      scale.radius = g$scale.radius,
                                      scale.area = g$scale.area,
                                      bubble.layout = g$bubble.layout,
                                      connector = g$connector,
                                      col = "gray",
                                      lwd = g$data$linewidth[i],
                                      angle.start = g$astrt,
                                      angle.stop = g$astp,
                                      linejoin = g$data$linejoin[i],
                                      draw.grid = FALSE)
                    })
    glorg <- lapply(seq_along(g$data$x),
                    function(i) glorg[[i]]$children[[1]])

    # Create a dataframe with x1 y1 x2 y2 - Computed from bounding box
    boxes <- lapply(seq_along(glorg), function(i) {
      x1 <- grid::convertWidth(boxdim(glorg[[i]]$x, "min"), "native", TRUE)
      x2 <- grid::convertWidth(boxdim(glorg[[i]]$x, "max"), "native", TRUE)
      y1 <- grid::convertHeight(boxdim(glorg[[i]]$y, "min"), "native", TRUE)
      y2 <- grid::convertHeight(boxdim(glorg[[i]]$y, "max"), "native", TRUE)
      c(
        "x1" = x1 - box_padding_x + g$nudge_x,
        "y1" = y1 - box_padding_y + g$nudge_y,
        "x2" = x2 + box_padding_x + g$nudge_x,
        "y2" = y2 + box_padding_y + g$nudge_y
      )
    })

    if (repel.debug) {
      # Bounding box grob
      boxes2 <- data.frame(do.call(rbind, boxes))
      bboxg <- lapply(seq_along(boxes2$x1), function(i) {
        grid::polylineGrob(x = c(boxes2$x1[i], boxes2$x1[i], boxes2$x2[i],
                                 boxes2$x2[i], boxes2$x1[i]),
                           y = c(boxes2$y1[i], boxes2$y2[i], boxes2$y2[i],
                                 boxes2$y1[i], boxes2$y1[i]),
                           gp = gpar(col = "gray"))
      })
    }

    # Make the repulsion reproducible if desired.
    if (is.null(g$seed) || !is.na(g$seed)) {
      set.seed(g$seed)
    }

    # The points are represented by circles.
    g$data$point.size[is.na(g$data$point.size)] <- 0

    # Beware the magic numbers. I do not understand them.
    # I just accept them as necessary to get the code to work.
    p_width <- grid::convertWidth(unit(1, "npc"), "inch", TRUE)
    p_height <- grid::convertHeight(unit(1, "npc"), "inch", TRUE)
    p_ratio <- (p_width / p_height)
    if (p_ratio > 1) {
      p_ratio <- p_ratio ^ (1 / (1.15 * p_ratio))
    }
    point_size <- p_ratio * grid::convertWidth(
      grid::unit(g$data$point.size, "lines"), "native", valueOnly = TRUE
    ) / 13
    point_padding <- p_ratio * grid::convertWidth(
      grid::unit(g$point.padding, "lines"), "native", valueOnly = TRUE
    ) / 13

    # Repel overlapping bounding boxes away from each other.
    repel <- repel_boxes2(
      data_points = as.matrix(g$data[, c("x", "y")]),
      point_size = point_size,
      point_padding_x = point_padding,
      point_padding_y = point_padding,
      boxes = do.call(rbind, boxes),
      xlim = range(g$limits$x),
      ylim = range(g$limits$y),
      hjust = rep(0.5, nrow(g$data)),
      vjust = rep(0.5, nrow(g$data)),
      force_push = g$force * 1e-6,
      force_pull = g$force_pull * 1e-2,
      max_time = g$max.time,
      max_iter = ifelse(is.infinite(g$max.iter), 1e9, g$max.iter),
      max_overlaps = g$max.overlaps,
      direction = g$direction,
      verbose = g$verbose
    )

    if (any(repel$too_many_overlaps)) {
      warning(sum(repel$too_many_overlaps, na.rm = TRUE),
              ' glyphs have too many overlaps.\nConsider increasing ',
              '"max.overlaps"')
    }

    # create segment grobs
    segg <- lapply(seq_along(g$data$x), function(i) {

      if (!repel$too_many_overlaps[i]) {
        row <- g$data[i, , drop = FALSE]
        grid::curveGrob(x1 = repel[i, ]$x, y1 = repel[i, ]$y,
                        x2 = row$x, y2 = row$y,
                        default.units = "native",
                        curvature = row$segment.curvature,
                        angle = row$segment.angle,
                        ncp = row$segment.ncp,
                        shape = row$segment.shape,
                        square = row$segment.square,
                        squareShape = row$segment.squareShape,
                        inflect = row$segment.inflect,
                        debug = row$segment.debug,
                        gp = gpar(col = row$segment.colour,
                                  lwd = row$segment.size * ggplot2::.pt,
                                  lty = row$segment.linetype),
                        arrow = row$arrow)
      } else {
        grid::nullGrob()
      }
    })

  }

  gl <- lapply(seq_along(g$data$x),
               function(i) {
                 bubbleglyphGrob(x = if (g$repel) {
                   repel$x[i]
                 } else {
                   g$data$x[i]
                 },
                 y = if (g$repel) {
                   repel$y[i]
                 } else {
                   g$data$y[i]
                 },
                 z = unlist(g$data[i, g$cols]),
                 size = g$data$size[i],
                 scale.radius = g$scale.radius,
                 scale.area = g$scale.area,
                 bubble.layout = g$bubble.layout,
                 connector = g$connector,
                 lwd = g$data$linewidth[i],
                 angle.start = g$astrt,
                 angle.stop = g$astp,
                 linejoin = g$data$linejoin[i],
                 col = if (is.null(g$colour.bubble)) {
                   g$data$colour[i]
                 } else {
                   g$colour.bubble
                 },
                 fill = if (is.null(g$fill.bubble)) {
                   if (!is.null(g$fill.gradient)) {
                     unlist(g$gdata[i, ])
                   } else {
                     g$data$fill[i]
                   }
                 } else {
                   g$fill.bubble
                 },
                 alpha = g$data$alpha[i],
                 grid.levels = g$grid.levels,
                 draw.grid = g$draw.grid,
                 col.grid = if (is.null(g$colour.grid)) {
                   g$data$colour[i]
                 } else {
                   g$colour.grid
                 },
                 lwd.grid = g$data$linewidth.grid[i])
               })

  if (g$repel) {

    if (repel.debug) {

      gl <- lapply(seq_along(gl), function(i) {
        grid::addGrob(gl[[i]], glorg[[i]])
      })

      gl <- lapply(seq_along(gl), function(i) {
        grid::addGrob(gl[[i]], bboxg[[i]])
      })

      gl <- lapply(seq_along(gl), function(i) {
        grid::addGrob(gl[[i]], segg[[i]])
      })

      # reorder grobs
      gl <- lapply(seq_along(gl),
                   function(i) grid::reorderGrob(gl[[i]], c(4:6, 1:3)))

    } else {

      gl <- lapply(seq_along(gl), function(i) grid::addGrob(gl[[i]], segg[[i]]))

      # reorder grobs

      gl <-
        lapply(seq_along(gl),
               function(i) {
                 n_children <- length(gl[[i]]$children)
                 grid::reorderGrob(gl[[i]],
                                   c(n_children, seq_len(n_children - 1)))
               })
      # gl <- lapply(seq_along(gl),
      #              function(i) grid::reorderGrob(gl[[i]], c(4, 1:3)))

    }

  }

  gl <- do.call(grid::gList, gl)

  grid::setChildren(g, gl)
}
