library(tidyverse)

#' Explores outliers in each feature of dataset based on standard deviation range.
#' Before calculation, NA rows are dropped and only numeric columns are
#` considered for calculation.
#'
#' @param df A data.frame: The target dataframe to explore
#' @param std_range A integer: The range of standard deviation
#'
#' @return data.frame: Dataframe with details on the outliers
#' @export
#'
#' @examples
#' df <- data.frame('col1'= c(1, 2, 1.00, 3, -1, 100),
#' 'col2'= c(3, 1 ,3, -2, 3, -1))
#' explore_outliers(df, 2)

explore_outliers <- function(df, std_range) {
  if (class(df) != 'data.frame'){
    stop('input type must be data.frame')}

  df <- data.frame(df[, map_lgl(df, is.numeric)])
  df <- na.omit(df)
  df_outlier = data.frame(outlier_count= double())
  df_name <- data.frame(name=names(df))
  for (c in df){
    m <- sum(c)/length(c)
    sd <- (sum((m-c)**2)/length(c))**0.5
    lower_bound <- m - std_range*sd
    upper_bound <- m + std_range*sd
    outlier_c = 0
    for (n in c){
      if  (!(n <= upper_bound && n >= lower_bound)){
        outlier_c <- outlier_c + 1
      }
    }
    de <- list(outlier_count = outlier_c)
    df_outlier <- rbind(df_outlier,de)
  }
  row.names(df_outlier) <- df_name$name
  return(df_outlier)

}
