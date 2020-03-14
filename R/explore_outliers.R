#' Explores outliers in each feature of dataset based on standard deviation.
#'
#' @param df A data.frame: The target dataframe to explore
#'
#' @return data.frame: Dataframe with details on the outliers
#' @export
#'
#' @examples
#' df <- data.frame('col1'= c(1, 2, 1.00, 3, -1, 100),
#' 'col2'= c(3, 1 ,3, -2, 3, -1))
#' explore_outliers(df)

explore_outliers <- function(df) {
  if (class(df) != 'data.frame'){
    stop('input type must be data.frame')}
  if(!all(unlist(lapply(df, is.numeric)))){
    stop('entire data.frame must be numeric')}

  df <- na.omit(df)
  df_outlier = data.frame(outlier_count= double())
  df_name <- data.frame(name=names(df))
  for (c in df){
    m <- sum(c)/length(c)
    sd <- (sum((m-c)**2)/length(c))**0.5
    lower_bound <- m - 2*sd
    upper_bound <- m + 2*sd
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
