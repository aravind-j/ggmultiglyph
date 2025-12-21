
# Get unexported functions from ggplot2
ggname <- utils::getFromNamespace("ggname", "ggplot2")
remove_missing <- utils::getFromNamespace("remove_missing", "ggplot2")

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

  out <- unit(d1, "native") + unit(d2, "mm")

  return(out)

}

# Get raw units from a sum unit : sum(400native, 6mm)
raw_units <- function(sumunit) {

  unit_raw <- unclass(sumunit)[[1]][[2]]

  npc_ind <- sapply(unit_raw, unitType) == "native"
  mm_ind <- sapply(unit_raw, unitType) == "mm"

  out <- c(npc = sum(sapply(unit_raw[npc_ind],
                            function(u) unlist(u)[[1]])),
           mm = sum(sapply(unit_raw[mm_ind],
                           function(u) unlist(u)[[1]])))

  return(out)
}

# Get simplified units from a sum unit :
# sum(400native, 6mm, -4mm) -> sum(400native, 2mm)
simplify_mm <- function(sumunit) {
  raw <- raw_units(sumunit)
  unit(raw[["npc"]], "native") + unit(raw[["mm"]], "mm")
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

