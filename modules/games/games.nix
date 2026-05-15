{ config, pkgs, inputs, ... }:

{
  programs.steam = {
    enable = true;
    };

  environment.systemPackages = with pkgs; [
    wineWow64Packages.waylandFull
    winetricks                                     
    vulkan-loader
    protonup-qt          
    protonplus
    inputs.prismlauncher-ely.packages.${pkgs.system}.prismlauncher
    temurin-bin-25
    faugus-launcher
    heroic
    ];
 
  # gamemode
   programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        nv_powermizer_mode = 1;
      };
      cpu = {
        park_cores = "no";
        pin_cores = "yes";
      };
    };
  };

  environment.sessionVariables = {
  GAMEMODERUNEXEC = "nvidia-offload";
  };

}

