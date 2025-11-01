{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui apps
    discord
    github-desktop
    telegram-desktop

    # Utils
    bun
    gccgo15
    unzip
    gnumake
    ripgrep
    fd

    # Lua
    lua
    stylua

    # Nix
    nil
    nixfmt

    # NodeJS
    nodejs_24
  ];
}
