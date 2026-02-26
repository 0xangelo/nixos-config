_: {
  imports = [
    (import ./hyprland.nix)
    (import ./config.nix)
    (import ./hypridle.nix)
    (import ./hyprlock.nix)
    (import ./variables.nix)
  ];
}
