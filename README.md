README
================

# EPA Disclaimer

This software/application was developed by the U.S. Environmental
Protection Agency (USEPA). No warranty expressed or implied is made
regarding the accuracy or utility of the system, nor shall the act of
distribution constitute any such warranty. The USEPA has relinquished
control of the information and no longer has responsibility to protect
the integrity, confidentiality or availability of the information. Any
reference to specific commercial products, processes, or services by
service mark, trademark, manufacturer, or otherwise, does not constitute
or imply their endorsement, recommendation or favoring by the USEPA. The
USEPA seal and logo shall not be used in any manner to imply endorsement
of any commercial product or activity by the USEPA or the United States
Government.

<!-- badges: start -->

[![R-CMD-check](https://github.com/USEPA/untidywindrose/workflows/R-CMD-check/badge.svg)](https://github.com/USEPA/untidywindrose/actions)
<!-- badges: end -->

# untidywindrose

A windrose is a graphical representation of the distribution of
windspeed and wind direction at a location. Windroses are useful for the
assessment of air pollution measurements and are a useful tool for air
pollution scientists. Untidywindrose is an easy to use web application
that can be used to create windroses from text based tabular data files
that makes producing windroses relatively simple and straightforward.
All that is required is a text based, delimited tabular data which
contains columnar measurements representing windspeed and wind
direction. Untidywindrose allows the user to select which column of data
which represents both windspeed and wind direction from the data file,
then a windrose is created and displayed. The user is then given the
option to download the newly created windrose. All without having to
install any software or having to learn a new programming language.

## Getting Started

## Installation

### Install the development version of Untidywindrose

If you do not have the remotes package installed, install it now

> install.packages(“remotes”, dependencies = TRUE)

next install the development version of untidywindrose.

``` r
remotes::install_github(repo = "USEPA/untidywindrose",
                        dependencies = TRUE,
                        upgrade = "always",
                        build = TRUE,
                        #optional, if you want the manual
                        build_manual = TRUE,
                        #optional, if you want the vignette
                        build_vignettes = TRUE
                        )
```

## attach the package then run untidywindrose()

> library(untidywindrose)

> untidywindrose::untidywindrose()

## Usage

Please refer to the vignette for untidywindrose provided with this
package for further instructions

> vignette(untidywindrose)

## Authors

-   Clinton Mccrowey, Physical Scientist - U.S. Environmental Protection
    Agency

### Contributors

-   (advisor/tester) Howard Schmidt, Environmental Engineer - U.S.
    Environmental Protection Agency
-   (management) Alice Chow, Associate Director - U.S. Environmental
    Protection Agency
-   (document review) Cynthia Stahl Ph.D., Environmental Scientist -
    U.S. Environmental Protection Agency

## EPA Disclaimer

The United States Environmental Protection Agency (EPA) GitHub project
code is provided on an “as is” basis and the user assumes responsibility
for its use. EPA has relinquished control of the information and no
longer has responsibility to protect the integrity , confidentiality, or
availability of the information. Any reference to specific commercial
products, processes, or services by service mark, trademark,
manufacturer, or otherwise, does not constitute or imply their
endorsement, recommendation or favoring by EPA. The EPA seal and logo
shall not be used in any manner to imply endorsement of any commercial
product or activity by EPA or the United States Government.

\#\#License This project is licensed under the CC0 License - see the
[LICENSE.md](LICENSE.md) file for details
