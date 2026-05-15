{ config, pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [
  hyprpanel
  awww
  inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

}
