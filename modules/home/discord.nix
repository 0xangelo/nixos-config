{pkgs, ...}: {
  home.packages = [pkgs.discord];
  home.shellAliases.discord = "discord --enable-features=UseOzonePlatform --ozone-platform=wayland";
}
