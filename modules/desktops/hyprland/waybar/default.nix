{
  nixpkgs.overlays = [
    (final: prev: {
      waybar = prev.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        postPatch = (oldAttrs.postPatch or "") + ''
          sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp'';
      });
    })
  ];
  home-manager.users.xenoxanite = {
    programs.waybar = {
      enable = true;
      systemd = {
        enable = false;
        target = "graphical-session.target";
      };
      settings = [{
        layer = "top";
        position = "top";
        modules-left = [ "clock" "custom/cava-internal" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [
          "pulseaudio"
          "pulseaudio#microphone"
          "memory"
          # "cpu"
          # "disk"
          "custom/ibus-layout"
          "tray"
        ];
        "hyprland/workspaces" = {
          "format" = "{icon}";
          #   "format-icons" = {
          #     "1" = "";
          #     "2" = "";
          #     "3" = "";
          #     "4" = "<span size='9pt'></span>";
          #     "5" = "";
          #     "6" = "<span size='11pt'></span>";
          #     "7" = "";
          #     "8" = "";
          #     "9" = "";
          #   };
        };
        "disk" = {
          "format" = "<span size='10pt'></span> {used}";
          "path" = "/";
          "interval" = 3;
        };
        "pulseaudio" = {
          "scroll-step" = 5;
          "format" = "{icon}{volume}%";
          "format-muted" = "<span size='14pt'></span>";
          "format-icons" = { "default" = [ " " " " " " ]; };
          "on-click" = "pamixer -t";
          "on-click-right" = "pavucontrol";
        };
        "pulseaudio#microphone" = {
          "format" = "{format_source}";
          "format-source" = "<span></span> {volume}%";
          "format-source-muted" = "";
          "on-click" = "pamixer --default-source -t";
          "on-scroll-up" = "pamixer --default-source -i 5";
          "on-scroll-down" = "pamixer --default-source -d 5";
          "scroll-step" = 5;
          "on-click-right" = "pavucontrol";
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %b %d}";
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 3;
          "format" = "<span size='9pt'></span> {used}G";
        };
        "cpu" = {
          "interval" = 3;
          "format" = "<span size='10pt'></span> {usage}%";
        };
        "custom/cava-internal" = {
          "exec" = "sleep 1s && cava-internal";
          "tooltip" = false;
        };
        "custom/ibus-layout" = {
          "exec" = "cat ~/.cache/ibus-layout";
          "interval" = 1;
          "tooltip" = false;
        };
        "network" = {
          "interval" = 1;
          "format" = "󰣺 Connected";
          "format-alt" = " {bandwidthUpBytes}  {bandwidthDownBytes}";
          "format-disconnected" = "󰣼 Disconnected";
        };
        "tray" = {
          "icon-size" = 13;
          "spacing" = 8;
        };
      }];

      style = ''
                @import '../../.cache/wal/colors-waybar.css';
        * {
          font-family: "ComicShannsMono nerd font";
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
          transition-property: background-color;
          transition-duration: 0.5s;
        }
        window#waybar {
          background-color: transparent;
        }
        window>box {
          margin-left: 10px;
          margin-right: 10px;
          margin-top: 8px;
          border: 2px solid @color10;
          border-radius: 0px;
          opacity: 0.95;
          background-color: @background;
        }


        #workspaces { 
          padding: 0px; 
          margin: 4px; 
          border-radius: 0px; 
          margin: 2px 0px; 
          background-color: @background; 
          border-radius: 2px; 
        } 
        #workspaces button {
          padding: 0px 0px;
          margin: 8px 6px;
          border-radius: 0px;
          border-radius: 2px;
          color: @color10;
          font-size: 10pt;
        }
        #workspaces button.active {
          background-color: @background;
          color: @color8;
          
        }
        #workspaces button:hover {
          background-color: transparent;
          border: none;
        }

        #clock, #custom-cava-internal {
          margin-left: 15px;
          color: @color10;
        }

        #pulseaudio, #memory, #cpu, #disk, #tray, #network, #custom-ibus-layout {
          margin-right: 18px;
          color: @color10;
        }

      '';
    };
  };

}
