{
  description = "A flake template for Elixir projects built with Mix";

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

      kazarma = with final;
        let
          beamPackages = beam.packagesWith beam.interpreters.erlangR24; 
          mixNixDeps = import ./deps.nix { inherit lib beamPackages; }; 
        in beamPackages.mixRelease {
          inherit mixNixDeps;
          pname = "kazarma";
          src = ./.;
          version = "0.0.0";
         };
    };
    in utils.lib.eachDefaultSystem (system: rec {
      legacyPackages = pkgsForSystem system;
      packages = utils.lib.flattenTree {
        inherit (legacyPackages) kazarma;
      };
      defaultPackage = packages.kazarma;
      devShell = self.devShells.${system}.dev;
      devShells = {
        dev = import ./shell.nix {
          pkgs = legacyPackages;
          db_name = "kazarma_dev";
          MIX_ENV = "dev";
        };
        test = import ./shell.nix {
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
