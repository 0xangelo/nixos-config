{pkgs, ...}: {
  programs.neovide = {
    enable = true;
    package = pkgs.neovide;
    settings = {};
  };
}
