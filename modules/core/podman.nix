_: {
  virtualisation = {
    containers.enable = true; # Shared base for Podman/Docker/etc. — almost always needed

    podman = {
      enable = true;
      dockerCompat = true; # `docker` command + socket alias (very convenient)
      defaultNetwork.settings.dns_enabled = true; # Crucial for podman-compose / multi-container networking

      # Nice-to-haves for reproducibility & maintenance
      autoPrune.enable = true;
      autoPrune.dates = "weekly";
    };
  };
}
