{
  description = "Nix flake for R publishing development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      # Base packages
      basePackages = with pkgs; [
        R
        pandoc
        quarto
        radianWrapper
      ];

      # R packages
      rPackages = with pkgs.rPackages; [
        cranlogs
        devtools
        knitr
        languageserver
        pak
        renv
        rix
        rlang
        rmarkdown
        scholar
        tidyverse
        usethis
      ];

      # Texlive packages
      texlivePackages = with pkgs.texlive; [
        (combine {
          inherit
            scheme-medium
            datetime
            ebgaramond
            ebgaramond-maths
            fmtcount
            fontawesome5
            lastpage
            lualatex-math
            orcidlink
            sectsty
            svn-prov
            ;
        })
      ];

      allPackages = basePackages ++ rPackages ++ texlivePackages;
    in {
      devShell = pkgs.mkShell {
        name = "r-dev";
        buildInputs = allPackages;
      };
    });
}
