{ pkgs, inputs, ... }:

{
  services.fwupd = {
    enable = true;
    daemonSettings = {
      EspLocation = "/boot";
      OnlyTrusted = true; 
    };
  };
}
