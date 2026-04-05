{pkgs, ...}: {
  home.packages = [pkgs.discord];
  programs.zsh.shellAliases.discord = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland";
}
