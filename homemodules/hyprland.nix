{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # --- MONITORS ---
      monitor=eDP-1,1920x1080@144.15Hz,0x0,1

      # --- AUTOSTART ---
      exec-once = swww-daemon
      exec-once = hyprpanel
      exec-once = sytemctl --user start hyprpolkitagent
      exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP   
  
      # --- Environment Variables ---
      

      # --- Decoration ---
      general {
        gaps_in = 3
        gaps_out = 3
        border_size = 0
        resize_on_border = false
        allow_tearing = false
        layout = dwindle
      }
 
      decoration {
          rounding = 5
          rounding_power = 2
          active_opacity = 1.0
          inactive_opacity = 1.0

          shadow {
              enabled = true
              range = 4
              render_power = 3
              color = rgba(1a1a1aee)
          }

          blur {
              enabled = true
              size = 3
              passes = 4
              vibrancy = 0.1696
          }
      }

      # --- Animation ---
      animations {
          enabled = yes
          
          bezier = easeOutQuint, 0.23, 1, 0.32, 1
          bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
          bezier = linear, 0, 0, 1, 1
          bezier = almostLinear, 0.5, 0.5, 0.75, 1
          bezier = quick, 0.15, 0, 0.1, 1
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = global, 1, 10, default
          animation = border, 1, 5.39, easeOutQuint
          animation = windows, 1, 4.79, easeOutQuint
          animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
          animation = windowsOut, 1, 1.49, linear, popin 87%
          animation = fadeIn, 1, 1.73, almostLinear
          animation = fadeOut, 1, 1.46, almostLinear
          animation = fade, 1, 3.03, quick
          animation = layers, 1, 3.81, easeOutQuint
          animation = layersIn, 1, 4, easeOutQuint, fade
          animation = layersOut, 1, 1.5, linear, fade
          animation = fadeLayersIn, 1, 1.79, almostLinear
          animation = fadeLayersOut, 1, 1.39, almostLinear
          animation = workspaces, 1, 3, myBezier, slide
          animation = workspacesIn, 1, 3, myBezier, slide
          animation = workspacesOut, 1, 3, myBezier, slide 
          animation = zoomFactor, 1, 7, quick
      }

      dwindle {
          pseudotile = true
          preserve_split = true
      }

      master {
          new_status = master
      }

      misc {
          force_default_wallpaper = 0
          disable_hyprland_logo = true
      }

      # --- Inputs ---
      input {
          kb_layout = us
          accel_profile = flat
          follow_mouse = 1
          sensitivity = 0

          touchpad {
              natural_scroll = true
          }
      }

      cursor {
          no_hardware_cursors = false
      }

      # --- DEVICES ---
      device {
          name = 2.4g-receiver-consumer-control-1
          accel_profile = flat
          sensitivity = 0
      }

      device {
          name = 2.4g-receiver-mouse
          accel_profile = flat
          sensitivity = 0
      }

      # --- GESTURES ---
      gesture = 3, horizontal, workspace 


      # --- KEYBINDINGS ---

      bind = SUPER, T, exec, alacritty
      bind = SUPER, Q, killactive,
      bind = SUPER SHIFT, M, exit,
      bind = SUPER, E, exec, nautilus
      bind = SUPER, V, togglefloating,
      bind = SUPER, F, fullscreen,
      bind = SUPER, SPACE, exec, rofi -show drun
      bind = SUPER, P, pseudo,
      bind = SUPER, J, togglesplit,
      bind = SUPER, W, exec, ~/.local/bin/wallpaper-picker
      bind = SUPER, L, exec, hyprlock
      bind = SUPER, C, exec, rofi -show calc -modi calc -no-show-match -no-sort
      
      # Screen capture
      bind = SUPER SHIFT, S, exec, mkdir -p ~/Pictures/Screenshots && grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy && notify-send "Screenshot Captured" "Saved to Screenshots folder and copied to clipboard" -i camera-photo
      bind = , Print, exec, mkdir -p ~/Pictures/Screenshots && grim - | tee ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png | wl-copy && notify-send "Full Screenshot Captured" "Image saved and copied to clipboard" -i camera-photo

      # Move focus
      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d

      # Workspaces
      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9
      bind = sUPER, 0, workspace, 10
      
      # Workspace shift
      bind = SUPER SHIFT, 1, movetoworkspace, 1
      bind = SUPER SHIFT, 2, movetoworkspace, 2
      bind = SUPER SHIFT, 3, movetoworkspace, 3
      bind = SUPER SHIFT, 4, movetoworkspace, 4
      bind = SUPER SHIFT, 5, movetoworkspace, 5
      bind = SUPER SHIFT, 6, movetoworkspace, 6
      bind = SUPER SHIFT, 7, movetoworkspace, 7
      bind = SUPER SHIFT, 8, movetoworkspace, 8
      bind = SUPER SHIFT, 9, movetoworkspace, 9
      bind = SUPER SHIFT, 0, movetoworkspace, 10

      # Multimedia
      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
      bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow


      # --- Window Rules ---
      windowrule {
        name = nautilus-style
        match:class = ^org.gnome.Nautilus$
        opacity = 0.85 0.85
      }
      windowrule {
        name = spotify-blur
        match:class = ^spotify$
        opacity = 0.85 0.85
      }
      windowrule {
        name = goofcord-blur
        match:class = ^goofcord$
        opacity = 0.85 0.85
      } 
      windowrule = match:class xdg-desktop-portal-gtk, float on
      windowrule = match:class xdg-desktop-portal-gtk, center on
      windowrule = match:class xdg-desktop-portal-gtk, size 900 600
      windowrule = float on, match:class org.gnome.Calculator
      windowrule = size 360 616, match:class org.gnome.Calculator
      windowrule = center on, match:class org.gnome.Calculator
      layerrule = blur on, match:namespace ^(rofi)$
      layerrule = ignore_alpha 0.5, match:namespace ^(rofi)$  
      '';
  };
}
