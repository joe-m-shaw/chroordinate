#' Convert human chromosomes into factors
#'
#' Human chromosomes contain 1-22 autosomes and X and Y sex chromosomes. This
#' combination of numbers and letters means that chromosomes are best formatted
#' as factors for data analysis.
#' `factorise_chromosome` takes a character or vector input of chromosome names
#' and converts them into factors to allow for easier analysis and plotting.
#'
#' @param x Character string or numeric or vector of chromosomes in the format
#' 1, 2 ... X, Y.
#'
#' @returns The input formatted as a factor with consistent chromosome levels.
#' @export
#'
#' @examples
#' df <- data.frame("chromosome" = c("1", "2", "10", "X")) |>
#' dplyr::arrange(chromosome)
#'
#' print(df)
#'
#' df |>
#' dplyr::mutate(chromosome = factorise_chromosome(chromosome)) |>
#' dplyr::arrange(chromosome)
#'
factorise_chromosome <- function(x){

  if (any(is.na(x))) warning("input contains NA values")

  if (any(trimws(x) == "")) stop("input must not be empty or contain only whitespace")

  output <- factor(x, levels = levels_chromosomes()$all)

  non_match_values <- setdiff(x,
                              levels_chromosomes()$all)

  if(length(non_match_values) > 0) {
    warning(paste0("NAs introduced because some chromosomes are not as expected: ",
                   non_match_values))
  }

  return(output)

}

