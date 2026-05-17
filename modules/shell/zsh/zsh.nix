{ config, pkgs, ... }:

{
#  users.users.dhanvanth.shell = pkgs.zsh;
  home-manager.users.dhanvanth = {
  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "extract" "web-search" "cp" "history" ];
    };
    initContent = ''
      if [[ -z "$_NITCH_ONCE" ]]; then
        export _NITCH_ONCE=1
        ${pkgs.nitch}/bin/nitch
      fi
    '';
    };
  };
} 
