{
  description = "NixOS configuration";

  inputs = {
    sops-nix.url = "github:Mic92/sops-nix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };
    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };
    catppuccin-starship = {
      url = "github:catppuccin/starship";
      flake = false;
    };
  };

  outputs = {
    sops-nix,
    nixos-hardware,
    nixpkgs,
    self,
    ...
  } @ inputs: let
    selfPkgs = import ./pkgs;
    username = "doom";
    system = "x86_64-linux";
  in {
    overlays.default = selfPkgs.overlay;
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
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
  };
}
