{ config, pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [ inputs.spicetify-nix.nixosModules.default ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.text;
    customColorScheme = {
      accent = "FFE135";
      accent-active = "FFE135";
      accent-inactive = "000000";
      banner = "FFE135";
      border-active = "FFE135";
      border-inactive = "1A1A1A";
      header = "1A1A1A";
      highlight = "1A1A1A";
      main = "000000";             
      notification = "1DB954";     
      notification-error = "FF0000";
      subtext = "A0A0A0";
      text = "FFFFFF";
    };
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      shuffle
    ];
  };
  nixpkgs.config.permittedInsecurePackages = [
  "electron-38.8.4"
  ];

  environment.systemPackages = with pkgs; [
  spotdl   
  kew
  ]; 

}
