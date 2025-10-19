{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui apps
    github-desktop
    telegram-desktop

    # Terminal
    nixd
    nixfmt-rfc-style
  ];
}
