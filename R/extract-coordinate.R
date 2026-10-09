#' Extract a genomic coordinate from a character string
#'
#' @param x A character string containing one or two genomic coordinates
#' @param location "start" or "end"
#' @param type The type of value to return: "numeric" or "character"
#'
#' @returns The extracted genomic coordinate
#' @export
#'
#' @examples extract_coordinate("1234_12345", location = "end")
extract_coordinate <- function(x, location = "start", type = "numeric") {

  if (any(!is.character(x))) stop("input must be a string")

  if (any(is.na(x))) stop("input must not contain NA values")

  if (any(trimws(x) == "")) stop("input must not be empty or contain only whitespace")

  if(!location %in% c("start", "end")) stop("location must be start or end")

  if(location == "start"){

    group_choice <- regex_coordinate()$clc$start

  }

  if(location == "end"){

    group_choice <- regex_coordinate()$clc$end

  }

  coordinate <- stringr::str_extract(string = x,
                                     pattern = regex_coordinate()$clc$regex,
                                     group = group_choice)

  if(type == "numeric"){
    return(as.numeric(coordinate))
  }

  if(type == "character"){
    return(coordinate)
  }

}
