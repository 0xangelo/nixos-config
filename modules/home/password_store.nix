{ pkgs, config, ... }:

{
  home.packages = (with pkgs; [
    pass-wayland
  ]);

  programs.password-store = {
    enable = true;
    package = pkgs.pass-wayland;
    settings = {
      PASSWORD_STORE_DIR = "${config.xdg.dataHome}/password-store";
      PASSWORD_STORE_KEY = "9B4D34AE0C0D3B8F";
      PASSWORD_STORE_CLIP_TIME = "45";
    };
  };
}
