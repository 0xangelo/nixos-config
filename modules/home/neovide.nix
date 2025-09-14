{pkgs, ...}: {
  home.packages = with pkgs; [
    neovide # neovim gui in rust
  ];

  xdg.configFile."neovide".text = '''';
}
