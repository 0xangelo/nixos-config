{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraPackages = with pkgs; [alejandra];
  };
}
