{ config, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
  home.packages = with pkgs; [
  fd
  nitch
  btop
  cava
  unimatrix
  pipes
  asciiquarium-transparent
  tty-clock
  yazi
  duf
  bat
  imagemagick
  cowsay
  tmux
  lazygit
  bottom
  claude-code
  opencode
  ];
 };
}
