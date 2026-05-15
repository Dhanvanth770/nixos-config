{ config, pkgs, inputs, ... }:

{

  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 pkgs.canon-cups-ufr2 pkgs.gutenprint ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

}
