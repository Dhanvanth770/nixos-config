{ inputs, pkgs, ... }:

{
 home-manager.users.dhanvanth = {
  home.packages = with pkgs; [ papirus-icon-theme papirus-folders ];

  dconf.settings = {
  "org/gnome/desktop/interface" = {
    icon-theme = "Papirus-Dark";
    };
  };

  gtk = {
  enable = true;
  iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
      };
    };
  };
}
