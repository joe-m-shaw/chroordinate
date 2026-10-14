#' Extract genomic coordinates from a string
#'
#' @param x A string of two genomic coordinates, without chromosome information.
#' The intended format is two coordinate numbers separated by non-digit
#' characters (such as .., ^ or -). The formats "chr1:1234" or
#' "chr1:123-456" cannot be used.
#'
#' @returns A list containing the start and end coordinates from the string
#' @export
#'
#' @examples
#' extract_coordinates("1234..5678")
#'
extract_coordinates <- function(x) {

  if (any(!is.character(x))) stop("x must be a string")

  if (any(trimws(x) == "")) stop("x must not be empty or contain only whitespace")

  coordinates <- stringr::str_extract_all(x, "\\d{1,9}")[[1]]

  large_coordinates <- stringr::str_extract(x, pattern = "\\d{10,}")

  if(!is.na(large_coordinates)){
    stop(paste0("Input contains numbers more than 9 digits long. Chromosome coordinates should not be this long: ", large_coordinates))
  }

  output_list <- list(
    "start" = as.numeric(coordinates[1]),
    "end" = if (length(coordinates) == 2) as.numeric(coordinates[2]) else NA_real_
  )

  return(output_list)

}
