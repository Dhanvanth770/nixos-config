{ inputs, pkgs, ... }:

{
  programs.fish.enable = true;
  users.users.dhanvanth = {  shell = pkgs.fish;  };
  home-manager.users.dhanvanth = {
  programs.fish = {
    enable = true;
    plugins = [
      {
      name = "fzf-fish";
      src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];
    interactiveShellInit = ''
    set fish_greeting ""
    set -g fish_prompt_pwd_dir_length 0
    set -g fzf_directory_opts --bind "alt-e:execute(nano {} &> /dev/tty)+abort"
     fzf_configure_bindings --directory=\et --history=\er
    if not set -q _NITCH_ONCE
      set -gx _NITCH_ONCE 1
      ${pkgs.nitch}/bin/nitch
    end
    set -g fish_features autocd
  '';
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
