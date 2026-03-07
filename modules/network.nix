{
  networking = {
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 12975 ];
      allowedUDPPorts = [ 41641 ];
      trustedInterfaces = [ "ham0" ];
    };
  };
}
