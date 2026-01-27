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
      mononoki
    ];

    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHT = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };

  fonts.fontconfig.enable = true;
}
