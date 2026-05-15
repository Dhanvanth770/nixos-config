{ config, pkgs, inputs, ... }:

{

  # Power-Profile
  services.power-profiles-daemon.enable = true;

  # Upower
  services.upower.enable = true;

}
