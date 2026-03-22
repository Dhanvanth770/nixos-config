{ config, pkgs, ... }:

{

  programs.fastfetch = {
  enable = true;
  settings = {
    logo = {
      type = "data";
      source = ''
        $1          ▗▄▄▄       $2.*#&.    ,~=,
        $1          ▜███▙       $2&*+)^  %*^@*
        $1           ▜███▙       $2>=-@\/%*$)
        $1            ▜███▙       $2}(!-)$^]
        $1     ▟█████████████████▙ $2&(#@)/     $1▟▙
        $1    ▟███████████████████▙ $2$]<$\    $1▟██▙
        $2           ,___,           !)::&  $1▟███▛
        $2          [$*@#             %#!$ $1▟███▛
        $2         &*%!^               \/ $1▟███▛
        $2/)(*&!#$_#>)*                  $1▟██████████▙
        $2\!@#*@#%<>?&                  $1▟███████████▛
        $2      *}^#* $1▟▙               ▟███▛
        $2     &[!@) $1▟██▙             ▟███▛
        $2    /#$)$  $1▜███▙           ▝▀▀▀▀
        $2    <][(    $1▜███▙ $2%&!~)$&!_)$*!@#$(<>/
        $2     ^@     $1▟████▙ $2^?><!#$!(*&%!_%^)/
        $1           ▟██████▙       $2*(!)\
        $1          ▟███▛▜███▙       $2{>@%!
        $1         ▟███▛  ▜███▙       $2&^#$|
        $1         ▝▀▀▀    ▀▀▀▀▘       $2"*="
      '';
      color = {
        "1" = "blue";
        "2" = "green";
      };
      height = 15;
      width = 15;
      padding = {
        top = 5;
        left = 3;
      };
    };
    display = {
      separator = " : ";
      bar = {
        width = 10;
        char = {
          elapsed = "■";
          total = "─";
        };
      };
      percent.type = 9;
    };
    modules = [
      "break"
      {
        type = "host";
        key = " PC";
        keyColor = "green";
      }
      {
        type = "cpu";
        key = "│ ├ ";
        keyColor = "green";
      }
      {
        type = "gpu";
        key = "│ ├󰾲 ";
        keyColor = "green";
      }
      {
        type = "memory";
        key = "│ ├󰘚 ";
        keyColor = "green";
        percent = {
          type = 3;
          green = 40;
          yellow = 60;
          red = 90;
        };
      }
      {
        type = "swap";
        key = "│ ├󰾴 ";
        keyColor = "green";
        percent = {
          type = 3;
          green = 40;
          yellow = 60;
          red = 90;
        };
      }
      {
        type = "disk";
        key = "└ └󱛟 ";
        keyColor = "green";
      }
      "break"
      {
        type = "os";
        key = " OS";
        keyColor = "yellow";
      }
      {
        type = "kernel";
        key = "│ ├ ";
        keyColor = "yellow";
      }
      {
        type = "packages";
        key = "│ ├󰏖 ";
        keyColor = "yellow";
      }
      {
        type = "shell";
        key = "└ └ ";
        keyColor = "yellow";
      }
      "break"
      {
        type = "de";
        key = " DE";
        keyColor = "blue";
      }
      {
        type = "lm";
        key = "│ ├ ";
        keyColor = "blue";
      }
      {
        type = "wm";
        key = "│ ├ ";
        keyColor = "blue";
      }
      {
        type = "wmtheme";
        key = "│ ├󰉼 ";
        keyColor = "blue";
      }
      {
        type = "terminal";
        key = "└ └ ";
        keyColor = "blue";
      }
      {
        type = "custom";
        format = "\u001b[90m┌─────────────────Uptime / Age / DT──────────────────┐";
      }
      {
        type = "command";
        key = "  OS Age ";
        keyColor = "magenta";
        text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
      }
      {
        type = "uptime";
        key = "  Uptime ";
        keyColor = "magenta";
      }
      {
        type = "datetime";
        key = "  DateTime ";
        keyColor = "magenta";
      }
      {
        type = "custom";
        format = "\u001b[90m└────────────────────────────────────────────────────┘";
      }
      {
        type = "colors";
        paddingLeft = 2;
        symbol = "circle";
      }
    ];
  };
};
