{lib, ...}: {
  programs.television = {
    enable = true;
    enableZshIntegration = true;
    channels.nix-search-tv.metadata.name = lib.mkForce "nix";
  };
  programs.nix-search-tv = {
    enable = true;
    enableTelevisionIntegration = true;
  };
}
