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
    };
    nix-ld.enable = true;
  };

  services = {
    logmein-hamachi.enable = true;
  };
}
