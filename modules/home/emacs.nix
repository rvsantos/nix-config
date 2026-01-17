{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myConfig.emacs {
    services.emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk; 
    };

    programs.emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk;
      extraPackages = epkgs: with epkgs; [
        vterm          # Terminal ultra-rápido dentro do Emacs
        magit          # O melhor cliente Git do mundo
        org-roam       # Essencial para gerenciar notas de estudo (Zettelkasten)
        nix-mode       # Suporte para você editar seu próprio config do NixOS
        doom-themes    # Temas visuais modernos
      ];
    };

    # Variável de ambiente para garantir que o Emacs use Wayland nativo
    home.sessionVariables = {
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
  };
}