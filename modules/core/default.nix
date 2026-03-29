{...}: {
  imports = [
    ./bootloader.nix
    # ./docker.nix
    ./hardware.nix
    # ./keyd.nix
    # ./nix-ld.nix
    ./xserver.nix
    ./network.nix
    ./pipewire.nix
    ./podman.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./nixd.nix
  ];
}
