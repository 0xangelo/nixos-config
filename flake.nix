{
  description = "NixOS configuration";

  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-less685.url = "github:NixOS/nixpkgs/9d93b7bb76eeb01802106502a31a44364a1fffbd";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    sops-nix,
    nixos-hardware,
    nixpkgs,
    nixpkgs-less685,
    self,
    stylix,
    ...
  } @ inputs: let
    username = "doom";
    system = "x86_64-linux";
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        {
          nixpkgs.overlays = [
            (final: prev: {
              less = (import nixpkgs-less685 {inherit (prev) system;}).pkgs.less;
            })
          ];
        }
        nixos-hardware.nixosModules.framework-16-7040-amd
        sops-nix.nixosModules.sops
        stylix.nixosModules.stylix
        (import ./hosts/laptop)
      ];
      specialArgs = {
        host = "laptop";
        inherit self inputs username;
      };
    };
  };
}
