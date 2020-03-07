#' Shows exactly where there is missing data and how much data is missing.
#'
#' explore_missing will explore missing observations within data. It will
#' return 1 of 2 tables: 1 table of exactly where there is missing data or
#' another table showing how many observations are missing, and the
#' proportion of how much data is missing for each feature.
#'
#' @param data A data.frame: The target dataframe to explore
#' @param num_rows integer: The number of rows above and below the missing value to output
#' @param type character: The desired type of output (location or count)
#'
#' @return dataframe: The resultant dataframes
#' @export
#'
#' @examples
#' explore_missing(data.frame(a = c(1,2), b = c(NA, 3)))

explore_missing <- function(data, num_rows = 0, type = "location") {

  indices <- which(is.na(data), 1)[,1]

  if(!is.data.frame(data)){
    stop("Data must be a dataframe or tibble")
  }

  if(num_rows < 0){
    stop("num_rows must be a positive integer")
  }

  if(!((type == "location") | (type == "count"))){
    stop('Type must be either "count" or "location"')
  }

  if(length(indices) == 0){
    stop("There are no missing values in the dataframe")
  }


  new_indices <- list()

  for(index in indices){
    for(num in 0:num_rows){
      new_indices <- append(new_indices, index - num)
      new_indices <- append(new_indices, index + num)
    }
  }

  rows = sort(unlist(unique(append(new_indices, indices))))

  # avoids index error
  rows = rows[(rows > 0) & (rows <= dim(data)[1])]

  # number of missing values
  if(type == "count"){
    return(data.frame('Number of missing values' = colSums(is.na(data)),
                      'Proportion of missing data' = colSums(is.na(data)) / dim(data)[1]))
  }

  # location of missing data
  if(type == "location"){
    return(data.frame(data[rows,], 'Indices' = rows))
  }

}
