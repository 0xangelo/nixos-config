{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    postgresql
  ];

  services.postgresql = {
    enable = false;
    ensureDatabases = [ "playground" ];
    # https://github.com/NixOS/nixpkgs/issues/1735#issuecomment-1691191070
    authentication = pkgs.lib.mkOverride 10 ''
      local all all              trust
      host  all all 127.0.0.1/32 trust
      host  all all ::1/128      trust
      host  all all 0.0.0.0/0    md5
    '';

    settings = {
      max_connections = 200;
      max_wal_size = 16384;
      min_wal_size = 1024;
      listen_addresses = lib.mkForce "*";
    };
  };
}

