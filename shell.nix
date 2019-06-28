
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
       rPackages.tikzDevice
      rPackages.knitr
      rPackages.tswge
      rPackages.ggthemes
      rPackages.cowplot
      rPackages.tufte
      rPackages.dplyr
      rPackages.purrr
      rPackages.quantmod
      rPackages.rsconnect
      rPackages.magrittr
      rPackages.prophet
      rPackages.drake
      rPackages.future
      rPackages.tint
      rPackages.microbenchmark
      rPackages.bookdown
      rPackages.servr
      openblas
      evince
      xsv
      texlive.combined.scheme-full
    ];
  }
