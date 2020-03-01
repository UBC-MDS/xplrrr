
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xplrrr

<!-- badges: start -->

<!-- badges: end -->

Contributors |
-------------|
Serhiy Pokrovskyy |
Furqan Khan |
Braden Tam |
Yu Fang |


### Overview:

`xplrrr` is an R package to make explatory data analysis (EDA) simple and seamless. EDA is a crucial phase of the data science workflow as it allows us get a fist glimpse of the data. It is important to identify statistical characteristics of the data so that researchers can properly set up the rest of the analysis. This package will provide the tools required to conduct a thorough EDA.


### Installation:

You can install the released version of xplrrr from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("xplrrr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/xplrrr")
```

### Functions:

- `explore_summary` will display a table with basic summary statistics and wholistic information about the data. 
- `explore_feature_map` will provide various data visualizations of the whole data.
- `explore_outliers` will provide a thorough method of identifying outliers in the data.
- `explore_missing` will show exactly where there is missing data and how much data is missing.

### Example:

This is a basic example which shows you how to solve a common problem:

``` r
library(xplrrr)
## basic example code
```

- to be defined later as development starts


### R Ecosystem:

This R package will build using the [`tidyverse`](https://www.tidyverse.org/) ecosystem that will help first time data science users more easily get started with their data projects. A similar package, [`DataExplorer`](https://cran.r-project.org/web/packages/DataExplorer/vignettes/dataexplorer-intro.html) is another EDA tool available. There are not many EDA packages that exist because the `tidyverse` ecosystem allows full control of data wrangling and visualization, however users who are not experts with these packages will find `xplrrr` very useful.

## Contributions

Contributions are welcome, and they are greatly appreciated! Every little bit
helps, and credit will always be given. See [CONTRIBUTING.md](CONTRIBUTING.md) for further details.

### Contributors

Contributors |
-------------|
Serhiy Pokrovskyy |
Furqan Khan |
Braden Tam |
Yu Fang |

For the complete list of project contributors, see [CONTRIBUTORS.md](CONTRIBUTORS.md)