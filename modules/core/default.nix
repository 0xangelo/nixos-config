{ ... }:
{
  imports = [
    (import ./bootloader.nix)
    (import ./docker.nix)
    (import ./hardware.nix)
    # (import ./keyd.nix)
    # (import ./nix-ld.nix)
    (import ./xserver.nix)
    (import ./network.nix)
    (import ./pipewire.nix)
    (import ./postgres.nix)
    (import ./program.nix)
    (import ./security.nix)
    (import ./services.nix)
    (import ./system.nix)
    (import ./user.nix)
    (import ./wayland.nix)
    (import ./virtualization.nix)
  ];
}
