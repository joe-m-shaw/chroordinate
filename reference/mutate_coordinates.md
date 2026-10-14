# Add genomic coordinates in separate columns of a dataframe

`mutate_coordinates` is intended to separate genomic coordinates that
are listed in a single character string within a dataframe column, which
is often the case for copy number variant coordinates, target regions or
primer locations. `mutate_coordinates` also will work when the column
contains a mix of single coordinate and paired coordinate strings, which
can happen when the locations of different variant types are listed in
the same column (such as single nucleotide variants and indels, see
example).

## Usage

``` r
mutate_coordinates(df, coord_col)
```

## Arguments

- df:

  A dataframe

- coord_col:

  The column containing genomic coordinate strings

## Value

The dataframe with coordinates extracted into "start" and "end" columns

## Examples

``` r

test_df <- tibble::tribble(
~"gene", ~"variant", ~"region",
"GENE1", "c.1A>G", "1",
"GENE1", "c.1delATG", "1..3",
"GENE1", "c.123_456dup", "123456789..234567890")

test_df |> mutate_coordinates(coord_col = region)
#> # A tibble: 3 × 5
#>   gene  variant      region                   start       end
#>   <chr> <chr>        <chr>                    <dbl>     <dbl>
#> 1 GENE1 c.1A>G       1                            1        NA
#> 2 GENE1 c.1delATG    1..3                         1         3
#> 3 GENE1 c.123_456dup 123456789..234567890 123456789 234567890
```
