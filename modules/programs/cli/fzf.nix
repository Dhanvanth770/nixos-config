{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  fzf
  fishPlugins.fzf-fish
  ];
  home-manager.users.dhanvanth = {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      changeDirWidgetCommand = "fd --type d";
      fileWidgetCommand = "fd --type f";
        fileWidgetOptions = [
          "--preview 'bat --color=always {}'" 
          "--bind 'enter:become(nano {})'"   
        ];
      colors = {
        "bg+" = "#000000";
        "bg" = "#000000";
        "spinner" = "#FFE135";
        "hl" = "#FFE135";
        "fg" = "#ffffff";
        "header" = "#FFE135";
        "info" = "#FFE135";
        "pointer" = "#FFE135";
        "marker" = "#FFE135";
        "fg+" = "#ffffff";
        "prompt" = "#FFE135";
        "hl+" = "#FFE135";
      };
      defaultOptions = [
        "--height 40%"
        "--border"
        "--layout=reverse"
      ];
    };
  };
}
