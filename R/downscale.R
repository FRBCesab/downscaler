#' @title Downscale a Spatial Raster
#' @description This function is an alternative to \code{raster::resample()} and downscales
#' a raster to coarser raster in a more efficient way (for large rasters).
#'
#' @param from A RasterLayer, RasterStack or RasterBrick to downscale
#' @param to A RasterLayer with characteristics that from should be downscale to
#' @param FUN The function to aggregate values (DEFAULT: "mean")
#' @param progress If TRUE, a progress bar is displayed
#'
#' @return A RasterLayer, RasterStack or RasterBrick.
#'
#' @author Nicolas CASAJUS, \email{nicolas.casajus@@fondationbiodiversite.fr}
#'
#' @export
#'
#' @import sf
#' @import stars
#' @import raster
#' @importFrom exactextractr exact_extract
#'
#' @examples
#' library(raster)
#'
#' from  <- raster(system.file("external/test.grd", package = "raster"))
#' to    <- aggregate(from, fac = 2)
#'
#' final <- downscale(from, to, FUN = "mean", progress = FALSE)
#'
#' par(mfrow = c(1, 2))
#' plot(from)
#' plot(final)




downscale <- function(from, to, FUN = "mean", progress = TRUE) {

  # Checks

  if (!(class(from) %in% c("RasterLayer", "RasterStack", "RasterBrick"))) {

    stop("from must be one  of RasterLayer, RasterStack, RasterBrick.")
  }

  if (class(to) != "RasterLayer") {

    stop("Argument to must be a RasterLayer.")
  }

  if (is.na(projection(from))) {

    stop("Argument from has no CRS.")
  }

  if (is.na(projection(to))) {

    stop("Argument to has no CRS.")
  }


  # Project input grids into output CRS

  if (projection(from) != projection(to)) {

    from <- projectRaster(from, crs = projection(to))
  }


  # Extract infos from input raster

  n_layers    <- nlayers(from)
  layer_names <- names(from)


  # Convert output RASTER to sf MULTIPOLYGON (via STARS format)

  to_stars <- stars::st_as_stars(to)
  to_sf    <- sf::st_as_sf(x = to_stars, as.points = FALSE, merge = FALSE)


  # Resample input RASTER(STACK) values

  values <- as.data.frame(
    lapply(as.list(from), function(x) {
      exactextractr::exact_extract(x, y = to_sf, fun = FUN, progress = progress)
    })
  )


  # Inject aggregated values into output raster

  pos  <- which(!is.na(to[]))
  to[] <- NA
  to   <- stack(replicate(n_layers, to))
  to[][pos, ] <- as.matrix(values)


  # Convert into single layer (if required)

  if (nlayers(from) == 1) {

    to <- subset(to, 1)
  }

  return(to)
}
