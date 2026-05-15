{ pkgs, inputs, ... }:

{
 home-manager.users.dhanvanth = {
   programs.zathura = {
     enable = true;
       options = {
         default-bg = "#000000";
         default-fg = "#FFFFFF";
         statusbar-bg = "#000000";
         statusbar-fg = "#FFB454";
         inputbar-bg = "#000000";
         inputbar-fg = "#FFFFFF";
         highlight-color = "#FFB454";
         highlight-active-color = "#FFB454";
      };
    };

  home.packages = with pkgs.zathuraPkgs; [
    zathura_pdf_poppler
    zathura_djvu
    zathura_ps
    zathura_cb
  ];

  };
}
