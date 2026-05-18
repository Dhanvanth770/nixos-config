{ config, pkgs, inputs, ... }:

{
 # Environment Variables
  environment.sessionVariables = {
  WLR_NO_HARDWARE_CURSORS = "1";
  GTK_USE_PORTAL = "1";
  NIXOS_OZONE_WL = "1";
  XDG_SESSION_TYPE = "wayland";
  QT_QPA_PLATFORM = "wayland;xcb";
  DISPLAY = ":0";
  XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
  };

}
