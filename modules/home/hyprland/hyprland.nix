{pkgs, ...}: {
  home.packages = with pkgs; [
    swaybg # TODO: remove
    grimblast
    hyprpicker
    hyprpaper # Blazing fast wayland wallpaper utility
    glib # TODO: remove

    (pkgs.writeShellScriptBin "toggle-layout" (builtins.readFile ./scripts/toggle-layout.sh))
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    # https://wiki.hypr.land/Nix/Hyprland-on-NixOS/
    NIXOS_OZONE_WL = "1";
  };

  programs.hyprlock.enable = true;

  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
  wayland.windowManager.hyprland.enable = true;
}
