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
    { appId = "io.github.milkshiift.GoofCord"; origin = "flathub"; }
    { appId = "app.zen_browser.zen"; origin = "flathub"; }
    { appId = "org.videolan.VLC"; origin = "flathub"; }
    { appId = "com.visualstudio.code"; origin = "flathub"; }
    { appId = "org.mozilla.firefox"; origin = "flathub-beta"; }
    { appId = "org.gnome.Calculator"; origin = "flathub"; }
    { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }
    { appId = "io.github.alainm23.planify"; origin = "flathub"; }
    { appId = "io.gitlab.adhami3310.Converter"; origin = "flathub"; }
    ];
  };

}
