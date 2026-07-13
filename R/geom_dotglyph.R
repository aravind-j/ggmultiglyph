#' Add Dot Profile Glyphs as a Scatterplot
#'
#' The dotglyph geom is used to plot multivariate data as dot profile glyphs
#' \insertCite{chambers_graphical_1983,dutoit_graphical_1986}{ggmultiglyph} in a
#' scatterplot.
#'
#' @template general-arg
#' @template fill.gradient-arg
#' @template repel-arg
#' @inheritParams ggplot2::layer
#' @inheritParams starglyphGrob
#' @inheritParams dotglyphGrob
#' @param fill.dot The fill colour of the stacked dots.
#' @param linewidth The line width of the dot glyphs.
#'
#' @section Aesthetics: \code{geom_dotglyph()} understands the following
#'   aesthetics (required aesthetics are in bold): \itemize{ \item{\strong{x}}
#'   \item{\strong{y}} \item{alpha} \item{colour} \item{fill} \item{group} }
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
#' @importFrom Rdpack reprompt
#' @export
#'
#' @seealso \code{\link[ggmultiglyph]{dotglyphGrob}}
#'
#' @references
#'
#' \insertAllCited{}
#'
#' @examples
#'
#' \dontshow{ggmultiglyph:::.ggmultiglyph_ex_setup()}
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
#' # Mapped fill ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 flip.axes = TRUE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE, flip.axes = TRUE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped colour ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, colour = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, colour = cyl),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, colour = cyl),
#'                 cols = zs, radius = 0.5,
#'                 flip.axes = TRUE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, colour = cyl),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE, flip.axes = TRUE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Multivariate fill colours ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 flip.axes = TRUE,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE, flip.axes = TRUE,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Gradient fill ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 fill.gradient = "Greens",
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 fill.gradient = "Blues",
#'                 mirror = FALSE,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 flip.axes = TRUE,
#'                 fill.gradient = "RdYlBu",
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE, flip.axes = TRUE,
#'                 fill.gradient = "viridis",
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Faceted ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp, colour = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 fill.gradient = "viridis",
#'                 alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Repel glyphs ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_dotglyph(aes(x = mpg, y = disp, colour = cyl),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE,
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp)) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 flip.axes = TRUE,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp)) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 mirror = FALSE, flip.axes = TRUE,
#'                 fill.gradient = "viridis",
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Legend options ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Default legend/guide
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' # Theme modifications for legend
#' legend_theme <-
#'   theme_bw(base_size = 7.5) +
#'   theme(legend.direction = "vertical",
#'         legend.box = "horizontal",
#'         legend.position = "bottom",
#'         legend.text = element_text(margin = margin(l = 7)),
#'         legend.key.height = unit(1.5, 'lines'))
#'
#' # Glyph variable-wise legends
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   scale_z_discrete(z = zs) +
#'   guide_z_order(z = zs, default_aes = "fill") +
#'   legend_theme
#'
#'
#' # Modifying the `legend.glyph.dims`
#' z_grid <- c(hp = 3, drat = 3, wt = 2,
#'             qsec = 2, vs = 3, am = 4,
#'             gear = 2, carb = 3)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  1, repel = TRUE,
#'                 legend.glyph.dims = z_grid) +
#'   ylim(c(-0, 550))
#'
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5,
#'                 alpha =  1, repel = TRUE,
#'                 legend.glyph.dims = z_grid) +
#'   ylim(c(-0, 550)) +
#'   scale_z_discrete(z = zs) +
#'   guide_z_order(z = zs, default_aes = "fill") +
#'   legend_theme
#'
#' # Using custom guide
#' # dotglyphGrob
#' guide_dotgrob <-
#'   dotglyphGrob(z = z_grid, radius = 2.5)
#' # Add labels to starglyphGrob
#' guide_dotgrob <-
#'   addlabel.glyphGrob(grob = guide_dotgrob, label = zs,
#'                      push = 3, segment = FALSE,
#'                      angle = 45, hjust = 1)
#'
#' # Another version
#' guide_dotgrob2 <-
#'   dotglyphGrob(z = rep(3, length(z_grid)), radius = 2,
#'                mirror = TRUE)
#' guide_dotgrob2 <-
#'   addlabel.glyphGrob(grob = guide_dotgrob2, label = zs,
#'                      push = 8, segment = TRUE,
#'                      angle = 45, hjust = 1)
#'
#' # Multivariate colour version
#' clrs <- mapply(function(a, b) rep(a, b),
#'                RColorBrewer::brewer.pal(8, "Dark2"),
#'                rep(3, 8))
#' clrs <- unlist(clrs)
#'
#' guide_dotgrob_mcol <-
#'   dotglyphGrob(z = rep(3, length(z_grid)), radius = 2,
#'                mirror = TRUE,
#'                fill = clrs)
#' guide_dotgrob_mcol <-
#'   addlabel.glyphGrob(grob = guide_dotgrob_mcol, label = zs,
#'                      push = 8, segment = FALSE,
#'                      angle = 45, hjust = 1)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5, mirror = FALSE,
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_dotgrob,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 30, b = 20))))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_dotglyph(aes(x = mpg, y = disp, fill = cyl),
#'                 cols = zs, radius = 0.5, mirror = TRUE,
#'                 alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_dotgrob2,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 5, b = 30))))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_point(aes(x = mpg, y = disp), show.legend = FALSE) +
#'   geom_dotglyph(aes(x = mpg, y = disp),
#'                 cols = zs, radius = 0.5,
#'                 fill.dot = RColorBrewer::brewer.pal(8, "Dark2"),
#'                 alpha = 1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_dotgrob_mcol,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 5, b = 30))))
#'
geom_dotglyph <-
  function(mapping = NULL, data = NULL, stat = "identity",
           position = "identity", ...,
           cols = character(0L),
           radius = 1,
           fill.dot = NULL,
           fill.gradient = NULL,
           linewidth = 1,
           mirror = TRUE,
           flip.axes = FALSE,
           legend.glyph.dims = setNames(rep(1, length(cols)), cols),
           show.legend = NA,
           repel = FALSE,
           repel.control = ggmultiglyph.repel.control(),
           inherit.aes = TRUE) {

    # Check cols
    if (!(is.character(cols) && length(cols) >= 2)) {
      stop('"cols" should be a charachter vector of at least length 2.')
    }

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
      radius = radius,
      flip.axes = flip.axes,
      mirror = mirror,
      fill.dot = fill.dot,
      fill.gradient = fill.gradient,
      linewidth = linewidth,
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
      ggplot2::ggproto(NULL, GeomDotGlyph,
                       required_aes = c(GeomDotGlyph$required_aes,
                                        cols),
                       default_aes = {
                         aes_new <- c(GeomDotGlyph$default_aes,
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

GeomDotGlyph <-
  ggplot2::ggproto(
    "GeomDotGlyph", ggplot2::Geom,
    required_aes = c("x", "y"),
    default_aes = ggplot2::aes(colour = "black",
                               fill = NA,
                               alpha = 1,
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
      factcols <-
        vapply(data[, cols],
               function(x) !is.factor(x), logical(1))

      if (TRUE %in% factcols) {
        stop('The following column(s) specified as "cols" in ',
             '"data" are not of type factor:\n',
             paste(names(factcols[factcols]), collapse = ", "))
      }

      if (!all(vapply(data[, cols],
                      function(x) is.factor(x) && is.ordered(x),
                      logical(1)))) {

        stop(
          'Not all columns specified in "cols" are ordered factors.\n'
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

      # Check if fill.dot are valid
      if (!is.null(params$fill.dot)) {
        if (length(params$fill.dot) != length(cols))
          stop('The number of colours specified in',
               '"fill.dot" are not equal to the number',
               'of variables specified in "cols".')

        if (!all(iscolour(params$fill.dot))) {
          stop('Invalid colour(s) specified in "fill.dot".')
        }
        data$colour <- NULL
      }

      data$linewidth <- params$linewidth
      data
    },

    draw_panel = function(data, panel_params,
                          coord, cols,
                          radius,
                          fill.dot,
                          fill.gradient,
                          flip.axes,
                          linewidth,
                          mirror,
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

      # Convert factor columns to equivalent numeric
      # (integer rank of factor levels)
      fcols <- names(Filter(is.factor, data[, cols]))

      if (length(fcols) > 0)  {
        data[, fcols] <- lapply(data[, fcols], function(f) as.integer(f))
      }

      # Gradient colour mapping
      gdata <- NULL
      if (is.null(fill.dot) & !is.null(fill.gradient)) {
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

      ggname("geom_dotglyph",
             grid::gTree(data = data,
                         # x = x, y = y,
                         cols = cols,
                         # fill = fill,
                         radius = radius,
                         mirror = mirror,
                         flip.axes = flip.axes,
                         fill.dot = fill.dot,
                         fill.gradient = fill.gradient,
                         gdata = gdata,
                         # colour = colour,
                         # alpha = alpha,
                         linewidth = linewidth,
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
                         cl = "dotglyphtree"))

      # ggname("geom_dotglyph",
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

      vals <- data[, params$cols, drop = FALSE]

      vals[] <- lapply(vals, function(x) {
        if (is.character(x) || is.factor(x)) {
          as.numeric(factor(x, levels = unique(x)))
        } else {
          x
        }
      })

      dotglyphGrob(
        x = .5,
        y = .5,
        z = unlist(ceiling(vals)),
        radius = params$radius,
        mirror = params$mirror,
        flip.axes = params$flip.axes,
        fill = if (is.null(params$fill.dot)) {
          data$fill
        } else {
          unlist(mapply(function(a, b) rep(a, b),
                        params$fill.dot,
                        round(unlist(data[, params$cols]))))
        },
        col = data$colour,
        lwd = params$linewidth,
        alpha = data$alpha
      )
    }
  )

#' grid::makeContent function for the grobTree of dotglyphGrob objects
#' @param g A grid grobTree.
#' @export
#' @noRd
makeContent.dotglyphtree <- function(x) {

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
                      dotglyphGrob(x = g$data$x[i],
                                   y = g$data$y[i],
                                   z = unlist(g$data[i, g$cols]),
                                   radius = g$radius,
                                   mirror = g$mirror,
                                   flip.axes = g$flip.axes,
                                   col = "gray")
                    })

    # Create a dataframe with x1 y1 x2 y2 - Computed from bounding box
    boxes <- lapply(seq_along(glorg), function(i) {
      x1 <- grid::convertWidth(grid::grobX(glorg[[i]], "west"),
                               "native", TRUE)
      x2 <- grid::convertWidth(grid::grobX(glorg[[i]], "east"),
                               "native", TRUE)
      y1 <- grid::convertHeight(grid::grobY(glorg[[i]], "south"),
                                "native", TRUE)
      y2 <- grid::convertHeight(grid::grobY(glorg[[i]], "north"),
                                "native", TRUE)
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
      data_points     = as.matrix(g$data[, c("x", "y")]),
      point_size      = point_size,
      point_padding_x = point_padding,
      point_padding_y = point_padding,
      boxes           = do.call(rbind, boxes),
      xlim            = range(g$limits$x),
      ylim            = range(g$limits$y),
      hjust           = rep (0.5, nrow(g$data)),
      vjust           = rep (0.5, nrow(g$data)),
      force_push      = g$force * 1e-6,
      force_pull      = g$force_pull * 1e-2,
      max_time        = g$max.time,
      max_iter        = ifelse(is.infinite(g$max.iter), 1e9, g$max.iter),
      max_overlaps    = g$max.overlaps,
      direction       = g$direction,
      verbose         = g$verbose
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
               function(i) dotglyphGrob(x = if (g$repel) {
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
               radius = g$radius,
               mirror = g$mirror,
               flip.axes = g$flip.axes,
               fill = if (is.null(g$fill.dot)) {
                 if (!is.null(g$fill.gradient)) {
                   unlist(mapply(function(a, b) rep(a, b),
                                 unlist(g$gdata[i, ]),
                                 round(unlist(g$data[i, g$cols]))))
                 } else {
                   g$data$fill[i]
                 }
               } else {
                 unlist(mapply(function(a, b) rep(a, b),
                               g$fill.dot,
                               round(unlist(g$data[i, g$cols]))))
               },
               col = g$data$colour[i],
               lwd = g$data$linewidth[i],
               alpha = g$data$alpha[i]))

  if (g$repel) {

    gl <- lapply(gl, grobTree)

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
                   function(i) grid::reorderGrob(gl[[i]], c(2:4, 1:3)))

    } else {

      gl <- lapply(seq_along(gl), function(i) grid::addGrob(gl[[i]], segg[[i]]))

      # reorder grobs
      gl <- lapply(seq_along(gl),
                   function(i) grid::reorderGrob(gl[[i]], c(2, 1)))

    }

  }


  gl <- do.call(grid::gList, gl)

  grid::setChildren(g, gl)

}
