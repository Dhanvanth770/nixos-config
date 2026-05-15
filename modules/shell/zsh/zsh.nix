{ config, pkgs, ... }:

{

  programs.zsh.enable = true;
  users.users.dhanvanth.shell = pkgs.zsh;

  home-manager.users.dhanvanth = {
  programs.zsh = {
    enable = true;
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
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#thispc";
      upgrade = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .#thispc";
      clean = "sudo nix-env --delete-generations old && sudo nix-collect-garbage -d";
      ls = "eza --icons=always";
      ll = "eza --icons=always -l --header";
      la = "eza --icons=always -la --header";
      tree = "eza --icons=always --tree";
      neofetch = "fastfetch";
      };
    };
 
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = "$directory$fill$time\n$character";
        directory = {
          format = "[$path]($style)";
          style = "bold cyan";
          truncation_length = 3;
          truncate_to_repo = false;
        };
        fill = {
          symbol = " ";
        };
        time = {
          disabled = false;
          format = "[$time]($style)";
          style = "bold yellow";
          time_format = "%H:%M:%S";
        };
        character = {
          success_symbol = "[❯](bold green) ";
          error_symbol = "[❯](bold red) ";
        };
      };
    };
  };
} 
