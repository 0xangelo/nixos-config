{ pkgs, ... }:
{
  home.packages = (with pkgs; [ uair ]);
  xdg.configFile."uair/uair.toml".source = ./uair.toml;

  systemd.user.services = {
    uair = {
      Unit = {
        Description = "Uair";
      };
      Service = {
        Type = "simple";
        ExecStart = "/usr/bin/env uair -q";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}

