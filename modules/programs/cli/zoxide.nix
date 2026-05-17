{ config, pkgs, input, ... }:

{
  home-manager.users.dhanvanth = {
  programs.zoxide = {
   enable = true;
   enableZshIntegration = true;
   };
  };
}
