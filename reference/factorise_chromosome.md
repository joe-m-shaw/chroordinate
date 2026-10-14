# Convert human chromosomes into factors

Human chromosomes contain 1-22 autosomes and X and Y sex chromosomes.
This combination of numbers and letters means that chromosomes are best
formatted as factors for data analysis. `factorise_chromosome` takes a
character or vector input of chromosome names and converts them into
factors to allow for easier analysis and plotting.

## Usage

``` r
factorise_chromosome(x)
```

## Arguments

- x:

  Character string or numeric or vector of chromosomes in the format 1,
  2 ... X, Y.

## Value

The input formatted as a factor with consistent chromosome levels.

## Examples

``` r
df <- data.frame("chromosome" = c("1", "2", "10", "X")) |>
dplyr::arrange(chromosome)

print(df)
#>   chromosome
#> 1          1
#> 2         10
#> 3          2
#> 4          X

df |>
dplyr::mutate(chromosome = factorise_chromosome(chromosome)) |>
dplyr::arrange(chromosome)
#>   chromosome
#> 1          1
#> 2          2
#> 3         10
#> 4          X
```
