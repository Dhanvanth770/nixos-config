{ config, pkgs, inputs, ... }:

{
 # Environment Variables
  environment.sessionVariables = {
  XCURSOR_THEME = "Adwaita";
  XCURSOR_SIZE = "24";
  WLR_NO_HARDWARE_CURSORS = "1";
  GTK_USE_PORTAL = "1";
  NIXOS_OZONE_WL = "1";
  XDG_SESSION_TYPE = "wayland";
  GDK_BACKEND = "wayland,x11";
  QT_QPA_PLATFORM = "wayland;xcb";
  DISPLAY = ":0";
  XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
  };

}
