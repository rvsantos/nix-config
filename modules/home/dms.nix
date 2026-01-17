{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myConfig.dms {
    # Dependências comuns que o DMS e shells Material costumam usar
    home.packages = with pkgs; [
      # Se o DMS for o shell/dashboard, ele geralmente precisa de:
      glib
      gjs
      gtk3
      gtk4
      # Utilitários de estilo
      papirus-icon-theme
      adwaita-icon-theme
    ];

    # Configurações de Tema (Material Design)
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark"; # Ou um tema Material específico se preferir
        package = pkgs.gnome-themes-extra;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    # Aqui criamos o "ponto de chamada" do DMS no seu ambiente
    # Caso você precise baixar o repositório do DMS manualmente, 
    # podemos configurar o Nix para gerenciar o arquivo de config dele:
    xdg.configFile."dms/config.json".text = ''
      {
        "theme": "material",
        "accent": "blue",
        "transparency": true
      }
    '';

    # Variáveis de ambiente para garantir que o DMS renderize corretamente no Wayland
    home.sessionVariables = {
      GTK_THEME = "Adwaita-dark";
    };
  };
}