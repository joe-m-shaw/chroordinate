#' Regular expressions for genomic region coordinate strings
#'
#' Descriptions of genomic regions are often given as character strings rather
#' than as separate columns of start and end coordinates.
#' `regex_coordinate` contains regular expressions for describing different formats
#' of character string, to allow start and end coordinates to be easily
#' extracted.
#'
#' @returns A named list of regular expressions and coordinate groupings
#' @export
#'
#' @examples
#' stringr::str_extract(string = "1234..5678",
#' pattern = regex_coordinate()$clc$regex,
#' group = regex_coordinate()$clc$start)
#'
regex_coordinate <- function() {

  output_list <- list(
    "clc" = list(

      "regex" = stringr::regex(
        r"[
        (|complement\()
        (\d{1,9})            # first coordinate number (1 to 9 digits)
        (\.\.|\^|-|_|\s|:|)  # separators
        (\d{1,9}|)           # second coordinate number (1 to 9 digits) or nothing
        ]",
        comments = TRUE
      ),

      "start_group" = 2,
      "end_group" = 4
    )
  )

  return(output_list)

}
