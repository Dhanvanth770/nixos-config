{ config, pkgs, lib, ...}:

 {
  home-manager.users.dhanvanth = {
  programs.foot = {
  enable = true;
  settings = {
    main = {
      font = lib.mkForce "Share Tech Mono:size=11";
      pad = "10x10"; 
      title = "foot";
      app-id = "foot";
    };
    colors-dark = {
      alpha = lib.mkForce 0.6; 
      background = lib.mkForce "000000"; 
      foreground = lib.mkForce "ffffff";
        };
      };
    };
  };
} 
