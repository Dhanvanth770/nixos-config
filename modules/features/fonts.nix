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
    roboto-mono
    (pkgs.runCommand "share-tech-mono" {} ''
    mkdir -p $out/share/fonts/truetype
    cp ${pkgs.fetchurl {
      url = "https://github.com/google/fonts/blob/main/ofl/sharetechmono/ShareTechMono-Regular.ttf?raw=true";
      sha256 = "sha256-nOqx+HQUgpryWcD1N1c64D733TFHwLJ6NqGgvrZzJnc=";
    }} $out/share/fonts/truetype/ShareTechMono-Regular.ttf
  '')
  ];

  fonts.fontconfig = {
  enable = true;
  antialias = true;
  hinting.enable = true;
  hinting.style = "slight";
  subpixel.rgba = "rgb";
  defaultFonts = {
    monospace = [ "Share Tech Mono" ];
    sansSerif = [ "Share Tech Mono" ];
    serif = [ "Noto Serif" ];
    };
  };
}
