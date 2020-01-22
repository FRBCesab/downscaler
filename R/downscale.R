downscale <- function(from, to, FUN = "mean") {

# RasterStack

  to_stars <- stars::st_as_stars(to)
  to_sf    <- sf::st_as_sf(x = to_stars, as.points = FALSE, merge = FALSE)
  values   <- exact_extract(x = from, y = to_sf, fun = FUN)

  pos  <- which(!is.na(to[]))
  to[] <- NA

  to[][pos] <- values

  return(to)
}
