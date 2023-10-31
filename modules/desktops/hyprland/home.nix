{ pkgs, inputs, ... }: {
  home-manager.users.xenoxanite = {
    systemd.user.targets.hyprland-session.Unit.Wants =
      [ "xdg-desktop-autostart.target" ];

    home.packages = with pkgs; [
      hyprpicker
      xdg-utils
      inputs.hyprland-contrib.packages.${pkgs.system}.hyprprop
      # xwaylandvideobridge

      # Wallpaper deamon
      swww

      # Screenshot and screen-record utility
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      wf-recorder

      # Clipboard manager
      wl-clipboard
      cliphist

      #Security
      mate.mate-polkit

      # qt
      # qt6-wayland
      # qt5-wayland

    ];
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      xwayland = { enable = true; };
      settings = {
        "$mainMod" = "SUPER";
        "$term" = "kitty";
        monitor = [ ",highres, auto, auto" ",highrr,auto,auto" ];
        source = [ "/home/xenoxanite/.cache/wal/colors-hyprland.conf" ];
        input = {
          kb_layout = "us";
          numlock_by_default = true;
          follow_mouse = 1;
          sensitivity = 0;
        };
        misc = {
          vfr = true;
          vrr = 0;
          layers_hog_keyboard_focus = true;
          disable_autoreload = true;
          disable_hyprland_logo = true;
          always_follow_on_dnd = true;
          animate_manual_resizes = false;
          enable_swallow = true;
          focus_on_activate = true;
          disable_splash_rendering = true;
          animate_mouse_windowdragging = false;
        };
        general = {
          gaps_in = 6;
          gaps_out = 10;
          border_size = 2;
          "col.inactive_border" = "rgba(000000ee)";
          apply_sens_to_raw = 1;
          layout = "master";
        };
        decoration = {
          rounding = 0;
          active_opacity = 0.9;
          inactive_opacity = 0.9;
          drop_shadow = false;
          blur = {
            enabled = true;
            size = 1;
            passes = 5;
            new_optimizations = true;
            xray = true;
          };
        };
        animations = {
          enabled = true;
          bezier = "overshot, 0.13, 0.99, 0.29, 1.1";
          animation = [
            "windows, 1, 4, overshot, slide"
            "windowsOut, 1, 4, overshot, slide"
            "border, 1, 4, overshot"
            "fade, 1, 4, overshot"
            "workspaces, 1, 4, overshot"
            "specialWorkspace, 1, 5, overshot, slidevert"
          ];
        };
        master = {
          mfact = 0.8;
          orientation = "left";
          always_center_master = true;
        };
        bind = [
          # workspace
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, mouse_down, workspace, e-1"
          "$mainMod, mouse_up, workspace, e+1"

          # move to workspace
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod CTRL, 1, movetoworkspacesilent, 1"
          "$mainMod CTRL, 2, movetoworkspacesilent, 2"
          "$mainMod CTRL, 3, movetoworkspacesilent, 3"
          "$mainMod CTRL, 4, movetoworkspacesilent, 4"
          "$mainMod CTRL, 5, movetoworkspacesilent, 5"
          "$mainMod CTRL, 6, movetoworkspacesilent, 6"
          "$mainMod CTRL, 7, movetoworkspacesilent, 7"
          "$mainMod CTRL, 8, movetoworkspacesilent, 8"
          "$mainMod CTRL, 9, movetoworkspacesilent, 9"

          # special workspaces
          "$mainModSHIFT, m, movetoworkspace, special:default"
          "$mainMod, m, togglespecialworkspace, default"

          # move focus
          "$mainMod, H, movefocus, l"
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"
          "$mainMod, L, movefocus, r"

          # window resize bindings
          "SUPER CTRL, h, resizeactive, -80 0"
          "SUPER CTRL, l, resizeactive, 80 0"
          "SUPER CTRL, k, resizeactive, 0 -80"
          "SUPER CTRL, j, resizeactive, 0 80"

          # volume control
          ",XF86AudioRaiseVolume,exec, pamixer -i 5"
          ",XF86AudioLowerVolume,exec, pamixer -d 5"
          ",XF86AudioMute,exec, pamixer -t"

          # music control
          ",XF86AudioPlay,exec, playerctl play-pause"
          ",XF86AudioNext,exec, playerctl next"
          ",XF86AudioPrev,exec, playerctl previous"
          ",XF86AudioStop, exec, playerctl stop"

          # shortcut
          "$mainMod, Return, exec, $term -e tmux new-session -A -s kitty"
          "$mainMod, Z, exec, pkill rofi || rofi -show drun"
          "$mainMod, W, exec, pkill rofi || wallpaper-picker"
          "SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mainMod, X, exec, pkill wlogout || launch-wlogout"
          "$mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped &"
          "$mainMod SHIFT, c ,exec, hyprpicker -a"

          # basic controll
          "$mainMod, Q, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod, Space, togglefloating,"
          "$mainMod, P, pin,"
          "$mainMod, Y, fakefullscreen,"
          "$mainMod, T, togglesplit,"
          "$mainMod, C, exec, hyprctl dispatch centerwindow none"

          "SUPER,period,layoutmsg,swapwithmaster"
          "SUPER,A,layoutmsg,addmaster"
          "SUPER,S,layoutmsg,removemaster"

          # screenshots bindings
          ''
            ,Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png''
          "$mainMod, Print, exec, grimblast --notify --cursor  copy area"

          # window move bindings
          "SUPER SHIFT, h, movewindow, l"
          "SUPER SHIFT, l, movewindow, r"
          "SUPER SHIFT, k, movewindow, u"
          "SUPER SHIFT, j, movewindow, d"

          # window reposition bindings
          "SUPER SHIFT, h, moveactive,  -80 0"
          "SUPER SHIFT, l, moveactive, 80 0"
          "SUPER SHIFT, k, moveactive, 0 -80"
          "SUPER SHIFT, j, moveactive, 0 80"

        ];
        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];
        windowrule = [
          "nofocus,^(Ibus-ui-gtk3)$"
          "workspace 1, ^(firefox)$"
          "workspace 6 silent, ^(steam)$"
          "size 700 450, pavucontrol"
          "move 40 55%, pavucontrol"
          "float,title:^(Transmission)$"
          "float,title:^(Volume Control)$"
          "float, Nautilus"
          "float, title:^(Steam)"
          "float, wlogout"
          "noanim, wlogout"
          "float,mpv"
          "move 510 290,mpv"
          "size 900 500,mpv"
          "idleinhibit focus,mpv"
          "float,imv"
          "move 510 290,imv"
          "size 900 500,imv"
          "float,title:^(Firefox — Sharing Indicator)$"
          "move 0 0,title:^(Firefox — Sharing Indicator)$"
        ];
        windowrulev2 = [
          "float, title:^(Picture-in-Picture)$"
          "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
          "pin, title:^(Picture-in-Picture)$"
          "idleinhibit fullscreen, class:^(firefox)$"
          "idleinhibit focus, class:^(mpv)$"
        ];
        exec-once = [
          "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
          "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "sleep 1 && swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' &"
          "wl-paste --type text --watch cliphist store &"
          "wl-paste --type image --watch cliphist store &"
          "waybar &"
          "mako -c /home/xenoxanite/.cache/wal/mako.conf"
          "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
          # "sleep 5 && discord --start-minimized &"
        ];
      };
      extraConfig = "general:col.active_border = $color13 $color10";
    };
  };
}
