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

      # Android
      ANDROID_HOME = "$HOME/Android/Sdk";
    };

    extraInit = ''
      export PATH=$PATH:$ANDROID_HOME/emulator
      export PATH=$PATH:$ANDROID_HOME/tools
      export PATH=$PATH:$ANDROID_HOME/tools/bin
      export PATH=$PATH:$ANDROID_HOME/platform-tools
      export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
    '';
  };

  nixpkgs.config.android_sdk.accept_license = true;
  virtualisation.libvirtd.enable = true;

  networking.hostName = hostname;

  system.stateVersion = "25.05";
}
