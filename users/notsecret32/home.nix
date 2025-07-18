{ config, pkgs, lib, ... }:

{
  home.username = "notsecret32";
  home.homeDirectory = "/home/notsecret32";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # Terminal stuff
    git
    neovim
    wezterm

    # GUI Apps
    telegram-desktop
    firefox
    github-desktop
  ];

  programs.firefox.enable = true;
}
