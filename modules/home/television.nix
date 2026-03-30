{lib, ...}: {
  programs.television = {
    enable = true;
    enableZshIntegration = false;
    channels.nix-search-tv.metadata.name = lib.mkForce "nix";
  };
  programs.nix-search-tv = {
    enable = true;
    enableTelevisionIntegration = true;
  };
}
