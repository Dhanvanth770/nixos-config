{ config, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
      extraOptions = [
        "--group-directories-first"
        "--header"
      ];
    };
  };
}
