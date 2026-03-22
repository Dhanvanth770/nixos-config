
{ config, pkgs, inputs, lib, ... }:

{

  imports = [
    ./homemodules/hyprland.nix
    ./homemodules/alacritty.nix
    ./homemodules/rofi.nix
    ./homemodules/fastfetch.nix
    ./homemodules/hyprpanel.nix
  ];

  home.username = "dhanvanth";
  home.homeDirectory = "/home/dhanvanth";
  home.stateVersion = "26.05";

  # Per user packages
  home.packages = with pkgs; [
  nitch
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
  duf
  bat
  imagemagick
  cowsay
  tmux
  lazygit
  bottom
  kew
  spotdl
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

   # enable zoxide
   programs.zoxide = {
   enable = true;
   enableZshIntegration = true;
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

  # hyprlock
  programs.hyprlock = {
  enable = true;
  settings = {
    general = {
      disable_loading_bar = false;
      hide_cursor = true;
      grace = 5;
    };
    background = [
      {
        path = "screenshot";
        blur_passes = 3;
        blur_size = 8;
      }
    ];
    input-field = [
      {
        size = "200, 50";
        position = "0, -80";
        monitor = "";
        dots_center = true;
        fade_on_empty = false;
        font_color = "rgb(ffffff)";
        inner_color = "rgb(000000)";
        outer_color = "rgb(ffffff)";
        outline_thickness = 2;
        placeholder_text = " Password...";
        shadow_passes = 2;
      }
    ];
    label = [
      {
        text = "$TIME";
        font_size = 64;
        font_family = "JetBrainsMono Nerd Font";
        position = "0, 80";
        halign = "center";
        valign = "center";
        color = "rgba(255, 255, 255, 1.0)";
        }
      ];
    };
  };

  # hypridle
  services.hypridle = {
  enable = true;
  settings = {
    general = {
      after_sleep_cmd = "hyprctl dispatch dpms on && hyprlock";
      ignore_dbus_inhibit = false;
      lock_cmd = "hyprlock";
      before_sleep_cmd = "hyprlock";
    };
    listener = [
      {
        timeout = 300;
        on-timeout = "hyprlock";
      }
      {
        timeout = 600;
        on-timeout = "hyprctl dispatch dpms off";
        on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.home-manager.enable = true;

}
