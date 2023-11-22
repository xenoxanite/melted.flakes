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
        monitor = [ ",highres, auto, auto" ",highrr, auto, auto" ];
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
            size = 5;
            passes = 4;
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
            "workspaces, 1, 4, overshot, slide"
            # "workspaces,1,4,default,slidefade 40%"
            "specialWorkspace, 1, 4, overshot, slidevert"
          ];
        };
        master = {
          mfact = 0.7;
          orientation = "left";
          always_center_master = true;
          # no_gaps_when_only = true;
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

          # move to workspace
          "$mainModSHIFT, 1, movetoworkspace, 1"
          "$mainModSHIFT, 2, movetoworkspace, 2"
          "$mainModSHIFT, 3, movetoworkspace, 3"
          "$mainModSHIFT, 4, movetoworkspace, 4"
          "$mainModSHIFT, 5, movetoworkspace, 5"
          "$mainModSHIFT, 6, movetoworkspace, 6"
          "$mainModSHIFT, 7, movetoworkspace, 7"
          "$mainModSHIFT, 8, movetoworkspace, 8"
          "$mainModSHIFT, 9, movetoworkspace, 9"
          "$mainMod CTRL, 1, movetoworkspacesilent, 1"
          "$mainMod CTRL, 2, movetoworkspacesilent, 2"
          "$mainMod CTRL, 3, movetoworkspacesilent, 3"
          "$mainMod CTRL, 4, movetoworkspacesilent, 4"
          "$mainMod CTRL, 5, movetoworkspacesilent, 5"
          "$mainMod CTRL, 6, movetoworkspacesilent, 6"
          "$mainMod CTRL, 7, movetoworkspacesilent, 7"
          "$mainMod CTRL, 8, movetoworkspacesilent, 8"
          "$mainMod CTRL, 9, movetoworkspacesilent, 9"
          # move between workspace
          "$mainMod, H, workspace, e-1"
          "$mainMod, L, workspace, e+1"
          # special workspaces
          "$mainModSHIFT, m, movetoworkspace, special:default"
          "$mainMod, m, togglespecialworkspace, default"

          # move focus
          "$mainMod, J, movefocus, d"
          "$mainMod, K, movefocus, u"

          # window resize bindings
          "$mainMod ALT, h, resizeactive, -80 0"
          "$mainMod ALt, l, resizeactive, 80 0"
          "$mainMod ALT, k, resizeactive, 0 -80"
          "$mainMod ALT, j, resizeactive, 0 80"

          # volume control
          ",XF86AudioRaiseVolume,exec, pamixer -i 5"
          ",XF86AudioLowerVolume,exec, pamixer -d 5"
          ",XF86AudioMute,exec, pamixer -t"

          "SHIFT, F4,exec, pamixer --default-source -t"
          "SHIFT, F3, exec, pamixer --default-source -i 5"
          "SHIFT, F2, exec, pamixer --default-source -d 5"

          # music control
          ",XF86AudioPlay,exec, playerctl play-pause"
          ",XF86AudioNext,exec, playerctl next"
          ",XF86AudioPrev,exec, playerctl previous"
          ",XF86AudioStop, exec, playerctl stop"

          # shortcut
          "$mainMod, Return, exec, $term -e tmux new-session -A -s kitty"
          "$mainMod, N, exec, neovide"
          "$mainMod, Z, exec, pkill rofi || rofi -show drun"
          "$mainMod, W, exec, pkill rofi || wallpaper-picker"
          "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
          "$mainMod, X, exec, pkill wlogout || launch-wlogout"
          "$mainMod, B, exec, pkill -SIGUSR1 .waybar-wrapped &"
          "$mainModSHIFT, c ,exec, hyprpicker -a"
          "CTRL, Space, exec, ibus-toggle-layout"

          # basic controll
          "$mainMod, Q, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod, Space, togglefloating,"
          "$mainMod, P, pin,"
          "$mainMod, Y, fakefullscreen,"
          "$mainMod, T, togglesplit,"
          "$mainMod, C, exec, hyprctl dispatch centerwindow none"

          "$mainMod,period,layoutmsg,swapwithmaster"
          "$mainMod,A,layoutmsg,addmaster"
          "$mainMod,S,layoutmsg,removemaster"

          # screenshots bindings
          ''
            ,Print, exec, grimblast --notify --cursor save area ~/Pictures/screenshots/screenshot_$(date +"%b_%-d_%Y_%H:%M:%S").png''
          "$mainMod, Print, exec, grimblast --notify --cursor  copy area"

          # window reposition bindings
          "$mainModSHIFT, h, moveactive,  -100 0"
          "$mainModSHIFT, l, moveactive, 100 0"
          "$mainModSHIFT, k, moveactive, 0 -100"
          "$mainModSHIFT, j, moveactive, 0 100"

        ];
        windowrule = [
          "nofocus,^(Ibus-ui-gtk3)$"
          "animation slide up,wlogout"
          "workspace 1, ^(firefox)$"
          "workspace 2, ^(kitty)$"
          "workspace 3, ^(neovide)$"
          "workspace 4 silent, ^(discord)$"
          "workspace 5, ^(Spotify)$"
          "workspace 6, ^(org.pwmt.zathura)$"
          "workspace 7, ^(Chromium-browser)$"
          "workspace 8 silent, ^(steam)$"
          # "fullscreen, ^(neovide)$"
          "size 700 450, pavucontrol"
          "move 40 55%, pavucontrol"
          "float,title:^(Transmission)$"
          "float,title:^(galculator)$"
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
        # blurls = [ "waybar" ];
        exec-once = [
          "hyprctl setcursor Catppuccin-Latte-Dark 16 &"
          "exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "sleep 1 && swww init && sleep 1 && swaylock && notify-send 'Hey $USER, Welcome back' &"
          "wl-paste --type text --watch cliphist store &"
          "wl-paste --type image --watch cliphist store &"
          "waybar &"
          "mako -c /home/xenoxanite/.cache/wal/mako.conf"
          "${pkgs.mate.mate-polkit}/libexec/polkit-mate-authentication-agent-1 &"
          "sleep 5 && discord --start-minimized &"
          # "sleep 5 && discord &"
        ];
      };
      extraConfig = "general:col.active_border = $color10";
    };
  };
}
