# Extract genomic coordinates from a string

Extract genomic coordinates from a string

## Usage

``` r
extract_coordinates(x)
```

## Arguments

- x:

  A string of two genomic coordinates, without chromosome information.
  The intended format is two coordinate numbers separated by non-digit
  characters (such as .., ^ or -). The formats "chr1:1234" or
  "chr1:123-456" cannot be used.

## Value

A list containing the start and end coordinates from the string

## Examples

``` r
extract_coordinates("1234..5678")
#> $start
#> [1] 1234
#> 
#> $end
#> [1] 5678
#> 
```
