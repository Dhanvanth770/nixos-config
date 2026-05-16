{ inputs, pkgs, ... }:

{
  programs.nh = {
    enable = true; 
    flake = "/etc/nixos";
  };
  environment.variables = {
  NH_FLAKE = "/etc/nixos";
  };
}
