{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "nm-applet &"
        "wl-clip-persist --clipboard both"
        "swaybg -m fill -i $(find ~/Pictures/wallpapers/ -maxdepth 1 -type f) &"
        "hyprctl setcursor Nordzy-cursors 22 &"
        "poweralertd &"
        "waybar &"
        "wl-paste --watch cliphist store &"
        "hyprlock"
        "hypridle"
        "hyprctl dispatch exec '[workspace special:calculator silent] kitty --title float_kitty bc --quiet'"
      ];

      input = {
        kb_layout = "us";
        kb_options = "caps:escape";
        repeat_rate = 50;
        repeat_delay = 200;
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        layout = "dwindle";
        gaps_in = 0;
        gaps_out = 0;
        border_size = 2;
        # "col.active_border" = "rgb(cba6f7) rgb(94e2d5) 45deg";
        # "col.inactive_border" = "0x00000000";
        # border_part_of_window = false;
        # no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 1;
          passes = 1;
          # size = 4;
          # passes = 2;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 1, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = [
        # show keybinds list
        "SUPER, F1, exec, show-keybinds"

        # keybindings
        "SUPER, Return, exec, kitty"
        "ALT, Return, exec, kitty --title float_kitty"
        "SUPER SHIFT, Return, exec, kitty --start-as=fullscreen -o 'font_size=16'"
        "SUPER, B, exec, hyprctl dispatch exec '[workspace 1 silent] brave'"
        "SUPER, Q, killactive,"
        "SUPER, F, fullscreen, 0"
        "SUPER SHIFT, F, fullscreen, 1"
        "SUPER, Space, togglefloating,"
        "SUPER, D, exec, fuzzel"
        "SUPER, Escape, exec, loginctl lock-session"
        "SUPER SHIFT, Escape, exec, shutdown-script"
        # "SUPER, P, pseudo,"
        "SUPER, T, togglesplit,"
        "SUPER, N, exec, swaync-client -t -sw"
        "SUPER SHIFT, T, exec, hyprctl dispatch exec '[workspace 11 silent] telegram-desktop'"
        "SUPER, E, exec, nemo"
        "SUPER SHIFT, B, exec, pkill -SIGUSR1 .waybar-wrapped"
        "SUPER, C, togglespecialworkspace, calculator"
        "SUPER, S, togglespecialworkspace, slack"
        "SUPER SHIFT, C, exec, hyprpicker -a"
        "SUPER, W,exec, wallpaper-picker"
        "SUPER SHIFT, W, exec, vm-start"

        # screenshot
        "SUPER SHIFT, P, exec, grimblast --notify --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        "SUPER, P, exec, grimblast --notify --freeze copy area"
        # "SUPER, Print, exec, grimblast --notify --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        # ", Print, exec, grimblast --notify --freeze copy area"

        # switch focus
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        # switch workspace
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"
        "SUPER, G, workspace, e-1"
        "SUPER, SEMICOLON, workspace, e+1"
        "SUPER, TAB, workspace, previous"

        # same as above, but switch to the workspace
        "SUPER SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "SUPER SHIFT, 2, movetoworkspacesilent, 2"
        "SUPER SHIFT, 3, movetoworkspacesilent, 3"
        "SUPER SHIFT, 4, movetoworkspacesilent, 4"
        "SUPER SHIFT, 5, movetoworkspacesilent, 5"
        "SUPER SHIFT, 6, movetoworkspacesilent, 6"
        "SUPER SHIFT, 7, movetoworkspacesilent, 7"
        "SUPER SHIFT, 8, movetoworkspacesilent, 8"
        "SUPER SHIFT, 9, movetoworkspacesilent, 9"
        "SUPER SHIFT, 0, movetoworkspacesilent, 10"
        "SUPER CTRL, c, movetoworkspace, empty"
        "SUPER SHIFT, G, movetoworkspacesilent, -1"
        "SUPER SHIFT, SEMICOLON, movetoworkspacesilent, +1"

        # window control
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"
        "SUPER CTRL, H, resizeactive, -80 0"
        "SUPER CTRL, L, resizeactive, 80 0"
        "SUPER CTRL, K, resizeactive, 0 -80"
        "SUPER CTRL, J, resizeactive, 0 80"
        "SUPER ALT, H, moveactive,  -80 0"
        "SUPER ALT, L, moveactive, 80 0"
        "SUPER ALT, K, moveactive, 0 -80"
        "SUPER ALT, J, moveactive, 0 80"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, pamixer -i 5"
        ",XF86AudioLowerVolume,exec, pamixer -d 5"
        ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop, exec, playerctl stop"
        "SUPER, mouse_down, workspace, e-1"
        "SUPER, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "SUPER, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "SUPER, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "SUPER, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
      ];

      # mouse binding
      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      windowrule = [
        "match:title Telegram,                          workspace 11 silent"
        "match:class Slack,                             workspace special:slack silent, fullscreen true"
        "match:title ^(Transmission)$,                  float true"
        "match:title ^(Volume Control)$,                float true, size 700 450, move 40 55%"
        "match:title float_kitty,                       float true, center true, size 950 600"
        "match:title ^(Picture-in-Picture)$,            float true, pin true, opacity 1.0 override 1.0 override,"

        "match:class ^(pavucontrol)$,                   float true"
        "match:class ^(SoundWireServer)$,               float true"
        "match:class ^(.sameboy-wrapped)$,              float true"
        "match:class ^(file_progress)$,                 float true"
        "match:class ^(confirm)$,                       float true"
        "match:class ^(dialog)$,                        float true"
        "match:class ^(download)$,                      float true"
        "match:class ^(notification)$,                  float true"
        "match:class ^(error)$,                         float true"
        "match:class ^(confirmreset)$,                  float true"
        "match:title ^(Open File)$,                     float true"
        "match:title ^(branchdialog)$,                  float true"
        "match:title ^(Confirm to replace files)$,      float true"
        "match:title ^(File Operation Progress)$,       float true"

        # No gaps when only
        "border_size 0, match:float 0, match:workspace w[tv1]"
        "rounding 0, match:float 0, match:workspace w[tv1]"
        "border_size 0, match:float 0, match:workspace f[1]"
        "rounding 0, match:float 0, match:workspace f[1]"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,auto

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
