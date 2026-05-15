{
  description = "MyFlake";
  inputs = {
    
    #basic
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
   
    # services
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    
    # features
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
 
    # gaming 
    prismlauncher-ely.url = "github:ElyPrismLauncher/Launcher";
 
    # wm
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
  };
  outputs = inputs@{ nixpkgs, flake-parts, home-manager, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      flake.nixosConfigurations.thispc = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/thispc/default.nix
          home-manager.nixosModules.home-manager
          inputs.nix-flatpak.nixosModules.nix-flatpak
          (inputs.import-tree ./modules)
        ];
      };
    };
}
