#' Add genomic coordinates in separate columns of a dataframe
#'
#' `mutate_coordinates` is intended to separate genomic coordinates that are
#' listed in a single character string within a dataframe column, which
#' is often the case for copy
#' number variant coordinates, target regions or primer locations.
#' `mutate_coordinates` also will work when the column contains a mix
#' of single coordinate and paired coordinate strings, which can happen
#' when the locations of different variant types are listed in the same
#' column (such as single nucleotide variants and indels, see example).
#'
#' @param df A dataframe
#' @param coord_col The column containing genomic coordinate strings
#'
#' @returns The dataframe with coordinates extracted into "start" and "end"
#' columns
#' @export
#'
#' @examples
#'
#' test_df <- tibble::tribble(
#' ~"gene", ~"variant", ~"region",
#' "GENE1", "c.1A>G", "1",
#' "GENE1", "c.1delATG", "1..3",
#' "GENE1", "c.123_456dup", "123456789..234567890")
#'
#' test_df |> mutate_coordinates(coord_col = region)
#'
mutate_coordinates <- function(df, coord_col){

  if(!is.data.frame(df)){
    stop("input must be a dataframe")
  }

  if(missing(coord_col)){
    stop("coord_col must be supplied")
  }

  output <- df |>
    dplyr::rowwise() |>
    dplyr::mutate(start = extract_coordinates({{ coord_col }})[["start"]],
                  end = extract_coordinates({{ coord_col }})[["end"]]) |>
    dplyr::ungroup()

  return(output)

}
