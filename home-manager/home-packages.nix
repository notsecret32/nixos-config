{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui apps
    discord
    google-chrome
    github-desktop
    godot_4
    telegram-desktop
    r2modman
    yandex-music
    qbittorrent

    # Games
    (vintagestory.overrideAttrs (oldAttrs: rec {
      version = "1.21.5";
      src = fetchurl {
        url = "https://cdn.vintagestory.at/gamefiles/stable/vs_client_linux-x64_${version}.tar.gz";
        hash = "sha256-dG1D2Buqht+bRyxx2ie34Z+U1bdKgi5R3w29BG/a5jg=";
      };
    }))

    # Nix
    nil
    nixfmt

    # Frontend
    bun
    nodejs_24

    # Gaming
    wine
    winetricks
    winePackages.fonts
    lutris
    gamemode
    mangohud

    # AppImages
    (callPackage ../packages/dolphin-anty.nix { })
  ];
}
