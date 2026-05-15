{ config, inputs, pkgs, ... }:

{

  # Detecting other disks
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;

}
