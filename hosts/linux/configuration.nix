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

  environment = {
    systemPackages = [ pkgs.home-manager ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NH_OS_FLAKE = "/home/notsecret32/Coding/nixos-config";
    };
  };

  networking.hostName = hostname;

  system.stateVersion = "25.05";
}
