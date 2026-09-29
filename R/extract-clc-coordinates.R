#' Extract start and end coordinates from a CLC genomic region string
#'
#' @param df A dataframe containing a column of genomic regions
#' @param coord_col The region column
#'
#' @returns The input dataframe with the region start and end coordinates
#' as two new columns.
#' @export
#'
#' @examples
#'
#' df <- data.frame("region" = c("55174776..55174793"))
#'
#' df |>
#' extract_clc_coordinates(coord_col = region)
#'
extract_clc_coordinates <- function(df, coord_col) {

  output <- df |>
    dplyr::mutate(start = as.numeric(stringr::str_extract(string = {{ coord_col }},
                                                          pattern = regex_region()$clc$regex,
                                                          group = regex_region()$clc$start)),
                  end = as.numeric(stringr::str_extract(string = {{ coord_col }},
                                                        pattern = regex_region()$clc$regex,
                                                        group = regex_region()$clc$end)))

  return(output)

}
