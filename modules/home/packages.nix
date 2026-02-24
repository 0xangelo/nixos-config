{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # TUIs
    alejandra
    bc # is a mathematics language used for the dropdown calculator.
    curl
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    file # Show file information
    fzf # fuzzy finder
    gimp
    gtrash # rm replacement, put deleted files in system trash
    jdk17 # java
    jq # Lightweight and flexible command-line JSON processor
    lazydocker # A terminal UI for managing Docker containers, images, volumes, and more.
    libreoffice
    lsof # Lists open files and the corresponding processes
    lua-language-server # Language server that offers Lua language support
    mprocs # TUI tool to run multiple commands in parallel and show the output of each command separately
    ncspot # Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes
    fastfetch # Actively maintained, feature-rich and performance oriented, neofetch like system information tool
    nil # Yet another language server for Nix
    nodejs # Event-driven I/O framework for the V8 JavaScript engine
    ripgrep # grep replacement
    silicon # Create beautiful image of your source code
    soundwireserver # pass audio to android phone
    tdf # cli pdf viewer
    termshot # Terminal screenshotter
    tldr # simplified man pages
    toipe # typing test in the terminal
    tokei # Count your code, quickly
    valgrind # c memory analyzer
    xh # Friendly and fast tool for sending HTTP requests
    yarn # Fast, reliable, and secure dependency management for javascript
    yazi # terminal file manager
    yt-dlp # YouTube downloader
    yubikey-manager
    zip # Compressor/archiver for creating and modifying zipfiles

    # Wine (gaming)
    winetricks
    wineWowPackages.wayland

    # GUIs
    brave # browser
    evince # gnome pdf viewer
    nemo-with-extensions # file manager
    slack # Desktop client for Slack
    telegram-desktop

    # Secrets with NixOS
    age # Modern encryption tool with small explicit keys
    sops # Simple and flexible tool for managing secrets

    # Presentations
    mermaid-cli # Generation of diagrams from text in a similar manner as markdown
    pandoc # Conversion between documentation formats
    presenterm # Terminal based slideshow tool
    typst # New markup-based typesetting system that is powerful and easy to learn
    python313Packages.weasyprint # Converts web documents to PDF

    # Git
    delta # Syntax-highlighting pager for Git
    nix-prefetch-github

    # gRPC
    buf # Create consistent Protobuf APIs that preserve compatibility and comply with design best-practices
    grpcurl
    grpcui
    protobuf # Google's data interchange format

    # C / C++
    clang
    (lib.hiPrio gcc) # https://github.com/nix-community/home-manager/issues/1668#issuecomment-1264298055
    gnumake

    # Go
    go

    # Postgres
    postgresql # Needed for building some diesel binaries?

    # Python
    python3

    bleachbit # cache cleaner
    cmatrix
    gparted # partition manager
    ffmpeg
    imv # image viewer
    killall
    libnotify
    man-pages # extra man pages
    mpv # video player
    ncdu # disk space
    openssl
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    playerctl # controller for media players
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
    cliphist # clipboard manager
    poweralertd
    qalculate-gtk # calculator
    unzip
    wget
    xdg-utils
    xxd
    zenity # Display dialogs from the command-line/shell scripts.
  ];
}
