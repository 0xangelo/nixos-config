{ ... }:
{
  programs.dconf.enable = true; # TODO: remove?
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
}
