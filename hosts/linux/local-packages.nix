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
  };
}
