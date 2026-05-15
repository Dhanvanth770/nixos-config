{ config, inputs, pkgs, ... }:

{

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

  home-manager.users.dhanvanth = {
  home.pointerCursor = {
    package = pkgs.kdePackages.breeze;
    name = "breeze_cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    };
  };

services.udev.extraRules = ''
  ATTRS{name}=="2.4G Receiver Mouse", ENV{LIBINPUT_CONFIG_ACCEL_PROFILE}="flat"
  '';

}
