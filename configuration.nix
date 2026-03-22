{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [ ./hardware-configuration.nix
      ./modules/victus-control.nix
      ./modules/spicetify.nix
      ./modules/hyprland.nix
      ./modules/flatpak.nix
      ./modules/drivers.nix
      ./modules/fonts.nix
      ./modules/games.nix
      ./modules/env.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  # Enable ly dm
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings = { clock = "%c"; };

  # Garbage Collection
  nix.gc = {
  automatic = true;
  dates = "weekly"; # Runs every 7 days
  options = "--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  # Kernel
  nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;
  nix.settings.substituters = [ "https://cache.nixos.org" "https://cache.garnix.io" ];
  nix.settings.trusted-public-keys = [ "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
 
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

  # zram and fstrim enable
  zramSwap.enable = true;
  services.fstrim.enable = true;

  # Pipewire
  services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
  wireplumber.enable = true; 
  };
  
  security.rtkit.enable = true;

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };
  
  # enable printing
  services.printing = {
    enable = true;
    drivers = [ pkgs.cnijfilter2 pkgs.canon-cups-ufr2 pkgs.gutenprint ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.hostName = "thispc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Cloudflare and Google dns
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.networkmanager.dns = "none";
  
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # enable zsh
  programs.zsh.enable = true;
 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dhanvanth = {
    isNormalUser = true;
    description = "Dhanvanth";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "gamemode" "adbusers" "plugdev" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Detecting other disks
  services.udisks2.enable = true;
  services.devmon.enable = true;
  services.gvfs.enable = true;

  # Power-Profile
  services.power-profiles-daemon.enable = true;
 
  # Upower
  services.upower.enable = true;
 
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
  git 
  vim
  wget
  hyprpanel
  swww
  alacritty
  (rofi.override { plugins = [ rofi-calc ]; })
  brightnessctl
  wl-clipboard
  zip
  rar
  unzip
  unrar	
  grim
  slurp
  nautilus
  bazaar
  glib
  gsettings-desktop-schemas
  mission-center
  qbittorrent-enhanced
  hyprlock
  ];

  # Run binaries
  programs.nix-ld.enable = true;

  # Enable expirimental
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
