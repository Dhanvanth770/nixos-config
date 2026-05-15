{ config, pkgs, lib, ... }:
{
  home-manager.users.dhanvanth = {
    home.packages = with pkgs; [ xdg-desktop-portal-gtk ];
    home.sessionVariables = {
      GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas"; 
       QT_STYLE_OVERRIDE = lib.mkForce "Adwaita-dark"; 
    };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
     gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-theme-name = "Adwaita-dark";
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "adwaita";
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt6;
      };
    };
    xdg.configFile = {
    "gtk-3.0/gtk.css".text = ''
  /* Global Variables */
  @define-color window_bg_color #000000;
  @define-color window_fg_color #ffffff;
  @define-color view_bg_color #000000;
  @define-color view_fg_color #ffffff;
  @define-color headerbar_bg_color #000000;
  @define-color headerbar_fg_color #ffffff;
  @define-color card_bg_color #0a0a0a;
  @define-color accent_color #ffb454;
  @define-color sidebar_bg_color #000000;
  @define-color sidebar_fg_color #ffffff;
  @define-color theme_selected_bg_color #ffb454;
  @define-color theme_selected_fg_color #000000;
  @define-color selected_bg_color #ffb454;
  @define-color selected_fg_color #000000;
  @define-color theme_unfocused_selected_bg_color #cc8f44;
  @define-color theme_unfocused_selected_fg_color #000000;

  /* Base Layout */
  window, .background {
    background-color: #000000;
    color: #ffffff;
  }

  /* Headerbar */
  .header-bar, headerbar, headerbar.titlebar {
    background-image: none;
    background-color: #000000 !important;
    color: #ffffff;
    box-shadow: none;
    border-bottom: 1px solid #222222;
  }

  headerbar label, headerbar button {
    color: #ffffff;
  }

  headerbar button {
    background-color: #1a1a1a;
    border: 1px solid #333333;
  }

  headerbar button:hover {
    background-color: #2a2a2a;
  }

  headerbar button.text-button,
  headerbar button.destructive-action {
    background-color: #1a1a1a !important;
    background-image: none !important;
    color: #ffffff;
  }

  headerbar button.suggested-action {
    background-color: #ffb454 !important;
    background-image: none !important;
    color: #000000;
  }

  headerbar button.image-button {
    background-color: #1a1a1a !important;
    background-image: none !important;
    color: #ffffff;
  }

  /* Path bar */
  .location-bar, .path-bar, GtkPathBar,
  GtkFileChooserWidget .path-bar, .path-bar > button {
    background-image: none;
    background-color: #000000 !important;
    color: #ffffff;
  }

  .path-bar button {
    background-image: none;
    background-color: #111111 !important;
    color: #ffffff;
    border: 1px solid #333333;
  }

  .path-bar button:hover {
    background-color: #2a2a2a;
  }

  /* Search bar */
  .search-bar {
    background-color: #000000 !important;
  }

  /* Sidebar */
  placessidebar, .sidebar {
    background-color: #000000;
    color: #ffffff;
  }

  placessidebar row, .sidebar row {
    color: #ffffff;
  }

  placessidebar row:selected, .sidebar row:selected {
    background-color: #ffb454;
    color: #000000;
  }

  placessidebar image, .sidebar image {
    color: #ffffff;
    -gtk-icon-style: regular;
  }

  /* File list */
  .view, GtkTreeView, treeview {
    background-color: #000000;
    color: #ffffff;
  }

  .view row, treeview row {
    background-color: #000000;
    color: #ffffff;
  }

  .view row:hover, treeview row:hover {
    background-color: #1a1a1a;
  }

  .view row:selected, treeview row:selected {
    background-color: #ffb454;
    color: #000000;
  }

  /* Column headers */
  treeview header button {
    background-color: #111111;
    color: #ffffff;
    border-bottom: 1px solid #333333;
  }

  /* Cell text */
  .cell, label, .label {
    color: #ffffff;
  }

  /* Text inputs */
  entry, textview {
    background-color: #000000;
    color: #ffffff;
  }

  /* Bottom bar */
  filechooser .dialog-action-area,
  window > box > buttonbox {
    background-color: #000000 !important;
    color: #ffffff;
    }

   .view row:selected,
treeview row:selected {
  background-color: #ffb454 !important;
  color: #000000 !important;
}

.view row:selected *,
treeview row:selected * {
  color: #000000 !important;
}

treeview:focus row:selected,
treeview row:selected:focus {
  background-color: #ffb454 !important;
  color: #000000 !important;
}

  treeview.view:selected,
treeview.view:selected:focus,
.view:selected,
.view:selected:focus {
  background-color: @theme_selected_bg_color;
  color: @theme_selected_fg_color;
}

  * {
  font-weight: 777;
  }

   ''; 


  "gtk-4.0/gtk.css".text = ''
    @define-color window_bg_color #000000;
    @define-color window_fg_color #ffffff;
    @define-color view_bg_color #000000;
    @define-color headerbar_bg_color #000000;
    @define-color headerbar_fg_color #ffffff;
    @define-color accent_color #ffb454;
    @define-color accent_bg_color #ffb454;
    @define-color sidebar_bg_color #000000;
    @define-color sidebar_fg_color #ffffff;

    /* CSD titlebar */
.csd headerbar,
.csd .titlebar,
decoration,
.csd decoration {
  background-color: #000000 !important;
  background-image: none !important;
  color: #ffffff;
  box-shadow: none;
}

/* Window decorations */
.solid-csd headerbar,
.solid-csd .titlebar {
  background-color: #000000 !important;
  background-image: none !important;
}
    
    /* GTK4 Specific fixes for labels */
    label { color: #ffffff; }
    
popover contents, popover > contents, .menu {
  background-color: #0a0a0a;
  color: #ffffff;
  border: none;
  border-radius: 8px;
  padding: 4px;
  margin: 0;
  max-width: 200px;
}

popover modelbutton, .menu modelbutton {
  padding: 6px 12px;
  min-height: 24px;
/*  margin: 0; */
}

popover {
  border: none;
  border-radius: 4px;
}

    .context-menu {
  max-width: 200px;
  min-width: 0;
}

popover > contents > box {
  max-width: 200px;
  min-width: 0;
}

popover > contents {
  padding: 4px;
  max-width: 200px;
  min-width: 0;
}

    /* Highlight the selected item with your orange accent */
    .navigation-sideways row:selected, list row:selected {
      background-color: #ffb454;
      color: #000000;
     }

  .sidebar-item:selected,
  row:selected label {
    color: #000000;
  }
        '';    
      };
    };
}


