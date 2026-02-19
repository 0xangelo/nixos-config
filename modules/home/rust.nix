# Rust development
{pkgs, ...}: {
  home.packages = with pkgs; [
    bacon
    cmake
    fontconfig # For plotters
    freetype # For plotters
    just # Handy way to save and run project-specific commands
    pkg-config # metainformation about installed libraries
    cargo-deadlinks
    cargo-depgraph
    cargo-expand
    cargo-generate
    cargo-hack
    cargo-insta
    cargo-machete
    cargo-public-api
    cargo-rdme
    cargo-semver-checks
    cargo-sweep
    cargo-udeps
    cargo-workspaces
    release-plz
    rusty-man
    taplo
    tokio-console
  ];
}
