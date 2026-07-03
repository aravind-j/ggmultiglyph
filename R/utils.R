
# Get unexported functions from ggplot2
ggname <- utils::getFromNamespace("ggname", "ggplot2")
remove_missing <- utils::getFromNamespace("remove_missing", "ggplot2")

# Get unexported ggproto from ggplot2
ScaleDiscreteIdentity <-
  utils::getFromNamespace("ScaleDiscreteIdentity", "ggplot2")

ScaleDiscreteZIdentity <-
  ggplot2::ggproto("ScaleDiscreteZIdentity",
                   ScaleDiscreteIdentity,
                   map = function(self, x, limits = self$get_limits()) {
                     x
                   })

# Get unexported functions from grid
upgradeUnit.unit.list <- utils::getFromNamespace("upgradeUnit.unit.list",
                                                 "grid")

# Check if a colour is valid

#' @importFrom grDevices col2rgb
iscolour <- function(x) {
  sapply(x, function(x) {
    tryCatch(is.matrix(grDevices::col2rgb(x)),
             error = function(e) FALSE)
  })
}

# Helper to find dimensions of bounding box
boxdim <- function(x, what = c("min", "max", "mean")) {

  df <- lapply(x, unlist)
  df <- df[unlist(lapply(df, length)) == 6]
  df <- data.frame(do.call(rbind,  df))

  input_anchor_unit <- sapply(x, function(sumunit) {
    unitType(sumunit, recurse = TRUE)$sum[[1]]
  })

  input_2nd_unit <- sapply(x, function(sumunit) {
    unitType(sumunit, recurse = TRUE)$sum[[2]]
  })

  if (length(unique(input_anchor_unit)) == 1 &&
      length(unique(input_2nd_unit)) == 1 ) {
    input_anchor_unit <- unique(input_anchor_unit)
    input_2nd_unit <- unique(input_2nd_unit)
  } else {
    stop('Non standard "sum" units detected.')
  }

  d1 <- unique(df[, 2])

  if (length(d1) > 1) {
    stop("Unable to compute bounding box coordinates.")
  }

  if (what == "min") {
    d2 <-  min(df[, 4])
  }

  if (what == "max") {
    d2 <- max(df[, 4])
  }

  if (what == "mean") {
    d2 <- mean(df[, 4])
  }

  # out <- unit(d1, "native") + unit(d2, "mm")
  out <- unit(d1, input_anchor_unit) + unit(d2, input_2nd_unit)

  return(out)

}

# Get raw units from a sum unit : sum(400native, 6mm)
raw_units <- function(sumunit) {

  sumunit_length <- length(unlist(unitType(sumunit, recurse = TRUE)$sum))
  unit_names <- unique(unlist(unitType(sumunit, recurse = TRUE)$sum))

  if (sumunit_length != length(unit_names)) {

    unit_raw <- unclass(sumunit)[[1]][[2]]

    out <- lapply(seq_along(unit_names), function(i) {
      u_ind <- sapply(unit_raw, unitType) == unit_names[i]
      sum(sapply(unit_raw[u_ind],
                 function(u) unlist(u)[[1]]))
    })

    names(out) <- unit_names

  } else {
    out <- sumunit
  }

  return(out)
}

# Get simplified units from a sum unit :
# sum(400native, 6mm, -4mm) -> sum(400native, 2mm)
simplify_mm <- function(sumunit) {
  raw <- raw_units(sumunit)

  unit_names <- names(raw)

  unit_list <- lapply(seq_along(unit_names), function(i) {
    unit(raw[[unit_names[i]]], unit_names[i])
  })

  sum(upgradeUnit.unit.list(unit_list))

}

reconstruct_sumunit <- function(toconvert, raw_units) {
  native_diff <- toconvert - raw_units["native"]
  mm_new <- convertUnit(unit(native_diff, "native"), "mm", valueOnly = TRUE)

  out <- unit(raw_units["native"], "native") + unit(mm_new, "mm")

  return(out)
}


# Expand a range/limit by a fraction
expnd_lim <- function(lim, frac = 0.25) {
  r <- diff(lim)
  lim + c(-1, 1) * r * frac
}

# Not exported; used only in examples
.gglyph_ex_setup <- function() {
  ggplot2::theme_set(ggplot2::theme_bw())
  options(
    ggplot2.discrete.colour = RColorBrewer::brewer.pal(8, "Dark2"),
    ggplot2.discrete.fill   = RColorBrewer::brewer.pal(8, "Dark2")
  )
  invisible(NULL)
}

