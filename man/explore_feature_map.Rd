% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/explore_feature_map.R
\name{explore_feature_map}
\alias{explore_feature_map}
\title{Returns a cumulative faceted plot on pairwise feature relationships.}
\usage{
explore_feature_map(df)
}
\arguments{
\item{df}{A data.frame: The target dataframe to explore}
}
\value{
plot
}
\description{
The plot consists of NxN mini-charts where N is number of features.
Main diagonal shows feature distribution. Pairwise Pearson correlations
are shown above main diagonal. Pairwise feature joint distributions
are shown below main diagonal.
}
\details{
Non-numeric features will be skipped. All passed features should
not include any missing data, otherwise an error will be raised
}
\note{
Raises: Invalid dataframe specified

Raises: Dataframe is empty

Raises: No numeric columns present in the dataframe

Raises: Features must not include missing data
}
\examples{
explore_feature_map(iris)
}
