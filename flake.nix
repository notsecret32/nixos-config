{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
    };

    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      grub2-themes,
      prismlauncher,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "notsecret32";
      hosts = [
        {
          hostname = "linux";
        }
      ];
      pkgs = nixpkgs.legacyPackages.${system};

      makeSystem =
        { hostname }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs hostname user;
          };
          modules = [
            ./hosts/${hostname}/configuration.nix
            grub2-themes.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = ./home-manager/home.nix;
              home-manager.extraSpecialArgs = { inherit user; };
            }
            (
              { pkgs, ... }:
              {
                environment.systemPackages = [ prismlauncher.packages.${pkgs.system}.prismlauncher ];
              }
            )
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.foldl' (
        configs: host:
        configs
        // {
          "${host.hostname}" = makeSystem {
            inherit (host) hostname;
          };
        }
      ) { } hosts;

      devShells.${system} = {
        tauri = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            pkg-config
            gobject-introspection
            cargo
            clippy
            rustfmt
            rustc
          ];

          buildInputs = with pkgs; [
            at-spi2-atk
            atkmm
            cairo
            gdk-pixbuf
            glib
            gtk3
            harfbuzz
            librsvg
            libsoup_3
            pango
            webkitgtk_4_1
            openssl
          ];

          shellHook = ''
            echo "Tauri dev environment activated"
            export WEBKIT_DISABLE_DMABUF_RENDERER=1
            export RUST_BACKTRACE=1
          '';
        };
      };
    };
}
