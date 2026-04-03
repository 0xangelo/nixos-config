{pkgs, ...}: {
  networking = {
    hostName = "dusk";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
