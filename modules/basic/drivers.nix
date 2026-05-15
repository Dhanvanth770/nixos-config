{ config, pkgs, inputs, ... }:

{
  hardware.graphics = {
  enable = true;
  enable32Bit = true;
  extraPackages = with pkgs; [
    nvidia-vaapi-driver
    libva-vdpau-driver
    libvdpau-va-gl
    ];
   extraPackages32 = with pkgs.pkgsi686Linux; [
      libva-vdpau-driver
      ];
  };

  # Amd Dirvers
  hardware.cpu.amd.updateMicrocode = true;
  boot.initrd.kernelModules = [ "amdgpu" ];

  # Nvidia Graphics drivers
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
  modesetting.enable = true;
  powerManagement.enable = true;
  powerManagement.finegrained = true;
  open = true;
  nvidiaSettings = true;
  package = config.boot.kernelPackages.nvidiaPackages.latest;

  # Prime
  prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    amdgpuBusId = "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
    };
  };
 
  # session variables
  environment.sessionVariables = {
  DXVK_ASYNC = "1";
  VKD3D_CONFIG = "dxr11,dxr";
  __GL_SHADER_DISK_CACHE = "1";
  __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
  __GL_THREADED_OPTIMIZATIONS = "1";
  PROTON_ENABLE_NGX_UPDATER = "1";
  WINE_FULLSCREEN_FSR = "1";
  };

  # kernel params
  boot.kernelParams = [
  "amd_pstate=active"
  "split_lock_detect=off"
  "transparent_hugepage=always"
  "nvidia_drm.fbdev=1"
  "nvidia.NVreg_UsePageAttributeTable=1"
  "nvidia.NVreg_InitializeSystemMemoryAllocations=0"
  ];

  # vm map count
   boot.kernel.sysctl = {
   "vm.max_map_count" = 2147483642;
   };
}
