
<!-- README.md is generated from README.Rmd. Please edit that file -->

# downscaler

[![Build
Status](https://travis-ci.org/FRBCesab/downscaler.svg?branch=master)](https://travis-ci.org/FRBCesab/downscaler)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/FRBCesab/downscaler?branch=master&svg=true)](https://ci.appveyor.com/project/FRBCesab/downscaler)
[![Project Status:
Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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
### Install the < downscaler > package from GitHub
devtools::install_github("frbcesab/downscaler")

### Load the < downscaler > package
library(downscaler)
```

## Example

Type `?downscaler::downscale` for an example.
