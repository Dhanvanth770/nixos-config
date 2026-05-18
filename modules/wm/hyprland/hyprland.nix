{ pkgs, inputs, config, lib, ... }:

{
  # enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # portals
  xdg.portal = {
    enable = true;
    extraPortals = [
       pkgs.xdg-desktop-portal-gtk 
       pkgs.xdg-desktop-portal-hyprland  
       pkgs.xdg-desktop-portal-gnome
    ];
    config = {
      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };
}
