{ config, pkgs, inputs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      clock = "%H:%M";
      bigclock = true;
      log = "/dev/null";
    };
  };
}
