{ pkgs, user, ... }:

{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = "25.05";
    packages = with pkgs.nerd-fonts; [
      fira-code
      jetbrains-mono
    ];
  };

  fonts.fontconfig.enable = true;
}
