{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    bc                                # is a mathematics language used for the dropdown calculator.
    bitwarden-cli
    bitwise                           # cli tool for bit / hex manipulation
    brave                             # browser
    curl
    evince                            # gnome pdf viewer
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    file                              # Show file information 
    fzf                               # fuzzy finder
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    jdk17                             # java
    jq                                # Lightweight and flexible command-line JSON processor
    lazygit
    libreoffice
    cinnamon.nemo-with-extensions     # file manager
    nitch                             # systhem fetch util
    nix-prefetch-github
    prismlauncher                     # minecraft launcher
    ripgrep                           # grep replacement
    soundwireserver                   # pass audio to android phone
    tdf                               # cli pdf viewer
    telegram-desktop
    tldr                              # simplified man pages
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    tree                              # list contents of directories in a tree-like format
    valgrind                          # c memory analyzer
    yazi                              # terminal file manager
    youtube-dl
    gnome.zenity
    winetricks
    wineWowPackages.wayland

    # C / C++
    clang
    (hiPrio gcc) # https://github.com/nix-community/home-manager/issues/1668#issuecomment-1264298055
    gnumake

    # Go
    go

    # Python
    python3

    # Rust development
    bacon
    cmake
    pkg-config                        # metainformation about installed libraries
    rustup

    bleachbit                         # cache cleaner
    cmatrix
    gparted                           # partition manager
    ffmpeg
    imv                               # image viewer
    killall
    libnotify
	  man-pages					            	  # extra man pages
    mpv                               # video player
    ncdu                              # disk space
    openssl
    pamixer                           # pulseaudio command line mixer
    pavucontrol                       # pulseaudio volume controle (GUI)
    playerctl                         # controller for media players
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist                          # clipboard manager
    poweralertd
    qalculate-gtk                     # calculator
    unzip
    wget
    xdg-utils
    xxd
    inputs.alejandra.defaultPackage.${system}
  ]);
}
