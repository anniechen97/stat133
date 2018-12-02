## Overview

"roller" is a minimal R package that provides functions to simulate rolling a device. 
- device() creates a device object (of class "device")
- roll() rolls a device object, producing a "roll" object
- plot() method for a "roll" object to plot frequencies of sides
- summary() method for a "roll" object

## Installation

Install the development version from GitHub via the package
`"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "roller" (without vignettes)
devtools::install_github("anniechen97/workout3/roller")

# install "roller" (with vignettes)
devtools::install_github("anniechen97/workout3/roller", build_vignettes = TRUE)
```

## Usage

``` r
library(roller)

# default device
device1 <- device()
device1
#> object "device"
#> 
#> "1", p = 0.5 
#> "2", p = 0.5

# 1 roll of device1
roll(device1)
#> object "roll"
#> 
#> $rolls 
#> 1


# 10 rolls of device1
roll10 <- roll(device1, times = 10)
roll10
#> object "roll"
#> 
#> 2 2 2 1 1 2 2 1 1 1


# summary
summary(roll10)
#> summary "toss"
#> 
#>  side count prop
#> 1 1     5  0.5
#> 2 2     5  0.5


# 100 rolls
roll100 <- roll(device1, times = 100)

# summary
summary(roll100)
#> summary "roll"
#> 
#>  side count prop
#> 1 1    52 0.52
#> 2 1    48 0.48
```
