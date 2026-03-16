_: {
  imports = [
    (import ./hyprland.nix)
    (import ./config.nix)
    (import ./hyprlock.nix)
    (import ./variables.nix)
  ];
}
