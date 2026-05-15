{ config, inputs, ... }:

{
  home-manager.users.dhanvanth = {
  home.file.".local/bin/wallpaper-picker" = {
  executable = true;
  text = ''
    #!/usr/bin/env bash
    WALL_DIR="$HOME/Pictures/Wallpapers"
    if ! pgrep -x "swww-daemon" > /dev/null; then
        swww-daemon &
        sleep 0.2
    fi
    CHOICE=$(ls "$WALL_DIR" | while read -r file; do
        echo -en "$file\0icon\x1f$WALL_DIR/$file\n"
    done | rofi -dmenu \
        -i \
        -p "󰸉 " \
        -theme-str 'configuration { show-icons: true; }
        window { width: 800px; }
        listview { columns: 4; lines: 3; }
        element { orientation: vertical; }
        element-icon { size: 167px; border-radius: 8px; }')
    if [ -n "$CHOICE" ]; then
        swww img "$WALL_DIR/$CHOICE" \
            --transition-type center \
            --transition-fps 60 \
            --transition-duration 1.5
     fi
     '';
    };
  };
}

