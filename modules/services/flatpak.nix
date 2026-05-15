{ config, pkgs, inputs, ... }:

{

  services.flatpak = {
  enable = true;
  remotes = [
    {
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];
  packages = [
    { appId = "dev.vencord.Vesktop"; origin = "flathub"; }
    { appId = "app.zen_browser.zen"; origin = "flathub"; }
    { appId = "org.videolan.VLC"; origin = "flathub"; }
    { appId = "com.visualstudio.code"; origin = "flathub"; }
    { appId = "org.mozilla.firefox"; origin = "flathub-beta"; }
    { appId = "org.gnome.Calculator"; origin = "flathub"; }
    { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }
    { appId = "io.github.alainm23.planify"; origin = "flathub"; }
    { appId = "io.gitlab.adhami3310.Converter"; origin = "flathub"; }
    { appId = "com.tutanota.Tutanota"; origin = "flathub"; }
    { appId = "com.bitwarden.desktop"; origin = "flathub"; }
    { appId = "org.torproject.torbrowser-launcher"; origin = "flathub"; }
    { appId = "io.gitlab.news_flash.NewsFlash"; origin = "flathub-beta"; }
    ];
  overrides = {
      global = {
        Context = {
          filesystems = [
            "xdg-config/gtk-4.0:ro"
            "xdg-config/gtk-3.0:ro"
            "/nix/store:ro"
            "xdg-config/fontconfig"
            "/etc/fonts:ro"
            "/run/current-system/sw/share/fonts:ro"
            "~/.local/share/fonts:ro"
          ];
        };
      };
    };
  };
} 
  
