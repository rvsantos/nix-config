{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware.nix
    ./settings.nix
    ../../modules/options.nix
     ../../modules/system/core.nix
    ../../modules/system/boot.nix  # Importando o novo módulo de boot
    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "mu7iny";
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

  # Som e Gráficos baseados nas opções
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  hardware.graphics.enable = config.myConfig.amd;
  
  # Niri precisa ser habilitado no sistema para polkit e portais
  programs.niri.enable = config.myConfig.niri;

  system.stateVersion = "23.11";
}