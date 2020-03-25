
<!-- README.md is generated from README.Rmd. Please edit that file -->

# xplrrr

<!-- badges: start -->

<!-- badges: end -->

### Overview

`xplrrr` is an R package to make exploratory data analysis (EDA) simple and seamless. EDA is a crucial phase of the data science workflow as it allows us get a fist glimpse of the data. It is important to identify statistical characteristics of the data so that researchers can properly set up the rest of the analysis. This package will provide the tools required to conduct a thorough EDA.


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

- `explore_summary` will display a table with basic summary statistics and wholistic information about the data including column names for both categorical and numerical columns.  
- `explore_outliers` will provide a thorough method of identifying outliers in the data based on standard deviation.
- `explore_missing` will show exactly where there is missing data and how much data is missing.
- `explore_feature_map` will generate a faceted plot on pairwise feature relationships and correlations as well as individual feature distributions.

### Usage:

This is a basic example which shows you how to solve a common problem:

``` r
library(xplrrr)

explore_summary(airquality)
#>         min. 1st Qu. median 3rd Qu.  max.       mean         var
#> Ozone    1.0   18.00   31.5   63.25 168.0  42.129310 1088.200525
#> Solar.R  7.0  115.75  205.0  258.75 334.0 185.931507 8110.519414
#> Wind     1.7    7.40    9.7   11.50  20.7   9.957516   12.411539
#> Temp    56.0   72.00   79.0   85.00  97.0  77.882353   89.591331
#> Month    5.0    6.00    7.0    8.00   9.0   6.993464    2.006536
#> Day      1.0    8.00   16.0   23.00  31.0  15.803922   78.579721

explore_outliers(airquality)
#>         outlier_count
#> Ozone               6
#> Solar.R             0
#> Wind                5
#> Temp                3
#> Month               0
#> Day                 0

missing <- explore_missing(airquality, type = "location")
head(missing)
#>    Ozone Solar.R Wind Temp Month Day   Index
#> 5     NA      NA 14.3   56     5   5       5
#> 6     28      NA 14.9   66     5   6       6
#> 10    NA     194  8.6   69     5  10      10
#> 11     7      NA  6.9   74     5  11      11
#> 25    NA      66 16.6   57     5  25      25
#> 26    NA     266 14.9   58     5  26      26

explore_missing(airquality, type = "count")
#>         Number.of.missing.values Proportion.of.missing.data
#> Ozone                         37                 0.24183007
#> Solar.R                        7                 0.04575163
#> Wind                           0                 0.00000000
#> Temp                           0                 0.00000000
#> Month                          0                 0.00000000
#> Day                            0                 0.00000000

explore_feature_map(iris)
```
![](/imgs/feature_map.png)

### R Ecosystem

This R package will build using the [`tidyverse`](https://www.tidyverse.org/) ecosystem that will help first time data science users more easily get started with their data projects. A similar package, [`DataExplorer`](https://cran.r-project.org/web/packages/DataExplorer/vignettes/dataexplorer-intro.html) is another EDA tool available. There are not many EDA packages that exist because the `tidyverse` ecosystem allows full control of data wrangling and visualization, however users who are not experts with these packages will find `xplrrr` very useful.

### Dependencies

- [`ggplot2 3.2.1`](https://github.com/tidyverse/ggplot2)  
- [`purrr 0.3.3`](https://github.com/tidyverse/purrr)  
- [`gridExtra 2.3`](https://github.com/cran/gridExtra)  
- [`testthat 2.3.1`](https://github.com/r-lib/testthat)  
- [`matrixStats 0.55.0`](https://github.com/HenrikBengtsson/matrixStats)  

## Contributions

Contributions are welcome, and they are greatly appreciated! Every little bit
helps, and credit will always be given. See [CONTRIBUTING.md](CONTRIBUTING.md) for further details.

### Contributors

Name     | Github ID
------- | -------
Braden Tam   | [bradentam](https://github.com/bradentam)  
Furqan Khan  | [fkhan72](https://github.com/fkhan72)
Serhiy Pokrovskyy | [pokrovskyy](https://github.com/pokrovskyy)
Yu Fang | [lori94](https://github.com/lori94)  

For the complete list of project contributors, see [CONTRIBUTORS.md](CONTRIBUTORS.md)