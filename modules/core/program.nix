{ ... }:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
    settings = {
      default-cache-ttl = 34560000;
      max-cache-ttl = 34560000;
    };
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];
}
