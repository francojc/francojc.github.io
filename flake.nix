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
        # Utils
        devtools
        knitr
        languageserver
        pak
        renv
        rlang
        rmarkdown
        usethis
        # Project
        cranlogs
        tidyverse
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
            ;
        })
      ];

      allPackages = basePackages ++ rPackages ++ texlivePackages;
    in {
      devShell = pkgs.mkShell {
        name = "r-dev";
        buildInputs = allPackages;
        shellHook = ''
          export R_LIBS_USER=$PWD/R/library;
          mkdir -p "$R_LIBS_USER";
        '';
      };
    });
}
