{...}: {
  imports = [
    ./audacious/audacious.nix # music player
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./direnv.nix
    ./discord.nix # discord with catppuccin theme
    ./fuzzel.nix # launcher
    ./git.nix # version control
    # ./gpg.nix # message signing
    ./gtk.nix # gtk theme
    ./helix.nix # Helix code editor
    ./hyprland # Wayland compositor
    ./kitty.nix # terminal
    ./lazydocker.nix # Docker/Podman TUI
    ./rbw
    ./rust.nix # Rust development
    ./noctalia # Noctalia shell
    ./nvim.nix # neovim editor
    ./opencode.nix
    ./packages.nix # other packages
    ./password_store.nix # GNU password store
    ./podman.nix
    ./scripts/scripts.nix # personal scripts
    ./sops # secrets manager
    ./starship.nix # shell prompt
    ./television.nix
    ./uair/uair.nix # Extensible pomodoro timer
    ./wayland.nix
    ./zsh.nix # shell
  ];

  home.preferXdgDirectories = true;
}
