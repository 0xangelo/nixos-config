{pkgs, ...}: {
  home.packages = with pkgs; [
    swaybg # TODO: remove
    grimblast
    hyprpicker
    hyprpaper # Blazing fast wayland wallpaper utility
    glib # TODO: remove
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland.enable = true;
}
