{ pkgs, ... }:
{
  home.packages = with pkgs;[
    ## Utils
    # gamemode
    # gamescope
    protontricks
    winetricks
    # inputs.nix-gaming.packages.${pkgs.system}.wine-ge

    ## Minecraft
    # prismlauncher

    ## Cli games
    # _2048-in-terminal
    # vitetris
    # nethack
  ];
}
