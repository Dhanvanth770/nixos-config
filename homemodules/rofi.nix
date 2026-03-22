{ config, pkgs, inputs, ... }:

{

home.file.".config/rofi/config.rasi" = {
  text = ''
    configuration {
        modi: "drun,calc";
        show-icons: true;
        display-drun: " ";
        display-calc: "󰃬 ";
        drun-display-format: "{name}";
        font: "JetBrainsMono Nerd Font 11";
    }
    @theme "/dev/null"
    * {
        bg: rgba(0, 0, 0, 0.7);
        fg: #ffffff;
        background-color: transparent;
        text-color: @fg;
    }
    window {
        width: 700px;
        background-color: @bg;
        border: 2px;
        border-color: #ffffff;
        border-radius: 12px;
    }
    mainbox {
        padding: 20px;
        children: [ inputbar, listview ];
    }
    inputbar {
        padding: 10px;
        margin: 0 0 10px 0;
        border: 0 0 1px 0;
        border-color: #333333;
        children: [ prompt, entry ];
    }
    listview {
        columns: 1;
        lines: 8;
        fixed-height: false;
        dynamic: true;
        scrollbar: false;
        spacing: 5px;
        border: 0;
    }
    element {
        padding: 12px;
        border-radius: 8px;
    }
    element selected {
        background-color: #ffffff;
        text-color: #000000;
    }
    element-icon {
        size: 24px;
        margin: 0 10px 0 0;
        background-color: transparent;
    }
    element-text {
        vertical-align: 0.5;
        background-color: transparent;
        text-color: inherit;
      }
    '';
  };

}
