library(ggplot2)
library(tidyverse)
library(gridExtra)

#' Returns a cumulative faceted plot on pairwise feature relationships.
#'
#' The plot consists of NxN mini-charts where N is number of features.
#' Main diagonal shows feature distribution. Pairwise Pearson correlations
#' are shown above main diagonal. Pairwise feature joint distributions
#' are shown below main diagonal.
#'
#' Note: non-numeric features will be skipped!
#'
#' @param data A data.frame: The target dataframe to explore
#'
#' @raises Invalid dataframe specified
#' @raises Dataframe is empty
#' @raises No numeric columns present in the dataframe
#'
#' @return plot
#' @export
#' @import ggplot2
#' @import gridExtra
#'
#' @examples
#' explore_feature_map(iris)
explore_feature_map <- function(df) {
    if (!is.data.frame(df))
        stop("Invalid dataframe specified")
    if (nrow(df) == 0)
        stop("Dataframe is empty")

    # Subset dataframe features based on user selection
    df <- df[, purrr::map_lgl(df, is.numeric)]

    grobs <- list()
    g <- 0
    features <- names(df)
    f_count <- length(features)

    if (length(features) == 0)
        stop("No numeric columns present in the dataframe")

    for (i in features) {
        for (j in features) {
            g <- g + 1
            if (i == j) {
                # Feature distribution plot
                grobs[[g]] <- (ggplot(df) +
                               geom_density(aes(x = !!sym(i)),
                                            fill = '#ed6663',
                                            color = '#ed6663') +
                               theme_void())
            }
            else {
                if (which(features == i) > which(features == j)) {
                    # Features joint distribution plot
                    grobs[[g]] <- (ggplot(df) +
                                   geom_point(aes(x = !!sym(i),
                                                  y = !!sym(j)),
                                              color = '#0f4c81',
                                              size = 0.5) +
                                   theme_void())
                }
                else {
                    # Pearson correlation block
                    ij_corr <- round(cor(df[[i]], df[[j]]), 4)
                    grobs[[g]] <- (ggplot() +
                                   annotate("text",
                                            x = 4,
                                            y = 25,
                                            size = 30 / f_count,
                                            label = ij_corr) +
                                   theme_void())
                }
            }
        }

        # Add row name to the right
        g <- g + 1
        grobs[[g]] <- (ggplot() +
                       annotate("text",
                                x = 4,
                                y = 25,
                                angle = 90,
                                size = 20 / f_count,
                                label = i) +
                       theme_void())
    }

    # Bottom captions row
    for (i in features) {
        g <- g + 1
        grobs[[g]] <- (ggplot() +
                       annotate("text",
                                x = 4,
                                y = 25,
                                size = 20 / f_count,
                                label = i) +
                       theme_void())
    }

    # Arrange resulting grids
    grid.arrange(grobs = grobs,
                 ncol = f_count + 1,
                 nrow = f_count + 1,
                 widths = append(rep(50, f_count), 20),
                 heights =  append(rep(50, f_count), 20))
}
