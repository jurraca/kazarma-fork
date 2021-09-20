{
    release,
    postgresql_13,
    dockerTools
}: dockerTools.buildLayeredImage {
        name = "kazarma";
        fromImage = "bitwalker/alpine-elixir-phoenix";
        fromImageTag = "1.11.3";
        contents = [ kazarmaRelease postgresql_13 ];

        config = {
            Cmd = [ "./app/bin/kazarma start" ];
            ExposedPorts = {
                "4000" = { };
              };
        };
      } 
    