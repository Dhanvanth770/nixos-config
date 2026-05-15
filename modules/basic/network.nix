{ config, inputs, pkgs, ... }:

{

  # networking
  networking = {
  nftables.enable = true;
  networkmanager.enable = true;
  networkmanager.dns = "systemd-resolved";
  nameservers = ["127.0.0.1"];
  networkmanager.wifi.scanRandMacAddress = true;
  networkmanager.wifi.macAddress = "random";
  networkmanager.ethernet.macAddress = "random";
  enableIPv6 = false;
  firewall = {
    enable = true;
    allowedTCPPorts = [];
    allowedUDPPorts = [];
    logRefusedConnections = true;
    };
  };

  services.resolved = {
    enable = true;
      settings = {
        Resolve = {
          DNS = "127.0.0.1:5300";
          DNSStubListener = "yes";
      };
    };
  };

  # encrypted dns
  services.dnscrypt-proxy = {
  enable = true;
  settings = {
    listen_addresses = ["127.0.0.1:5300"];
    ipv6_servers = false;
    require_dnssec = true;
    require_nolog = true;  
    require_nofilter = false;
    bootstrap_resolvers = ["1.1.1.1:53" "9.9.9.9:53"];
    ignore_system_dns = true;
    netprobe_timeout = 60; 
    sources.public-resolvers = {
      urls = ["https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"];
      cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
      minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
    };

    server_names = ["mullvad-adblock-doh" 
                    "quad9-doh-ip4-port443-nofilter-ecs-pri"
                    "nextdns"
                    ];
      };
    };

   systemd.services.dnscrypt-proxy = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
   };

   # system-wide file host blocking
   networking.extraHosts = builtins.readFile "${pkgs.stevenblack-blocklist}/hosts";

   # kernel networking hardening
   boot.kernel.sysctl = {
  "net.ipv4.conf.all.send_redirects" = 0;
  "net.ipv4.conf.default.send_redirects" = 0;
  "net.ipv4.conf.all.accept_redirects" = 0;
  "net.ipv4.conf.default.accept_redirects" = 0;
  "net.ipv4.conf.all.secure_redirects" = 0;
  "net.ipv4.conf.default.secure_redirects" = 0;
  "net.ipv6.conf.all.accept_redirects" = 0;
  "net.ipv4.conf.all.rp_filter" = 1;
  "net.ipv4.conf.default.rp_filter" = 1;
  "net.ipv4.icmp_echo_ignore_all" = 1;
  "net.ipv4.tcp_syncookies" = 1; 
  "net.ipv4.tcp_rfc1337" = 1;   
  "net.ipv4.conf.all.log_martians" = 1; 
  };


}
