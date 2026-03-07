{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui apps
    transmission_4-qt
    android-studio
    davinci-resolve
    discord
    ghostty
    google-chrome
    github-desktop
    godot_4
    obs-studio
    telegram-desktop
    r2modman
    yandex-music
    qbittorrent
    vlc
    slack
    haguichi
    vinegar

    # Games
    # (vintagestory.overrideAttrs (oldAttrs: rec {
    #   version = "1.21.5";
    #   src = fetchurl {
    #     url = "https://cdn.vintagestory.at/gamefiles/stable/vs_client_linux-x64_${version}.tar.gz";
    #     hash = "sha256-dG1D2Buqht+bRyxx2ie34Z+U1bdKgi5R3w29BG/a5jg=";
    #   };
    # }))

    # Nix
    nil
    nixfmt

    # Frontend
    bun
    nodejs_24

    # AppImages
    # (callPackage ../packages/dolphin-anty.nix { })

    # Gaming Packages
    protonup-ng
    protontricks
    wineWowPackages.stable
    winetricks

    # Game Launchers
    bottles
    heroic
    lutris

    # CLI
    rar
    zip

    # Packages
    neovim
    lazygit
    wezterm
    zoxide
    tree-sitter
    tmux
    eza
    stow
    fzf
    gnumake
    gccgo15
    jdk17
    gradle
    dpkg
    apt
  ];
}
