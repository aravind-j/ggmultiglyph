#' Add Profile Glyphs as a Scatterplot
#'
#' The profileglyph geom is used to plot multivariate data as profile glyphs
#' \insertCite{chambers_graphical_1983,dutoit_graphical_1986}{ggmultiglyph} in a
#' scatterplot.
#'
#' @template general-arg
#' @template fill.gradient-arg
#' @template repel-arg
#' @inheritParams ggplot2::layer
#' @inheritParams starglyphGrob
#' @inheritParams profileglyphGrob
#' @param colour.bar The colour of bars.
#' @param colour.line The colour of profile line(s).
#' @param colour.grid The colour of the grid lines.
#' @param linewidth.line The line width of the profile line(s)
#' @param linewidth.bar The line width of the bars.
#' @param linewidth.grid The line width of the grid lines.
#' @param fill.bar The fill colour of the bars.
#' @param draw.grid logical. If \code{TRUE}, grid levels are plotted along the
#'   profile bars if all the variables specified in \code{cols} are an ordered
#'   \link[base]{factor}. Default is \code{FALSE}.
#'
#' @section Aesthetics: \code{geom_pieglyph()} understands the following
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
#' @seealso \code{\link[ggmultiglyph]{profileglyphGrob}}
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
#' # Bar, line, mirror and flip.axes combinations ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped fill + line ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped fill + bar ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped colour + bar and line ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped colour + line ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Mapped colour + bar ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Bars with multivariate fill + bar and line ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Bars with multivariate fill + bar ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Bars with gradient fill + bar and line ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.gradient = "Greens",
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.gradient = "Blues",
#'                     mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.gradient = "RdYlBu",
#'                     flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.gradient = "viridis",
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Bars with gradient fill + bar ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.gradient = "Greens",
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.gradient = "Blues",
#'                     mirror = FALSE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.gradient = "RdYlBu",
#'                     flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE,
#'                     fill.gradient = "viridis",
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Faceted ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' ggplot(data = mtcars) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     alpha =  0.8) +
#'   ylim(c(-0, 550)) +
#'   facet_grid(. ~ cyl)
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Repel glyphs ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     line = FALSE, mirror = FALSE,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     bar = FALSE, flip.axes = TRUE,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_profileglyph(aes(x = mpg, y = disp, colour = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     mirror = FALSE, flip.axes = TRUE,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp)) +
#'   geom_profileglyph(aes(x = mpg, y = disp),
#'                     cols = zs, size = 5, width = 1,
#'                     fill.bar = RColorBrewer::brewer.pal(8, "Dark2"),
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # With grid lines (when bar = TRUE) ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 3, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, col = cyl),
#'                     cols = zs, size = 3, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 3, width = 1,
#'                     fill.gradient = "Blues",
#'                     alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550))
#'
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Legend options ----
#' #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' # Default legend/guide
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl)) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE) +
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
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   scale_z_continuous(z = zs) +
#'   guide_z_order(z = zs, default_aes = "fill") +
#'   legend_theme
#'
#' # Modifying the `legend.glyph.dims`
#' zavg <- # Scaled average of the variables
#'   apply(mtcars[, zs], 2,
#'         function(x) {
#'           scales::rescale(mean(x),
#'                           from = range(x), # same range as in scale_z_continuous
#'                           to = c(0, 1))
#'         })
#' zavg
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE,
#'                     legend.glyph.dims = zavg) +
#'   ylim(c(-0, 550)) +
#'   xlim(c(8, 35))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE,
#'                     legend.glyph.dims = zavg) +
#'   ylim(c(-0, 550)) +
#'   scale_z_continuous(z = zs) +
#'   guide_z_order(z = zs, default_aes = "fill")  +
#'   legend_theme
#'
#' # Using custom guide
#' # profileglyphGrob
#' guide_profilegrob <- profileglyphGrob(
#'   z = c(0.24, 0.3, 0.8, 1.4, 0.6, 0.33, 0.6, 0.25) * 0.75,
#'   size = 25)
#' # Add labels to profileglyphGrob
#' guide_profilegrob <-
#'   addlabel.glyphGrob(grob = guide_profilegrob, label = zs,
#'                      segment = TRUE,
#'                      angle = 45, push = 1, hjust = 1)
#'
#' # Another version
#' guide_profilegrob2 <- profileglyphGrob(
#'   z = rep(0.5, length(zs)),
#'   size = 25)
#' guide_profilegrob2 <-
#'   addlabel.glyphGrob(grob = guide_profilegrob2, label = zs,
#'                      push = 1, segment = FALSE,
#'                      angle = 45, hjust = 1)
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_profilegrob,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 20, b = 50))))
#'
#' ggplot(data = mtcars) +
#'   geom_point(aes(x = mpg, y = disp, colour = cyl), show.legend = FALSE) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 5, width = 1,
#'                     alpha =  1, repel = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_profilegrob2,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 7, b = 30))))
#'
#' # Legend in plots with grid points
#'
#' z_grid <- c(hp = 3, drat = 3, wt = 2,
#'             qsec = 2, vs = 3, am = 4,
#'             gear = 2, carb = 3)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 1, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 1, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE,
#'                     legend.glyph.dims = z_grid) +
#'   ylim(c(-0, 550))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 1, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE,
#'                     legend.glyph.dims = z_grid) +
#'   ylim(c(-0, 550)) +
#'   scale_z_discrete(z = zs) +
#'   guide_z_order(z = zs, default_aes = "fill") +
#'   legend_theme
#'
#' # profileglyphGrob with grid levels
#'
#' z_grid_levels <- lapply(z_grid, function(x) 1:x)
#'
#' guide_profilegrob_grid <-
#'   profileglyphGrob(z = z_grid,
#'                    size = 3, draw.grid = TRUE,
#'                    grid.levels = z_grid_levels)
#'
#' guide_profilegrob_grid <-
#'   addlabel.glyphGrob(grob = guide_profilegrob_grid, label = zs,
#'                      push = 1, segment = TRUE,
#'                      angle = 45, hjust = 1)
#'
#' # Another version
#' guide_profilegrob_grid2 <-
#'   profileglyphGrob(z = rep(3, length(z_grid)),
#'                    size = 3, draw.grid = TRUE,
#'                    grid.levels = replicate(8, 1:3,
#'                                            simplify = FALSE))
#' guide_profilegrob_grid2 <-
#'   addlabel.glyphGrob(grob = guide_profilegrob_grid2, label = zs,
#'                      push = 1, segment = FALSE,
#'                      angle = 45, hjust = 1)
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 3, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_profilegrob_grid,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 5, b = 30))))
#'
#' ggplot(data = mtcars_fct) +
#'   geom_profileglyph(aes(x = mpg, y = disp, fill = cyl),
#'                     cols = zs, size = 3, width = 1,
#'                     alpha =  0.8, draw.grid = TRUE) +
#'   ylim(c(-0, 550)) +
#'   guides(fill = guide_legend(order = 1, position = "right"),
#'          custom = guide_custom(guide_profilegrob_grid2,
#'                                width = unit(0.1, "npc"),
#'                                height = unit(0.1, "npc"),
#'                                position = "bottom",
#'                                theme = theme(legend.margin = margin(t = 5, b = 30))))
#'
geom_profileglyph <- function(mapping = NULL, data = NULL, stat = "identity",
                              position = "identity", ...,
                              cols = character(0L),
                              width = 10,
                              size = 1,
                              colour.bar = NULL,
                              colour.line = NULL,
                              colour.grid = NULL,
                              linewidth.line = 1,
                              linewidth.bar = 1,
                              linewidth.grid = 1,
                              fill.bar = NULL,
                              fill.gradient = NULL,
                              flip.axes = FALSE,
                              bar = TRUE,
                              line = TRUE,
                              mirror = TRUE,
                              draw.grid = FALSE,
                              legend.glyph.dims = setNames(rep(0.5, length(cols)), cols),
                              show.legend = NA,
                              repel = FALSE,
                              repel.control = ggmultiglyph.repel.control(),
                              inherit.aes = TRUE) {

  # Check cols
  if (!(is.character(cols) & length(cols) >= 2)) {
    stop('"cols" should be a charachter vector of at least length 2.')
  }

  # Check legend.glyph.dims
  if (is.numeric(legend.glyph.dims) & length(legend.glyph.dims) == 1) {

    legend.glyph.dims <- setNames(rep(legend.glyph.dims, length(cols)), cols)

  } else { # Check if legend.glyph.dims has same length as cols
    if (is.numeric(legend.glyph.dims)
        & length(legend.glyph.dims) == length(cols)) {

      # Check names of legend.glyph.dims
      if (!(all(names(legend.glyph.dims) %in% cols)
            && all(cols %in% names(legend.glyph.dims)))) {
        stop('Names specified in "legend.glyph.dims" and "cols" do not match.')
      }

    } else {
      stop('"legend.glyph.dims" should be a numeric vector of unit length or ',
           'a numeric vector of same length as "cols" ',
           'with the "cols" as names.')
    }
  }

  # Modify mapping to include cols
  mcols <- rlang::as_quosures(rlang::syms(cols), .GlobalEnv)
  names(mcols) <- cols
  mapping <- modifyList(mapping, mcols)

  params <- list(
    width = width,
    size = size,
    colour.grid = colour.grid,
    colour.line = colour.line,
    colour.bar = colour.bar,
    linewidth.line = linewidth.line,
    linewidth.bar = linewidth.bar,
    linewidth.grid = linewidth.grid,
    fill.bar = fill.bar,
    fill.gradient = fill.gradient,
    flip.axes = flip.axes,
    bar = bar,
    line = line,
    mirror = mirror,
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
  # geomout <- GeomProfileGlyph
  # geomout$required_aes <- c(geomout$required_aes, cols)

  geomout <-
    ggplot2::ggproto(NULL, GeomProfileGlyph,
                     required_aes = c(GeomProfileGlyph$required_aes,
                                      cols),
                     default_aes = {
                       aes_new <- c(GeomProfileGlyph$default_aes,
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

GeomProfileGlyph <- ggplot2::ggproto("GeomProfileGlyph", ggplot2::Geom,
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
                                         stop(paste('The following column(s) specified as "cols" are not present in "data":\n',
                                                    paste(cols[!(cols %in% colnames(data))],
                                                          collapse = ", "),
                                                    sep = ""))
                                       }


                                       # Check if cols are numeric or factor
                                       intfactcols <- unlist(lapply(data[, cols],
                                                                    function(x) FALSE %in% (is.vector(x, mode = "integer") |
                                                                                              is.vector(x, mode = "numeric") |
                                                                                              is.factor(x))))
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
                                           'Unable to plot grid points.'
                                         )
                                       }

                                       # Remove rows with missing values in "cols"
                                       # check for missing values
                                       missvcols <- unlist(lapply(data[, cols], function(x) TRUE %in% is.na(x)))
                                       if (TRUE %in% missvcols) {
                                         warning(paste('The following column(s) in "data" have missing values:\n',
                                                       paste(names(missvcols[missvcols]), collapse = ", ")))

                                         data <- remove_missing(df = data, vars = cols)
                                       }

                                       # Check if fill.bar are valid
                                       if (!is.null(params$fill.bar)) {
                                         if (length(params$fill.bar) != length(cols))
                                           stop('The number of colours specified in',
                                                '"fill.bar" are not equal to the number',
                                                'of variables specified in "cols".')

                                         if (!all(iscolour(params$fill.bar))) {
                                           stop('Invalid colour(s) specified in "fill.bar".')
                                         }

                                         data$colour <- NULL
                                       }

                                       data$linewidth.bar <- params$linewidth.bar
                                       data$linewidth.line <- params$linewidth.line
                                       data$linewidth.grid <- params$linewidth.grid
                                       data$linejoin <- "mitre"
                                       data$lineend <- "round"
                                       data$size <- params$size
                                       data
                                     },

                                     draw_panel = function(data, panel_params,
                                                           coord, cols,
                                                           width,
                                                           size,
                                                           colour.grid,
                                                           colour.line,
                                                           colour.bar,
                                                           linewidth.line,
                                                           linewidth.bar,
                                                           linewidth.grid,
                                                           fill.bar,
                                                           fill.gradient,
                                                           flip.axes,
                                                           bar, line,
                                                           mirror,
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

                                       grid.levels <- NULL

                                       # Convert factor columns to equivalent numeric
                                       if (draw.grid) {
                                         grid.levels <- lapply(data[, cols], function(a) as.integer(levels(as.factor(as.integer(a)))))
                                         data[, cols] <- lapply(data[, cols], function(a) as.integer(a))
                                       }

                                       # Gradient colour mapping
                                       gdata <- NULL
                                       if (is.null(fill.bar) & !is.null(fill.gradient)) {
                                         gdata <- data[, cols]

                                         gdata <- lapply(gdata,
                                                         function(x) scales::col_numeric(palette = fill.gradient,
                                                                                         domain = min(x):max(x))(x))
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

                                       ggname("geom_profileglyph",
                                              grid::gTree(data=data,
                                                          # x = x, y = y,
                                                          cols=cols,
                                                          # fill = fill,
                                                          width = width,
                                                          mirror = mirror,
                                                          flip.axes = flip.axes,
                                                          colour.bar = colour.bar,
                                                          colour.line = colour.line,
                                                          fill.bar = fill.bar,
                                                          fill.gradient = fill.gradient,
                                                          gdata = gdata,
                                                          # alpha = alpha,
                                                          bar = bar,
                                                          line = line,
                                                          # linejoin = "mitre",
                                                          # lineend = "round",
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
                                                          cl="profileglyphtree"))

                                       # ggname("geom_profileglyph",
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

                                       grid.levels <- NULL
                                       if (params$draw.grid) {

                                         vals <- data[, params$cols, drop = FALSE]

                                         vals[] <- lapply(vals, function(x) {
                                           if (is.character(x) || is.factor(x)) {
                                             as.numeric(factor(x, levels = unique(x)))
                                           } else {
                                             x
                                           }
                                         })

                                         grid.levels <- lapply(vals, function(a) seq_len((ceiling(a))))
                                         names(grid.levels) <- params$cols
                                       }

                                       profileglyphGrob(
                                         x = .5,
                                         y = .5,
                                         z = if (params$draw.grid) {
                                           ceiling(vals)
                                         } else {
                                           unlist(data[, params$cols])
                                         },
                                         size = params$size,
                                         width = params$width,
                                         mirror = params$mirror,
                                         flip.axes = params$flip.axes,
                                         col.bar = if (is.null(params$colour.bar)) {
                                           data$colour
                                         } else {
                                           params$colour.bar
                                         },
                                         col.line = if (is.null(params$colour.line)) {
                                           data$colour
                                         } else {
                                           params$colour.line
                                         },
                                         fill = if (is.null(params$fill.bar)) {
                                           data$fill
                                         }else {
                                           params$fill.bar
                                         },
                                         lwd.bar = params$linewidth.bar,
                                         lwd.line = params$linewidth.line,
                                         lwd.grid = params$linewidth.grid,
                                         alpha = data$alpha,
                                         bar = params$bar,
                                         line = params$line,
                                         linejoin = "mitre",
                                         lineend = "round",
                                         grid.levels = grid.levels,
                                         draw.grid = params$draw.grid,
                                         col.grid = if (is.null(params$colour.grid)) {
                                           data$colour
                                         } else {
                                           params$colour.grid
                                         }
                                       )
                                     },
)

#' grid::makeContent function for the grobTree of profileglyphGrob objects
#' @param g A grid grobTree.
#' @export
#' @noRd
makeContent.profileglyphtree <- function(g) {

  if (g$repel) {
    repel.debug <- getOption("ggmultiglyph.repel.debug", default = FALSE)

    # The padding around each bounding box.
    box_padding_x <- grid::convertWidth(g$box.padding, "native", valueOnly = TRUE)
    box_padding_y <- grid::convertHeight(g$box.padding, "native", valueOnly = TRUE)

    # The padding around each point.
    if (is.na(g$point.padding)) {
      g$point.padding = unit(0, "lines")
    }

    # Minimal Original glyph grob
    glorg <- lapply(seq_along(g$data$x),
                    function(i) profileglyphGrob(x = g$data$x[i],
                                                 y = g$data$y[i],
                                                 z = unlist(g$data[i, g$cols]),
                                                 size = g$data$size[i],
                                                 width = g$width,
                                                 mirror = g$mirror,
                                                 flip.axes = g$flip.axes,
                                                 col.bar = "gray",
                                                 col.line = "gray",
                                                 lwd.bar = g$data$linewidth.bar[i],
                                                 lwd.line = g$data$linewidth.line[i],
                                                 lwd.grid = g$data$linewidth.grid[i],
                                                 bar = TRUE,
                                                 line = FALSE,
                                                 linejoin = g$data$linejoin[i],
                                                 lineend = g$data$lineend[i],
                                                 grid.levels = g$grid.levels,
                                                 draw.grid = g$draw.grid))

    # Create a dataframe with x1 y1 x2 y2 - Computed from bounding box
    boxes <- lapply(seq_along(glorg), function(i) {
      x1 <- grid::convertWidth(grid::grobX(glorg[[i]]$children[[1]], "west"), "native", TRUE)
      x2 <- grid::convertWidth(grid::grobX(glorg[[i]]$children[[1]], "east"), "native", TRUE)
      y1 <- grid::convertHeight(grid::grobY(glorg[[i]]$children[[1]], "south"), "native", TRUE)
      y2 <- grid::convertHeight(grid::grobY(glorg[[i]]$children[[1]], "north"), "native", TRUE)
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
      # bboxg <- lapply(seq_along(boxes2$x1), function(i) {
      #   grid::polylineGrob(x = c(boxes2$x1[i], g$data$x[i],  boxes2$x2[i], g$data$x[i],  boxes2$x1[i]),
      #                      y = c(g$data$y[i],  boxes2$y1[i], g$data$y[i],  boxes2$y2[i], g$data$y[i]),
      #                      gp = gpar(col = "grey"))
      # })
      bboxg <- lapply(seq_along(boxes2$x1), function(i) {
        grid::polylineGrob(x = c(boxes2$x1[i], boxes2$x1[i], boxes2$x2[i], boxes2$x2[i], boxes2$x1[i]),
                           y = c(boxes2$y1[i], boxes2$y2[i], boxes2$y2[i], boxes2$y1[i], boxes2$y1[i]),
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
      data_points     = as.matrix(g$data[,c("x","y")]),
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
              ' glyphs have too many overlaps.\nConsider increasing "max.overlaps"')
    }

    # if (all(repel$too_many_overlaps)) {
    #   grobs <- list()
    #   class(grobs) <- "gList"
    #   return(setChildren(x, grobs))
    # }

    # create segment grobs
    segg <- lapply(seq_along(g$data$x), function(i) {

      if (!repel$too_many_overlaps[i]) {
        row <- g$data[i, , drop = FALSE]
        grid::curveGrob(x1 = repel[i,]$x, y1 = repel[i,]$y, x2 = row$x, y2 = row$y,
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
               function(i) profileglyphGrob(x = if (g$repel) {
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
               width = g$width,
               mirror = g$mirror,
               flip.axes = g$flip.axes,
               col.bar = if (is.null(g$colour.bar)) {
                 g$data$colour[i]
               } else {
                 g$colour.bar
               },
               col.line = if (is.null(g$colour.line)) {
                 g$data$colour[i]
               } else {
                 g$colour.line
               },
               fill = if (is.null(g$fill.bar)) {
                 if (!is.null(g$fill.gradient)) {
                   unlist(g$gdata[i, ])
                 } else {
                   g$data$fill[i]
                 }
               } else {
                 g$fill.bar
               },
               lwd.bar = g$data$linewidth.bar[i],
               lwd.line = g$data$linewidth.line[i],
               lwd.grid = g$data$linewidth.grid[i],
               alpha = g$data$alpha[i],
               bar = g$bar,
               line = g$line,
               linejoin = g$data$linejoin[i],
               lineend = g$data$lineend[i],
               grid.levels = g$grid.levels,
               draw.grid = g$draw.grid,
               col.grid = if (is.null(g$colour.grid)) {
                 g$data$colour[i]
               } else {
                 g$colour.grid
               }))

  if (g$repel) {

    if (repel.debug) {

      gl <- lapply(seq_along(gl), function(i) grid::addGrob(gl[[i]], glorg[[i]]))

      gl <- lapply(seq_along(gl), function(i) grid::addGrob(gl[[i]], bboxg[[i]]))

      gl <- lapply(seq_along(gl), function(i) grid::addGrob(gl[[i]], segg[[i]]))

      # reorder grobs
      gl <- lapply(seq_along(gl),
                   function(i) grid::reorderGrob(gl[[i]], c(4:6, 1:3)))

    } else {

      gl <- lapply(seq_along(gl), function(i) grid::addGrob(gl[[i]], segg[[i]]))

      # reorder grobs
      gl <- lapply(seq_along(gl),
                   function(i) grid::reorderGrob(gl[[i]], c(4, 1:3)))

    }

  }

  gl <- do.call(grid::gList, gl)

  grid::setChildren(g, gl)
}
