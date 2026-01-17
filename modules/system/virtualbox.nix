{ config, lib, pkgs, ... }:

{
  options.myConfig.virtualbox = lib.mkEnableOption "Habilitar suporte a VirtualBox";

  config = lib.mkIf config.myConfig.virtualbox {
    # Drivers e serviços para VirtualBox
    virtualisation.virtualbox.guest.enable = true;
    virtualisation.virtualbox.guest.dragAndDrop = true;
    
    # O Niri precisa de aceleração 3D para rodar bem. 
    # No VirtualBox, isso é instável, então forçamos o software rendering se necessário.
    environment.variables = {
      "WLR_NO_HARDWARE_CURSORS" = "1";
      "LIBGL_ALWAYS_SOFTWARE" = "1"; # Use isso se o Niri não iniciar
    };
  };
}