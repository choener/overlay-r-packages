self: super: rec {

  # AutoGating (devel) has an example on how to include new r packages.

  rPackages = super.rPackages // {
    inherit ncdfFlow;
  };

  ncdfFlow = with rPackages;
    let
      biocVersion = "3.8"; # BiocVersion.version;
    in buildRPackage rec {
    name = "ncdfFlow";
    version = "2.28.1";
    # homepage src = "https://bioconductor.org/packages/${biocVersion}/bioc/html/${name}.html";
    src = super.fetchurl {
      sha256 = "1nabfa8nz6plw8w2xfla0xffqmxyk699dbv9615cazhf6vl6289f";
      urls = [
        "https://www.bioconductor.org/packages/release/bioc/src/contrib/${name}_${version}.tar.gz"
      ];
    };
    depends = [ BH Biobase BiocGenerics flowCore flowViz Rcpp RcppArmadillo Rhdf5lib zlibbioc super.zlib ];
    propagatedBuildInputs = depends;
    nativeBuildInputs = depends;
  };

}

