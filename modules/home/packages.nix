{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    age # Modern encryption tool with small explicit keys
    bc # is a mathematics language used for the dropdown calculator.
    brave # browser
    curl
    evince # gnome pdf viewer
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    file # Show file information
    fzf # fuzzy finder
    glow # Render markdown on the CLI, with pizzazz!
    gimp
    gtrash # rm replacement, put deleted files in system trash
    jdk17 # java
    jq # Lightweight and flexible command-line JSON processor
    libreoffice
    lsof # Lists open files and the corresponding processes
    mprocs # TUI tool to run multiple commands in parallel and show the output of each command separately
    nemo-with-extensions # file manager
    ncspot # Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes
    nitch # systhem fetch util
    nodejs # Event-driven I/O framework for the V8 JavaScript engine
    ripgrep # grep replacement
    silicon # Create beautiful image of your source code
    slack # Desktop client for Slack
    sops # Simple and flexible tool for managing secrets
    soundwireserver # pass audio to android phone
    tdf # cli pdf viewer
    telegram-desktop
    termshot # Terminal screenshotter
    tldr # simplified man pages
    toipe # typing test in the terminal
    tokei # Count your code, quickly
    valgrind # c memory analyzer
    yarn # Fast, reliable, and secure dependency management for javascript
    yazi # terminal file manager
    yt-dlp # YouTube downloader
    yubikey-manager
    zenity
    zip # Compressor/archiver for creating and modifying zipfiles
    winetricks
    wineWowPackages.wayland

    # Presentations
    mermaid-cli # Generation of diagrams from text in a similar manner as markdown
    pandoc # Conversion between documentation formats
    presenterm # Terminal based slideshow tool
    typst # New markup-based typesetting system that is powerful and easy to learn
    python313Packages.weasyprint # Converts web documents to PDF

    # Git
    delta # Syntax-highlighting pager for Git
    gitbutler
    lazygit
    nix-prefetch-github

    # gRPC
    buf # Create consistent Protobuf APIs that preserve compatibility and comply with design best-practices
    grpcurl
    grpcui
    protobuf # Google's data interchange format

    # C / C++
    clang
    (hiPrio gcc) # https://github.com/nix-community/home-manager/issues/1668#issuecomment-1264298055
    gnumake

    # Go
    go

    # Postgres
    postgresql # Needed for building some diesel binaries?

    # Python
    python3

    # Rust development
    bacon
    cmake
    fontconfig # For plotters
    freetype # For plotters
    just # Handy way to save and run project-specific commands
    pkg-config # metainformation about installed libraries
    rustup

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
    inputs.alejandra.defaultPackage.${system}
  ];
}
