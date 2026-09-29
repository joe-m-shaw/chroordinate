#' Convert human chromosomes into factors
#'
#' Human chromosomes contain 1-22 autosomes and X and Y sex chromosomes. This
#' combination of numbers and letters means that chromosomes are best formatted
#' as factors for data analysis.
#' `factorise_chromosome` takes a character or vector input of chromosome names
#' and converts them into factors to allow for easier analysis and plotting.
#'
#' @param x Character string or character vector
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

  output <- factor(x, levels = levels_chromosomes()$all)

  return(output)

}
