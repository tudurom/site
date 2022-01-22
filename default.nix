{ pkgs ? import <nixpkgs>, orator, ... }:
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
