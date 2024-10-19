{ username, ... }:
# NOTE: use manually installed binary until https://github.com/metent/uair/pull/23 is addressed
{
  # home.packages = (with pkgs; [ uair ]);
  xdg.configFile."uair/uair.toml".source = ./uair.toml;

  systemd.user.services = {
    uair = {
      Unit = {
        Description = "Uair pomodoro timer";
      };
      Service = {
        Type = "simple";
        # ExecStart = "${pkgs.uair}/bin/uair -q";
        ExecStart = "/home/${username}/.cargo/bin/uair -q";
        Restart = "always";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}

