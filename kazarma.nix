
 {   
    lib, ... 
  }:
    let
      beamPackages = beam.packagesWith beam.interpreters.erlangR24; 
      mixNixDeps = import ./deps.nix { inherit lib beamPackages; }; 
    in beamPackages.mixRelease {
      inherit mixNixDeps;
      pname = "kazarma";
      src = ./.;
      version = "0.0.0";
    }