{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myConfig.fish {
    programs.fish = {
      enable = true;
      
      shellAliases = {
        fm = "superfile";
        rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles#desktop";
        nix-clean = "sudo nix-collect-garbage -d";
        
    
        ".." = "cd ..";
        "..." = "cd ../..";
      };

      interactiveShellInit = ''
        set -g fish_greeting # Remove a mensagem de boas-vindas do Fish
        
        # Configuração de cores inspirada no Material Design (DMS)
        set -g fish_color_command blue
        set -g fish_color_param cyan
        set -g fish_color_autosuggestion 555
      '';
    };

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;
        format = "$directory$character";
      };
    };
  };
}