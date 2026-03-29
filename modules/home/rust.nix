# Rust development
{pkgs, ...}: {
  home.packages = with pkgs; [
    bacon
    just # Handy way to save and run project-specific commands
    cargo-deadlinks
    cargo-depgraph
    cargo-expand
    cargo-generate
    cargo-hack
    cargo-insta
    cargo-machete
    cargo-nextest
    cargo-public-api
    cargo-rdme
    cargo-semver-checks
    cargo-sweep
    cargo-udeps
    cargo-workspaces
    release-plz
    taplo
    tokio-console
  ];
}
