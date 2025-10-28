{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui apps
    discord
    github-desktop
    telegram-desktop

    # Terminal
    nixd
    nixfmt-rfc-style

    # Utils
    gccgo15
    unzip
    gnumake
    ripgrep
    fd

    # Lua
    lua
    stylua
  ];
}
