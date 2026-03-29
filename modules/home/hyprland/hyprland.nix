{pkgs, ...}: {
  home.packages = with pkgs; [
    grimblast
    hyprpicker
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
