{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home/niri.nix
    ../../modules/home/dms.nix
    ../../modules/home/fish.nix
    ../../modules/home/terminal_tools.nix
    ../../modules/home/emacs.nix
  ];

  home.username = "rvsantos";
  home.homeDirectory = "/home/rvsantos";

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    
    pavucontrol # Controle de áudio
    libnotify   # Notificações do sistema
  ];

  fonts.fontconfig.enable = true;

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}