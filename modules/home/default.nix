{...}: {
  imports =
    [(import ./git)]
    ++ [(import ./codium)]
    ++ [(import ./waybar)]
    ++ [(import ./rofi)]
    ++ [(import ./wlogout)]
    ++ [(import ./gtk)]
    ++ [(import ./starship)]
    ++ [(import ./zsh)]
    ++ [(import ./scripts)]
    ++ [(import ./firefox)]
    ++ [(import ./mako)]
    ++ [(import ./swaylock)]
    ++ [(import ./packages)]
    ++ [(import ./foot)]
    ++ [(import ./neovim)]
    ++ [(import ./hyprland)];
}
