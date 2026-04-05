{pkgs, ...}: {
  home.packages = with pkgs; [
    # LSPs
    bash-language-server
    hyprls # LSP server for Hyprland's configuration language
    lua-language-server # Language server that offers Lua language support
    markdown-oxide
    taplo
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      alejandra
      taplo
    ];
  };
  programs.neovim.initLua = ''
    require "astro"
  '';
  # To avoid Stylix requiring mini.nvim
  stylix.targets.neovim.enable = false;
  programs.neovide.enable = true;
}
