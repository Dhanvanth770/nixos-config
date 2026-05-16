{ inputs, pkgs, ... }:

{
  home-manager.users.dhanvanth = {
    programs.fish = {
      enable = true; 
      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#thispc";
        upgrade = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .#thispc";
        clean = "sudo nix-env --delete-generations old && sudo nix-collect-garbage -d";
        ls = "eza --icons=always";
        ll = "eza --icons=always -l --header";
        la = "eza --icons=always -la --header";
        tree = "eza --icons=always --tree";
        neofetch = "fastfetch";
        asciiquarium = "asciiquarium -t";
        nhs = "nh os switch /etc/nixos";
        nhb = "nh os boot /etc/nixos";
        nht = "nh os test /etc/nixos";
        update = "sudo nix flake update /etc/nixos && nh os switch /etc/nixos";
      };
    };
  };
}

