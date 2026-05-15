{ config, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
  services.hypridle = {
  enable = false;
  settings = {
    general = {
      after_sleep_cmd = "hyprctl dispatch dpms on && hyprlock";
      ignore_dbus_inhibit = false;
      lock_cmd = "hyprlock";
      before_sleep_cmd = "hyprlock";
    };
    listener = [
      {
        timeout = 300;
        on-timeout = "hyprlock";
      }
      {
        timeout = 600;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
