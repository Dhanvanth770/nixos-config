{ config, inputs, ... }:

{

  nix.gc = {
  automatic = true;
  dates = "weekly"; # Runs every 7 days
  options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

}
