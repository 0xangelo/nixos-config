{pkgs, ...}: {
  home.packages = with pkgs; [
    grimblast
    hyprpicker
    (pkgs.writeShellScriptBin "toggle-layout" (builtins.readFile ./scripts/toggle-layout.sh))
    (pkgs.writeShellScriptBin "notify-run" (builtins.readFile ./scripts/notify-run.sh))
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    # https://wiki.hypr.land/Nix/Hyprland-on-NixOS/
    NIXOS_OZONE_WL = "1";
  };

  programs.hyprlock.enable = true;

  wayland.windowManager.hyprland.enable = true;
}
