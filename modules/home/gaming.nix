{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Utils
    protonplus
    protontricks
  ];
}
