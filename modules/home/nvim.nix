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
  stylix.targets.neovide.enable = false;
  programs.neovide.enable = true;
}
