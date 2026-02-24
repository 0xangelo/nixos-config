{
  description = "NixOS configuration";

  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
    self,
    ...
  } @ inputs: let
    username = "doom";
    system = "x86_64-linux";
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (import ./hosts/laptop)
        nixos-hardware.nixosModules.framework-16-7040-amd
        sops-nix.nixosModules.sops
      ];
      specialArgs = {
        host = "laptop";
        inherit self inputs username;
      };
    };
  };
}
