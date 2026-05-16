{ config, inputs, pkgs, ... }:

{
  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
}
