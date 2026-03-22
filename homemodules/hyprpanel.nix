{ config, lib, ... }:

{

   home.file.".config/hyprpanel/config.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/homemodules/hyprpanel.json";
   };

}
