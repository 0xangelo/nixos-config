{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg-path = "rbw/config.json";
  pinentry = lib.getExe pkgs.pinentry-gnome3;
in {
  programs.rbw.enable = true;

  home.packages = with pkgs; [pinentry-gnome3];

  sops.templates.${cfg-path} = {
    content = ''
      {
        "email": "${config.sops.placeholder.email}",
        "sso_id": null,
        "base_url": null,
        "identity_url": null,
        "ui_url": null,
        "notifications_url": null,
        "lock_timeout": 3600,
        "sync_interval": 3600,
        "pinentry": "${pinentry}",
        "client_cert_path": null
      }
    '';
    # path = "${config.xdg.configHome}/${cfg-path}";
  };

  xdg.configFile.${cfg-path}.source =
    config.lib.file.mkOutOfStoreSymlink "${config.sops.templates.${cfg-path}.path}";
  # xdg.configFile.${cfg-path}.source = "${config.sops.templates.${cfg-path}.path}";
}
