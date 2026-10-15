
<!-- README.md is generated from README.Rmd. Please edit that file -->

# chroordinate <a href="https://joe-m-shaw.github.io/chroordinate/"><img src="man/figures/logo.png" align="right" height="250" alt="chroordinate website" /></a>

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/joe-m-shaw/chroordinate/graph/badge.svg)](https://app.codecov.io/gh/joe-m-shaw/chroordinate)
<!-- badges: end -->

chroordinate allows you to coordinate chromosome coordinates during data
analysis.

## Installation

You can install the development version of chroordinate from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("joe-m-shaw/chroordinate")
```

## Usage

`chroordinate` makes it easier to work with chromosome coordinates
during data analysis. For example, in cases where multiple descriptions
of chromosome coordinates are included in the same column, the
`mutate_coordinates` function extracts the coordinates into two separate
columns.

| gene  | variant | region       |
|:------|:--------|:-------------|
| GENE1 | SNV     | 12345        |
| GENE1 | CNV     | 12345..12348 |
| GENE1 | Indel   | 12345^23456  |

``` r

test_df |> 
  chroordinate::mutate_coordinates(region)
#> # A tibble: 3 × 5
#>   gene  variant region       start   end
#>   <chr> <chr>   <chr>        <dbl> <dbl>
#> 1 GENE1 SNV     12345        12345    NA
#> 2 GENE1 CNV     12345..12348 12345 12348
#> 3 GENE1 Indel   12345^23456  12345 23456
```

## Naming convention

In `chroordinate` chromosomes are referred to as “chromosome” for
clarity, instead of “chr” (which can be mistaken for meaning
“character”) or “chrom”. For the second coordinate in a location,
`chroordinate` uses “end” not “stop”.

## Logo

The `chroordinate` logo uses an icon from FlatIcon made by
[Magnific](https://www.flaticon.com/free-icon/genetics_5685648?term=chromosome&related_id=5685648).
