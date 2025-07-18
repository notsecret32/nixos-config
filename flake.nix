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
      # ========== Settings ==========
      wm = "gnome"; # Window Manager
      systemArch = "x86_64-linux"; # System Architecture

      # ========== Other stuff ==========
      lib = nixpkgs.lib;
    in {
      nixosConfigurations.notebook = lib.nixosSystem {
        system = systemArch;
        modules = [
	  ./home/wm/${wm}
	  ./hosts/notebook/default.nix
	  home-manager.nixosModules.home-manager
	  {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.notsecret32 = import ./users/notsecret32/home.nix;
	  }
        ];
      };
    };
}
