{ pkgs, inputs, ... }:

{
  # cachyos-kernel
  nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-rc-lto;

  # kernel params
  boot.kernelParams = [
  "quiet"
  "splash"
  "nowatchdog"
  "nohz_full=auto"
  "mitigations=off"
  ]; 

  # kernel tweaks
  boot.kernel.sysctl = {
  "vm.swappiness" = 10;
  "vm.vfs_cache_pressure" = 50;
  "net.core.somaxconn" = 8192;
  };

  # Kernel Modules
  boot.kernelModules = [ "hp-wmi" ];

}
