{...}: {
  imports = [
    ./audacious/audacious.nix # music player
    ./bat.nix # better cat command
    ./btop.nix # resouces monitor
    ./discord.nix # discord with catppuccin theme
    ./fuzzel.nix # launcher
    ./gaming.nix # packages related to gaming
    ./git.nix # version control
    # ./gpg.nix # message signing
    ./gtk.nix # gtk theme
    ./hyprland # window manager
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
    ./vscodium.nix # vscode forck
    ./waybar # status bar
    ./zsh.nix # shell
  ];

  home.preferXdgDirectories = true;
}
