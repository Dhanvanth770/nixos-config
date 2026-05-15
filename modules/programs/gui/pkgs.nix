{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  qimgv
  tauon
  mousepad
  mission-center
  qbittorrent-enhanced
  bazaar
  gparted
  lmstudio
  ];

}
