{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clip-persist
    wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
  ];
}
