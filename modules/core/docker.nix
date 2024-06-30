{ username, ... }:

{
  # Add user to docker group
  users.users.${username}.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };
}

