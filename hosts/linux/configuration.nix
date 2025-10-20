{
  pkgs,
  hostname,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ./local-packages.nix
  ];

  environment.systemPackages = [ pkgs.home-manager ];

  networking.hostName = hostname;

  system.stateVersion = "25.05";
}
