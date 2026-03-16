{pkgs, ...}: {
  home.packages = with pkgs; [
    tree-sitter # Parser generator tool and an incremental parsing library
  ];

  xdg.configFile."tree-sitter/config.json".source = ./config.json;
}
