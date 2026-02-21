{
  inputs,
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      inputs.alejandra.defaultPackage.${stdenv.hostPlatform.system}
      taplo
      nil # Yet another language server for Nix
    ];
  };
}
