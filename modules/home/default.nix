{...}: {
  imports =
    [(import ./git)]
    ++ [(import ./codium)]
    ++ [(import ./waybar)]
    ++ [(import ./wofi)]
    ++ [(import ./wlogout)]
    ++ [(import ./hyprland)];
}
