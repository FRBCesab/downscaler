
<!-- README.md is generated from README.Rmd. Please edit that file -->

# downscaler

<!-- badges: start -->

<!-- badges: end -->

This package is an alternative to
[`raster::resample()`](https://www.rdocumentation.org/packages/raster/versions/3.0-7/topics/resample)
and downscales a raster to coarser resolution in a more efficient way
(for large rasters).

## Installation

To install the package `downscaler` from GitHub, first install the
package
[`devtools`](http://cran.r-project.org/web/packages/devtools/index.html)
from the CRAN.

``` r
### Install the < devtools > package
install.packages("devtools", dependencies = TRUE)
```

Then install the `downscaler` package:

``` r
### Install the < popbayes > package from GitHub
devtools::install_github("frbcesab/downscaler", build_vignettes = TRUE)

### Load the < popbayes > package
library(downscaler)
```

## Example

Type `?downscaler::downscale` for an example.
