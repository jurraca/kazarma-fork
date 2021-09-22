{
  description = "A Matrix bridge to ActivityPub.";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs?ref=master;
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    let
    pkgsForSystem = system: import nixpkgs {
        overlays = [ overlay ];
        inherit system;
      };

    overlay = final: prev: rec {
      beamPackages = prev.beam.packagesWith prev.beam.interpreters.erlangR24;
      nodeDependencies = (prev.callPackage ./assets/default.nix { }).shell.nodeDependencies;

      kazarma = prev.callPackage ./nix/kazarma.nix { inherit beamPackages nodeDependencies; };
      docker-release = prev.callPackage ./nix/docker-prod.nix { inherit kazarma;};
    };
    in utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" "aarch64-linux"] (system: rec {
      legacyPackages = pkgsForSystem system;
      packages = utils.lib.flattenTree {
        inherit (legacyPackages) kazarma docker-release;
      };
      defaultPackage = packages.kazarma;
      devShell = self.devShells.${system}.dev;
      devShells = {
        dev = import ./nix/shell.nix {
          pkgs = legacyPackages;
          db_name = "kazarma_dev";
          MIX_ENV = "dev";
        };
        test = import ./nix/shell.nix {
          pkgs = legacyPackages;
          db_name = "kazarma_test";
          MIX_ENV = "test";
        };
      };
      apps.kazarma = utils.lib.mkApp { drv = packages.kazarma; };
      hydraJobs = { inherit (legacyPackages) kazarma; };
      checks = { inherit (legacyPackages) kazarma; };
    }) // { overlay = overlay ;};
}
