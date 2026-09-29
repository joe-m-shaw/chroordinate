#' Factor levels for human chromosomes
#'
#' @returns A list of character vectors of human chromosomes in order, with
#' options for autosomes, sex chromosomes and all chromosomes (with sex
#' chromosomes ordered after autosomes)
#' @export
#'
#' @examples
#'
#' levels_chromosomes()$all
#'
levels_chromosomes <- function(){

  autosomes <- c("1", "2", "3", "4", "5", "6", "7", "8",
                 "9", "10", "11", "12", "13", "14", "15",
                 "16", "17", "18", "19", "20", "21", "22")

  sex_chromosomes <- c("X", "Y")

  all_chromosomes <- c(autosomes, sex_chromosomes)

  output_list <- list(
    "autosomes" = autosomes,
    "sex_chromosomes" = sex_chromosomes,
    "all" = all_chromosomes
  )

  return(output_list)

}
