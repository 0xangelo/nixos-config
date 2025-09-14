{pkgs, ...}: {
  home.packages = with pkgs; [swaynotificationcenter];
  xdg.configFile."swaync/config.json".source = ./config.json;
}
