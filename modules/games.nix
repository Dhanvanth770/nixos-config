{ config, pkgs, inputs, ... }:

{
  programs.steam = {
    enable = true;
    };

  environment.systemPackages = with pkgs; [
    wineWow64Packages.waylandFull
    winetricks                                     
    vulkan-tools
    protonup-qt          
    ];
 
  programs.gamemode = {
  enable = true;
  };

  environment.sessionVariables = {
  GAMEMODERUNEXEC = "nvidia-offload";
  };

}
