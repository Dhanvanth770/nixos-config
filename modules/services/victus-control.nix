{ config, pkgs, ... }:

let
  victus-control = pkgs.stdenv.mkDerivation {
    pname = "victus-control";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "betelqeyza";
      repo = "victus-control";
      rev = "main";
      hash = "sha256-e9T2mZG1L1S4hquq1Pfsar/IPMAhKDnV9aIFWGKxsOE=";
    };

    nativeBuildInputs = with pkgs; [
      meson
      ninja
      pkg-config
      wrapGAppsHook4
      blueprint-compiler
    ];

    buildInputs = with pkgs; [
      gtk4
      libadwaita
      systemd
    ];

    installPhase = ''
      mkdir -p $out/bin
      cp frontend/victus-control $out/bin/
      cp backend/victus-backend $out/bin/
    '';
  };
in
{
  environment.systemPackages = [ victus-control ];

  systemd.services.victus-backend = {
    description = "Victus Control Backend Service";
    documentation = [ "https://github.com/betelqeyza/victus-control" ];

    serviceConfig = {
      ExecStart = "${victus-control}/bin/victus-backend";
      Restart = "always";
      User = "root";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
