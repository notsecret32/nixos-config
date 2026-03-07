{ pkgs, ... }:

{
  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      gamescopeSession.enable = true;
      package = pkgs.steam.override {
        extraPkgs = (
          pkgs: with pkgs; [
            gamemode
          ]
        );
      };
    };

    nix-ld.enable = true;

    gamemode = {
      enable = true;
    };

    gamescope = {
      enable = true;
    };
  };

  services = {
    logmein-hamachi.enable = true;

    transmission = {
      enable = true;
      package = pkgs.transmission_4;
    };

    flatpak = {
      enable = true;
    };
  };
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.07"
  ];
  environment.systemPackages = with pkgs; [
    (ventoy.override {
      defaultGuiType = "gtk3";
      withGtk3 = true;
    })
  ];
}
