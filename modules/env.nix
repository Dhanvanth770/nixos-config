{ config, pkgs, inputs, ... }:

{
 # Environment Variables
  environment.sessionVariables = {
  XCURSOR_THEME = "Adwaita";
  XCURSOR_SIZE = "24";
  WLR_NO_HARDWARE_CURSORS = "1";
  GTK_USE_PORTAL = "1";
  XDG_CURRENT_DESKTOP = "Hyprland";
  XDG_SESSION_TYPE = "wayland";
  XDG_SESSION_DESKTOP = "Hyprland";
  };

  services.libinput = {
  enable = true;
  mouse = {
    accelProfile = "flat";
    accelSpeed = "0";
  };
  touchpad = {
    accelProfile = "flat";
    };
  };

services.udev.extraRules = ''
  ATTRS{name}=="2.4G Receiver Mouse", ENV{LIBINPUT_CONFIG_ACCEL_PROFILE}="flat"
  '';
}
