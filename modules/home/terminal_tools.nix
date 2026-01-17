{ config, lib, pkgs, ... }:

{
  config = lib.mkMerge [
    (lib.mkIf config.myConfig.foot {
      programs.foot = {
        enable = true;
        settings = {
          main = {
            font = "JetBrainsMono Nerd Font:size=11";
            pad = "15x15";
          };
          colors = {
            background = "1a1b26";
            foreground = "c0caf5";
            regular0 = "15161e"; # black
            regular1 = "f7768e"; # red
            regular2 = "9ece6a"; # green
            regular3 = "e0af68"; # yellow
            regular4 = "7aa2f7"; # blue
            regular5 = "bb9af7"; # magenta
            regular6 = "7dcfff"; # cyan
            regular7 = "a9b1d6"; # white
          };
        };
      };
    })

    # Configuração do Superfile
    (lib.mkIf config.myConfig.superfile {
      home.packages = [ pkgs.superfile ];

      xdg.configFile."superfile/config.toml".text = ''
        [theme]
        name = "catppuccin" # Um tema que combina bem com Material Design
        
        [sidebar]
        show_hidden = false
        width = 20
      '';
    })
  ];
}