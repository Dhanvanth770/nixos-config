{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  # 1. Import the actual module from the flake inputs
  imports = [ inputs.spicetify-nix.nixosModules.default ];

  # 2. Configure Spicetify
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.sleek;
    colorScheme = "UltraBlack";

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
  };
}
