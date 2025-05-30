{ inputs, pkgs, ... }: 
{
  home.packages = (with pkgs; [
    age                               # Modern encryption tool with small explicit keys
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
    glow                              # Render markdown on the CLI, with pizzazz!
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gimp
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    jdk17                             # java
    jq                                # Lightweight and flexible command-line JSON processor
    jinja2-cli                        # To render ".j2" files (templates)
    libreoffice
    lsof                              # Lists open files and the corresponding processes
    nemo-with-extensions              # file manager
    ncspot                            # Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes
    nitch                             # systhem fetch util
    nodejs                            # Event-driven I/O framework for the V8 JavaScript engine
    prismlauncher                     # minecraft launcher
    ripgrep                           # grep replacement
    silicon                           # Create beautiful image of your source code
    slack                             # Desktop client for Slack
    sops                              # Simple and flexible tool for managing secrets
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

    # Git
    gitbutler
    lazygit
    nix-prefetch-github

    # gRPC
    buf                               # Create consistent Protobuf APIs that preserve compatibility and comply with design best-practices
    grpcurl
    grpcui
    protobuf                          # Google's data interchange format

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
