{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Gui apps
    discord
    github-desktop
    godot_4
    telegram-desktop

    # Nix
    nil
    nixfmt

    # Frontend
    bun
    nodejs_24
  ];
}
