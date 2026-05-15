{ config, pkgs, lib, ...}:

{
  home-manager.users.dhanvanth = {
  programs.alacritty = {
    enable = false;
    settings = {
      window = {
        opacity = lib.mkForce 0.6;
        blur = true;
        padding = {
          x = 10;
          y = 10;
        };
      };

      font = {
        size = lib.mkForce 11.0;
        normal = {
          family = lib.mkForce "JetBrainsMono Nerd Font";
          style = "Regular";
        };
      };

    colors = {
      primary = {
        background = lib.mkForce "#000000";
        foreground = lib.mkForce "#ffffff";
          };
        };
      };
    };
  };
}

