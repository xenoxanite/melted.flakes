{ pkgs, lib, ... }:
let colors = import ./../../theme/colors.nix { };
in {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = with colors; {
      clock = true;
      font = "${font}";
      screenshots = true;
      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 6;
      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      ring-color = "${green}";
      text-color = "${foreground}";
      text-ver-color = "${blue}";
      text-wrong-color = "${red}";
      line-color = "00000000";
      inside-color = "${background}";
      inside-ver-color = "${background}";
      inside-wrong-color = "${background}";
      separator-color = "00000000";
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 30;
        command = "swaylock";
      }
      {
        timeout = 120;
        command = "systemctl suspend";
      }
    ];
  };

  systemd.user.services.swayidle.Install.WantedBy =
    lib.mkForce [ "hyprland-session.target" ];
}