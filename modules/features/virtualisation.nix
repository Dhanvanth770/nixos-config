{ config, pkgs, inputs, ... }:

{

  # qemu/kvm
  virtualisation.libvirtd = {
  enable = true;
  allowedBridges = ["virbr0"];
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    };
  };

  # virt-manager
  programs.virt-manager.enable = true;
 
  # user to libvirtd
  users.users.dhanvanth.extraGroups = [ "libvirtd" ];

  # Enable networking
  virtualisation.spiceUSBRedirection.enable = true;

  # needed pkgs
  environment.systemPackages = with pkgs; [
  virt-viewer
  spice-gtk
  ];

  # android emulator
  virtualisation.waydroid.enable = true;

}
