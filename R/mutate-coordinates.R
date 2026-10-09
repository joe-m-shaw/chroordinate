#' Add genomic coordinates in separate columns of a dataframe
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
#' ~"region",
#' "1",
#' "1..3",
#' "123456789..234567890")
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
    dplyr::mutate(start = extract_coordinate(x = {{ coord_col }},
                                             location = "start",
                                             type = "numeric"),
                  end = extract_coordinate(x = {{ coord_col }},
                                               location = "end",
                                               type = "numeric")) |>
    dplyr::ungroup()

  return(output)

}
