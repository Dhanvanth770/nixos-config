{ inputs, pkgs, lib, ... }:

{

  security.apparmor = {
  enable = true;
  killUnconfinedConfinables = true;
  packages = [ pkgs.apparmor-profiles ];
  };

  boot.kernel.sysctl = {
  "kernel.dmesg_restrict" = 1; 
  "kernel.kptr_restrict" = 2;    
  "kernel.unprivileged_bpf_disabled" = 1;
  "net.core.bpf_jit_harden" = 2;
  "kernel.yama.ptrace_scope" = 2;  
  "vm.mmap_rnd_bits" = 32;
  };


  boot.kernelParams = [
  "init_on_alloc=1"
  "init_on_free=1"  
  "slab_nomerge" 
  "vsyscall=none"
  "debugfs=off"
  "oops=panic"
  "page_alloc.shuffle=1"
  ];


  boot.blacklistedKernelModules = [
  "firewire-core"
  "cramfs"
  "freevxfs"
  "jffs2"
  "hfs"
  "hfsplus"
  "udf"
  "squashfs"
  "dccp"
  "sctp"
  "rds"
  "tipc"
  "n-hdlc"
  "ax25"
  "netrom"
  "x25"
  "atm"
  "rose"
  "decnet"
  "econet" 
  "af_802154"
  ];

#  security.audit.enable = true;
#  security.auditd.enable = true;
#    security.audit.rules = [
#      "-a exit,always -F arch=b64 -S execve"
#      "-w /etc/passwd -p wa"
#      "-w /etc/shadow -p wa"
#      "-w /etc/nixos -p wa" 
#      "-w /root -p rwxa"  
#  ];

  environment.systemPackages = [ pkgs.sbctl ];  

}
