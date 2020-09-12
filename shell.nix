{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs {}
, orator ? import sources.orator }:

pkgs.mkShell {
  buildInputs = [
    orator
  ];
}
