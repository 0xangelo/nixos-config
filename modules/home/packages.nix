{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # CLIs
    alejandra
    bc # is a mathematics language used for the dropdown calculator.
    curl
    eza # ls replacement
    entr # perform action when file change
    fastfetch # Actively maintained, feature-rich and performance oriented, neofetch like system information tool
    fd # find replacement
    ffmpeg
    file # Show file information
    fzf # fuzzy finder
    gtrash # rm replacement, put deleted files in system trash
    imv # image viewer
    jq # Lightweight and flexible command-line JSON processor
    lsof # Lists open files and the corresponding processes
    libnotify # Library that sends desktop notifications to a notification daemon
    mpv # video player
    ncdu # disk space
    ripgrep # grep replacement
    silicon # Create beautiful image of your source code
    tdf # cli pdf viewer
    termshot # Terminal screenshotter
    tldr # simplified man pages
    toipe # typing test in the terminal
    tokei # Count your code, quickly
    unzip
    wget
    xh # Friendly and fast tool for sending HTTP requests
    yt-dlp # YouTube downloader
    yubikey-manager
    zip # Compressor/archiver for creating and modifying zipfiles

    # TUIs
    lazydocker # A terminal UI for managing Docker containers, images, volumes, and more.
    ncspot # Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes
    mprocs # TUI tool to run multiple commands in parallel and show the output of each command separately
    yazi # terminal file manager

    # LSPs
    bash-language-server
    hyprls # LSP server for Hyprland's configuration language
    lua-language-server # Language server that offers Lua language support

    # GUIs
    brave # browser
    evince # gnome pdf viewer
    gimp
    qalculate-gtk # calculator
    libreoffice
    nemo-with-extensions # file manager
    pavucontrol # pulseaudio volume controle (GUI)
    signal-desktop # Private, simple, and secure messenger
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

    # gRPC
    # buf # Create consistent Protobuf APIs that preserve compatibility and comply with design best-practices
    # grpcurl
    # grpcui
    # protobuf # Google's data interchange format

    # Python
    python3

    # Misc
    nodejs # Event-driven I/O framework for the V8 JavaScript engine
    bleachbit # cache cleaner
    cmatrix
    gparted # partition manager
    killall
    man-pages # extra man pages
    openssl
    pamixer # pulseaudio command line mixer
    playerctl # controller for media players
    cliphist # clipboard manager
    poweralertd
    soundwireserver # pass audio to android phone
    xdg-utils
    zenity # Display dialogs from the command-line/shell scripts.
  ];
}
