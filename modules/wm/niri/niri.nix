{ config, pkgs, lib, inputs, ... }:

{
  programs.niri = {
    enable = true;
  };

  services.displayManager.sessionPackages = [ pkgs.niri ];
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gtk 
      pkgs.xdg-desktop-portal-gnome
    ];
    config = lib.mkForce {
    common = {
      default = [ "gnome" "gtk" ];
      "org.freedesktop.impl.portal.Settings" = [ "gtk" ]; 
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    niri.default = [ "gnome" "gtk" ];
    };
  };

  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [ polkit_gnome ];
}
