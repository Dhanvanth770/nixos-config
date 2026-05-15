{ config, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
    programs.hyprlock = {
      enable = false;
      settings = {
        general = {
          disable_loading_bar = false;
          hide_cursor = true;
          grace = 5;
        };
        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
          }
        ];
        input-field = [
          {
            size = "200, 50";
            position = "0, 80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(ffffff)";
            inner_color = "rgb(000000)";
            outer_color = "rgb(ffffff)";
            outline_thickness = 2;
            placeholder_text = " Password...";
            shadow_passes = 2;
            halign = "center";
            valign = "bottom";
          }
        ];
        label = [
          {
            text = "$TIME";
            font_size = 64;
            font_family = "JetBrainsMono Nerd Font";
            position = "0, 50";
            halign = "center";
            valign = "center";
            color = "rgba(255, 255, 255, 1.0)";
          }
          {
            text = "cmd[update:1000] date '+%A, %B %d'";
            font_size = 24;
            font_family = "JetBrainsMono Nerd Font";
            position = "0, -40";
            halign = "center";
            valign = "center";
            color = "rgba(255, 255, 255, 0.8)";
          }
        ];
      };
    };
  };
}
