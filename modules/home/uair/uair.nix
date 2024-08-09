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
        ExecStart = "${pkgs.uair}/bin/uair -q";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}

