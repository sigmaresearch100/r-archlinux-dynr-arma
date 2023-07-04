#!/bin/bash

set -e

# Solution to hard-coded Makevars in the arma branch
Rscript -e "                 \
    install.packages(       \
        c(                  \
          'Rcpp',           \
          'RcppArmadillo',  \
          'RcppGSL'         \
        ),                  \
        repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/latest/'), \
        lib = file.path(Sys.getenv('R_HOME'), 'library')                         \
    )                                                                            \
"

# roxygen2
Rscript -e "                                              \
    remotes::install_version(                             \
        package = 'roxygen2',                             \
        version = '5.0.1',                                \
        repos = c(CRAN = 'https://cran.rstudio.com')      \
    )                                                     \
"

# dynrautoVAR
Rscript -e "          \
    install.packages( \
        c(            \
          'qgraph',   \
          'igraph',   \
          'fclust'    \
        ),            \
        repos = c(REPO_NAME = 'https://packagemanager.rstudio.com/all/latest/')  \
    )                                                                            \
"

# tinytex
Rscript -e "                                              \
    try(tinytex::install_tinytex())                       \
"

git clone -b arma https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
Rscript -e "demo('LinearSDE', package = 'dynr')"
rm LinearSDE.*
rm Rplots.pdf
echo -e "\nInstall dynr, done!"
