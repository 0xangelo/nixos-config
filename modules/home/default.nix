{ ... }: {
  imports =
       [(import ./aseprite/aseprite.nix)]         # pixel art editor
    ++ [(import ./audacious/audacious.nix)]       # music player
    ++ [(import ./bat.nix)]                       # better cat command
    ++ [(import ./btop.nix)]                      # resouces monitor 
    ++ [(import ./cava.nix)]                      # audio visualizer
    ++ [(import ./discord.nix)]                   # discord with catppuccin theme
    # ++ [(import ./floorp/floorp.nix)]             # firefox based browser
    ++ [(import ./fuzzel.nix)]                    # launcher
    # ++ [(import ./gaming.nix)]                    # packages related to gaming
    ++ [(import ./git.nix)]                       # version control
    # ++ [(import ./gpg.nix)]                       # message signing
    ++ [(import ./gtk.nix)]                       # gtk theme
    ++ [(import ./hyprland)]                      # window manager
    ++ [(import ./kitty.nix)]                     # terminal
    ++ [(import ./swaync/swaync.nix)]             # notification deamon
    ++ [(import ./micro.nix)]                     # nano replacement
    ++ [(import ./neovide.nix)]                   # simple graphical user interface for Neovim
    ++ [(import ./nvim.nix)]                      # neovim editor
    ++ [(import ./packages.nix)]                  # other packages
    ++ [(import ./password_store.nix)]            # GNU password store
    # ++ [(import ./retroarch.nix)]
    ++ [(import ./scripts/scripts.nix)]           # personal scripts
    ++ [(import ./starship.nix)]                  # shell prompt
    # ++ [(import ./swaylock.nix)]                  # lock screen
    # ++ [(import ./vscodium.nix)]                  # vscode forck
    ++ [(import ./waybar)]                        # status bar
    ++ [(import ./zsh.nix)];                      # shell

  home.preferXdgDirectories = true;
}
