{ config, lib, ... }:

{
  config = lib.mkMerge [
    # Configuração se Systemd-boot for true
    (lib.mkIf config.myConfig.systemd-boot {
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
    })

    # Configuração se GRUB for true
    (lib.mkIf config.myConfig.grub {
      boot.loader.grub = {
        enable = true;
        device = "nodev"; # Para instalação em modo EFI
        efiSupport = true;
        useOSProber = true; # Detecta outros sistemas (como Windows)
      };
      boot.loader.efi.canTouchEfiVariables = true;
    })
  ];
}