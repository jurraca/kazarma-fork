{
    lib,
    beamPackages,
    nodeDependencies
}:
    let
      mixNixDeps = import ./deps.nix { inherit lib beamPackages; };
    in beamPackages.mixRelease {
        pname = "kazarma";
        src = ./.;
        version = "0.0.0";

        DB_NAME="kazarma_prod";
        DATABASE_URL="ecto://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost:$DB_NAME";
        HEX_HTTP_CONCURRENCY=1;
        HEX_HTTP_TIMEOUT=240;

        postBuild = ''
            ln -sf ${nodeDependencies}/lib/node_modules assets/node_modules
            npm run deploy --prefix ./assets

            # for external task you need a workaround for the no deps check flag
            # https://github.com/phoenixframework/phoenix/issues/2690
            mix do deps.loadpaths --no-deps-check, phx.digest
            mix phx.digest --no-deps-check
            ln -s /app "$out"
        '';
    }