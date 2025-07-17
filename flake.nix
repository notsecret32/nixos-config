{
  description = "My firsk flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      systemArch = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.default = lib.nixosSystem {
        system = systemArch;
        modules = [
          ./configuration.nix
        ];
      };
    };
}
