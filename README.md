README
================

# untidywindrose

A windrose is a graphical representation of the distribution of
windspeed and wind direction at a location. windroses are useful for the
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

# Untidy windrose requires the following R packages to be installed before

deployment  
&gt; install.packages(c(“DT”, “openair”, “dplyr”, “shiny”, “shinyjs”),
dependencies=T)

<!-- ##  (optional) Load libraries into R   -->
<!-- library(DT)   -->
<!-- library(openair)   -->
<!-- library(dplyr)   -->
<!-- library(shiny)   -->
<!-- library(shinyjs)   -->

## Installation

### clone repository

> git clone <https://bitbucket.epa.gov/scm/aqda/untidywindrose.git>

### Build the library with devtools

> devtools::build(binary = FALSE, manual = TRUE, vignettes = TRUE)  
> devtools::build\_readme()

## attach the package

library(untidywindrose)

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
-   (technical review) Cynthia Stahl ph.D., Environmental Scientist -
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

By submitting a pull request, you make an agreement with EPA that you
will not submit a claim of compensation for services rendered to EPA or
any other federal agency. Further, you agree not to charge the time you
spend developing software code related to this project to any federal
grant or cooperative agreement.

\#\#License This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details
