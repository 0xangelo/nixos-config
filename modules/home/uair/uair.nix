{ pkgs, ... }:
{
  home.packages = (with pkgs; [ uair ]);
  xdg.configFile."uair/uair.toml".source = ./uair.toml;
}

