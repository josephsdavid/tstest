
let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    name = "timeseRies";
    buildInputs = with pkgs; [
       R
       python37
       rPackages.tidyverse
       rstudio
       rPackages.rmarkdown
       rPackages.pander
      rPackages.ggplot2
      rPackages.knitr
      rPackages.tswge
      rPackages.dplyr
      rPackages.purrr
      rPackages.quantmod
      rPackages.magrittr
      rPackages.prophet
      rPackages.drake
      rPackages.future
      rPackages.microbenchmark
      rPackages.bookdown
      openblas
      evince
      xsv
      texlive.combined.scheme-full
    ];
  }
