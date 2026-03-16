{ config, pkgs, inputs, ... }:

{
 # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
  ];

  fonts.fontconfig = {
  enable = true;
  antialias = true;
  hinting.enable = true;
  hinting.style = "slight";
  subpixel.rgba = "rgb";
  defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    sansSerif = [ "Noto Sans" ];
    serif = [ "Noto Serif" ];
    };
  };
}
