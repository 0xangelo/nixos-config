{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      alejandra
      taplo
      nil # Yet another language server for Nix
    ];
  };
}
