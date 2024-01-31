{ pkgs, ... }: {
  fonts.fontconfig.enable = true;
  home = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [ "JetBrainsMono" ];
      }) # fonts name can get in ``https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/data/fonts/nerdfonts/shas.nix`
      twemoji-color-font
      (catppuccin-gtk.override {
        size = "compact";
        accents = [ "green" ];
        variant = "mocha";
        tweaks = [ "normal" ];
      })
    ];
    pointerCursor = {
      package = pkgs.cattpuccin-dark-cursor;
      name = "Catppuccin-Latte-Dark";
      size = 12;
    };
    sessionVariables = {
      GTK_USE_PORTAL = 0;
      GTK_THEME = "Catppuccin-Mocha-Compact-Green-Dark";
    };
  };
  gtk = {
    enable = true;
    theme.name = "Catppuccin-Mocha-Compact-Green-Dark";
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    cursorTheme = { name = "Catppuccin-Latte-Dark"; };
  };
}