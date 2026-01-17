{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix             # Será gerado dentro da VM
    ./settings.nix
    ../../modules/options.nix
    ../../modules/system/core.nix
    ../../modules/system/boot.nix
    ../../modules/system/virtualbox.nix # Módulo de VM
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "vbox-test";
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";

  users.users.rvsantos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = if config.myConfig.fish then pkgs.fish else pkgs.bash;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."rvsantos" = import ../../users/rvsantos/home.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # Habilitar Niri no sistema para portais e login
  programs.niri.enable = config.myConfig.niri;

  system.stateVersion = "23.11";
}