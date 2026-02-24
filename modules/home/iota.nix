{pkgs, ...}: let
  iota = pkgs.callPackage ../../iota/default.nix {};
in {
  home.packages = [
    iota.iota
    iota.move-analyzer
  ];
}
