{ lib, ... }:

{
  options.myConfig = {
    # --- Bootloaders (Escolha apenas um como true) ---
    systemd-boot = lib.mkEnableOption "Habilitar Systemd-boot";
    grub = lib.mkEnableOption "Habilitar GRUB";

    # --- Interface e Window Manager ---
    niri = lib.mkEnableOption "Niri Compositor";
    dms = lib.mkEnableOption "DankMaterialShell";
    
    # --- Hardware ---
    amd = lib.mkEnableOption "Drivers de GPU AMD";
    
    # --- Aplicativos ---
    fish = lib.mkEnableOption "Shell Fish";
    emacs = lib.mkEnableOption "Editor Emacs";
    superfile = lib.mkEnableOption "Gerenciador de arquivos Superfile";
    foot = lib.mkEnableOption "Terminal Foot";

    virtualbox = lib.mkEnableOption "Configurações para VirtualBox";
  };
}