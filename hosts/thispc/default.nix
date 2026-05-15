{ pkgs, inputs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "thispc";
  system.stateVersion = "26.05";

  users.users.dhanvanth = {
    isNormalUser = true;
    home = "/home/dhanvanth";
    description = "dhanvanth";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "gamemode" "adbusers" "plugdev" ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # home-manager
  home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;
  extraSpecialArgs = { inherit inputs; };
  users.dhanvanth = {
    home.username = "dhanvanth";
    home.homeDirectory = "/home/dhanvanth";
    home.stateVersion = "26.05";
    };
  };
}
