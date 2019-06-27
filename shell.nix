
let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    name = "tstest";
    buildInputs = with pkgs; [
       R
       rPackages.tidyverse
       rstudio
       rPackages.rmarkdown
       rPackages.pander
       rPackages.ggplot2
       rPackages.glue
      rPackages.knitr
      rPackages.tswge
      rPackages.dplyr
      rPackages.purrr
      rPackages.quantmod
      rPackages.magrittr
      rPackages.prophet
      rPackages.drake
      rPackages.future
      rPackages.tint
      rPackages.microbenchmark
      rPackages.bookdown
      openblas
      evince
      xsv
      texlive.combined.scheme-full
    ];
  }
