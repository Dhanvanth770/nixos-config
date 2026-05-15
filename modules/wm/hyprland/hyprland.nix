{ pkgs, inputs, lib, ... }:

{
  # enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # portals
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk 
                     pkgs.xdg-desktop-portal-hyprland 
                     pkgs.xdg-desktop-portal-gnome 
                     ];
    configPackages = with pkgs; [ xdg-desktop-portal-gtk 
                                  pkgs.xdg-desktop-portal-gnome 
                                  ];
    config = lib.mkForce {
    common = {
      default = [ "gnome" "gtk" ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
    hyprland.default = [ "hyprland" "gtk" ];
    };
  };
}
