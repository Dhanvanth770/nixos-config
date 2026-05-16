{ inputs, pkgs, ... }:

{

  users.users.dhanvanth = {  shell = pkgs.fish;  };
  programs.fish.enable = true;

  home-manager.users.dhanvanth = {
  programs.fish = {
    enable = true;
  
  interactiveShellInit = ''
    set fish_greeting ""
  
    if not set -q _NITCH_ONCE
      set -gx _NITCH_ONCE 1
      ${pkgs.nitch}/bin/nitch
    end

    # autocd
    set -g fish_features autocd
  '';
  
  # extract
  functions = {
    extract = ''
      if test -f $argv[1]
        switch $argv[1]
          case "*.tar.bz2"
            tar xjf $argv[1]
          case "*.tar.gz"
            tar xzf $argv[1]
          case "*.zip"
            unzip $argv[1]
          case "*.gz"
            gunzip $argv[1]
          case "*.rar"
            unrar x $argv[1]
          case "*.7z"
            7z x $argv[1]
          case "*"
            echo "Unknown format: $argv[1]"
        end
      else
        echo "File not found: $argv[1]"
      end
    '';

    # web search function
    google = ''
      open "https://www.google.com/search?q="(string join "+" $argv)
    '';
    
    duck = ''
      open "https://duckduckgo.com/?q="(string join "+" $argv)
    '';
  };

  shellAbbrs = {
    please = "sudo";
      };
    };
  };
}
