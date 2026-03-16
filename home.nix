
{ config, pkgs, inputs, ... }:

{

  imports = [
    ./homemodules/hyprland.nix
    ./homemodules/alacritty.nix
    ./homemodules/rofi.nix
  ];

  home.username = "dhanvanth";
  home.homeDirectory = "/home/dhanvanth";
  home.stateVersion = "26.05";

  # Per user packages
  home.packages = with pkgs; [
  nitch
  fastfetch
  btop
  zsh-powerlevel10k
  cava
  unimatrix
  stoat-desktop
  pipes
  asciiquarium
  tty-clock
  yazi
  adwaita-icon-theme
  xdg-desktop-portal-gtk
  loupe
  papers
  mousepad
  ];

  # enable zsh
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
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
      if [[ -z "$_NITCH_ONCE" ]]; then
      export _NITCH_ONCE=1
      ${pkgs.nitch}/bin/nitch
    fi
  '';
  shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    upgrade = "cd /etc/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .#nixos";
    clean = "sudo nix-env --delete-generations old && sudo nix-collect-garbage -d";
    ls = "eza --icons=always";
    ll = "eza --icons=always -l --header";
    la = "eza --icons=always -la --header";
    tree = "eza --icons=always --tree"; 
    neofetch = "fastfetch";
    };
  };

  # enable eza
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

   # home variables
   home.sessionVariables = {
   GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
   QT_STYLE_OVERRIDE = "Adwaita-dark";
   PATH = "$HOME/.local/bin:$PATH";
   };
 
   # dark themeing
    dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
	gtk-theme = "Adwaita-dark";
	color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "Adwaita-dark";
    style = {
      name = "Adwaita-dark";
      package = pkgs.adwaita-qt6;
    };
  };

  # wallpaper selector - hyprland
  home.file.".local/bin/wallpaper-picker" = {
  executable = true;
  text = ''
    #!/usr/bin/env bash
    WALL_DIR="$HOME/Pictures/Wallpapers"
    if ! pgrep -x "swww-daemon" > /dev/null; then
        swww-daemon &
        sleep 0.2
    fi
    CHOICE=$(ls "$WALL_DIR" | while read -r file; do
        echo -en "$file\0icon\x1f$WALL_DIR/$file\n"
    done | rofi -dmenu \
        -i \
        -p "󰸉 " \
        -theme-str 'configuration { show-icons: true; }
        window { width: 800px; }
        listview { columns: 4; lines: 3; }
        element { orientation: vertical; }
        element-icon { size: 167px; border-radius: 8px; }')
    if [ -n "$CHOICE" ]; then
        swww img "$WALL_DIR/$CHOICE" \
            --transition-type center \
            --transition-fps 60 \
            --transition-duration 1.5
    fi
    '';
  };

  programs.home-manager.enable = true;

}
