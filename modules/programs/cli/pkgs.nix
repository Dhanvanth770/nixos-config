{ config, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
  home.packages = with pkgs; [
  nitch
  btop
  cava
  unimatrix
  pipes
  asciiquarium
  tty-clock
  yazi
  duf
  bat
  imagemagick
  cowsay
  tmux
  lazygit
  bottom
  ];
 };
}
