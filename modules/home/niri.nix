{ config, lib, pkgs, inputs, ... }:

{
  # Só aplica se niri estiver como true no settings.nix
  config = lib.mkIf config.myConfig.niri {
    
    # Adiciona o pacote do Niri (usando o input do flake se quiser a versão mais nova)
    home.packages = [ 
      pkgs.niri 
      pkgs.xwayland        # Para apps antigos que não suportam Wayland nativo
      pkgs.swaybg          # Para gerenciar o papel de parede
      pkgs.wayland-utils
    ];

    # Configuração direta do Niri (arquivo kdl)
    # O Home-Manager pode escrever o arquivo de config diretamente
    xdg.configFile."niri/config.kdl".text = ''
      // Configuração Básica de Atalhos
      binds {
          // Abrir Terminal (Foot)
          Mod+Return { spawn "foot"; }
          
          // Abrir o DMS (DankMaterialShell / Launcher)
          Mod+D { spawn "dms"; }
          
          // Fechar Janela
          Mod+Q { close-window; }
          
          // Movimentação (Foco)
          Mod+Left  { focus-column-left; }
          Mod+Right { focus-column-right; }
          
          // Layout
          Mod+F { maximize-column; }
          
          // Sair do Niri
          Mod+Shift+E { quit; }
      }

      // Configurações de Janela e Estética
      layout {
          gaps 12
          center-focused-column "never"
          default-column-width { proportion 0.5; }
      }

      // Iniciar aplicativos automaticamente
      spawn-at-startup "swaybg" "-m" "fill" "-i" "/caminho/para/seu/wallpaper.jpg"
    '';

    # Importante para que o Niri reconheça o DMS e outros apps
    home.sessionVariables = {
      NIXOS_OZONE_WL = "1"; # Força apps Electron a usarem Wayland
    };
  };
}