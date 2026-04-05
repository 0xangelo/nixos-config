{pkgs, ...}: {
  home.packages = with pkgs; [
    grimblast
    hyprpicker
    (pkgs.writeShellScriptBin "toggle-layout" (builtins.readFile ./scripts/toggle-layout.sh))
    (pkgs.writeShellScriptBin "notify-run" (builtins.readFile ./scripts/notify-run.sh))
    (pkgs.writeScriptBin "show-keybinds" (builtins.readFile ./scripts/keybinds.sh))
    (pkgs.writeScriptBin "toggle_blur" (builtins.readFile ./scripts/toggle_blur.sh))
    (pkgs.writeScriptBin "toggle_oppacity" (builtins.readFile ./scripts/toggle_oppacity.sh))
  ];

  # https://wiki.hypr.land/Nix/Hyprland-on-NixOS/
  home.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprlock.enable = true;

  wayland.windowManager.hyprland.enable = true;
}
