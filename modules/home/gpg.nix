{...}: {
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    # pinentryPackage = pkgs.pinentry-qt;
    enableZshIntegration = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
  };

  programs.gpg.enable = true;
}
