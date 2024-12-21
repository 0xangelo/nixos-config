{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    bc                                # is a mathematics language used for the dropdown calculator.
    bitwarden-cli
    bitwise                           # cli tool for bit / hex manipulation
    brave                             # browser
    curl
    dooit                             # An awesome TUI todo manager
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
    jinja2-cli                        # To render ".j2" files (templates)
    lazygit
    libreoffice
    lsof                              # Lists open files and the corresponding processes
    nemo-with-extensions              # file manager
    nitch                             # systhem fetch util
    nix-prefetch-github
    nodejs                            # Event-driven I/O framework for the V8 JavaScript engine
    prismlauncher                     # minecraft launcher
    ripgrep                           # grep replacement
    silicon                           # Create beautiful image of your source code
    soundwireserver                   # pass audio to android phone
    tdf                               # cli pdf viewer
    telegram-desktop
    tldr                              # simplified man pages
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    tree                              # list contents of directories in a tree-like format
    valgrind                          # c memory analyzer
    yarn                              # Fast, reliable, and secure dependency management for javascript
    yazi                              # terminal file manager
    yt-dlp                            # YouTube downloader
    zenity
    zip                               # Compressor/archiver for creating and modifying zipfiles
    winetricks
    wineWowPackages.wayland

    # C / C++
    clang
    (hiPrio gcc) # https://github.com/nix-community/home-manager/issues/1668#issuecomment-1264298055
    gnumake

    # Go
    go

    # Postgres
    postgresql                        # Needed for building some diesel binaries?

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
