{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      alejandra
      taplo
    ];
  };
  # To avoid Stylix overriding AstroNvim's init.lua
  stylix.targets.neovim.enable = false;
}
