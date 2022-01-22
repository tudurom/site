{
  description = "My website";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs/nixos-21.11;
    utils.url = github:numtide/flake-utils;
    orator.url = github:tudurom/orator;
  };

  outputs = inputs@{ self, nixpkgs, utils, orator }:
  utils.lib.eachDefaultSystem (system:
  let
    pkgs = nixpkgs.legacyPackages.${system};
    packageName = "site";
    oratorPkg = inputs.orator.packages.${system}.orator;
  in {
    packages.${packageName} = import ./default.nix { inherit pkgs; orator = oratorPkg; };
    defaultPackage = self.packages.${system}.${packageName};

    devShell = pkgs.mkShell {
      buildInputs = [ oratorPkg ];
    };
  }
  );
}
