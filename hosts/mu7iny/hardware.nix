{ ... }: {
  fileSystems."/" = { device = "/dev/sda1"; }; 
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
}