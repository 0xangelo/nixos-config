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
    ./hyprland # window manager
    ./iota.nix # IOTA
    ./kitty.nix # terminal
    ./swaync/swaync.nix # notification deamon
    ./neovide.nix # simple graphical user interface for Neovim
    ./nvim.nix # neovim editor
    ./packages.nix # other packages
    ./password_store.nix # GNU password store
    ./scripts/scripts.nix # personal scripts
    ./sops # secrets manager
    ./starship.nix # shell prompt
    ./uair/uair.nix # Extensible pomodoro timer
    ./waybar # status bar
    ./zsh.nix # shell
  ];

  home.preferXdgDirectories = true;
}
