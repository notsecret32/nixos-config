{
  description = "My firsk flake!";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      systemArch = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.default = lib.nixosSystem {
        system = systemArch;
        modules = [
          ./configuration.nix
	  home-manager.nixosModules.home-manager
	  {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.notsecret32 = import ./home.nix;
	  }
        ];
      };
    };
}
