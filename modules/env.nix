{ config, pkgs, inputs, ... }:

{
 # Environment Variables
  environment.sessionVariables = {
  XCURSOR_THEME = "Adwaita";
  XCURSOR_SIZE = "24";
  WLR_NO_HARDWARE_CURSORS = "1";
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
