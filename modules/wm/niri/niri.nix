{ pkgs, inputs, config, lib, ... }:

{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri;
  };

   programs.xwayland.enable = true;

   xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ 
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri = {
        default = [ "gnome" "gtk" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
          "org.freedesktop.impl.portal.Settings" = [ "gtk" ];
        };
      };
    };

  home-manager.users.dhanvanth = {
    home.packages = [
      pkgs.xdg-desktop-portal-gnome
    ];
  };
 
  security.polkit.enable = true;
  environment.systemPackages = with pkgs; [ polkit_gnome ];
}
