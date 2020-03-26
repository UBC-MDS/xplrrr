library("testthat")
library("matrixStats")

#' Provides basic summary statistics and wholistic
#' information about all the features of provided data
#'
#' @param df dataframe (clean)
#'
#' @return a summary dataframe
#' @export
#' @import matrixStats
#'
#' @examples
#' explore_summary(iris)

explore_summary <- function(df) {
  # retrieve only numeric variables
  num_index <- data.frame("index"=which(sapply(colnames(df), function(x) is.numeric(df[, x]))))
  index <- c()
  for(i in(1:nrow(num_index))){
    index <- c(index, num_index[i,1])
  }
  num_data <- df[index]
  m <- data.matrix(num_data)
  # create a dataframe for the statistical summary of numeric variables
  summary <- data.frame(colQuantiles(m, probs = seq(from = 0, to =1, by = 0.25), na.rm = TRUE))
  colnames(summary)<-c("min.","1st Qu.","median","3rd Qu.","max.")
  data_mean <- data.frame("mean"=colMeans2(m,na.rm = TRUE))
  data_var <- data.frame("var"=colVars(m,na.rm = TRUE))
  # return the summary dataframe
  return(cbind(summary, data_mean, data_var))

}
