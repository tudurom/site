{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
, orator ? import sources.orator }:

pkgs.stdenv.mkDerivation rec {
  name = "tudorSite";
  version = "unstable";

  src = ./.;

  buildInputs = [ orator ];
  dontInstall = true;

  buildPhase = ''
    buildDir="$(pwd)"

    cp -rf $src/* "$buildDir"
    orator
    mv ./gen "$out"
  '';
}
