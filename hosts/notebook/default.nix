{ config, pkgs, modulesPath, ... }:

let 
  hostName = "nixos";
  timeZone = "Europe/Minks";
  locale = "ru_RU.UTF-8";
in {
  imports = [
    ./hardware.nix
    ../../users/notsecret32
  ];

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network
  networking.hostName = hostName; 
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = timeZone;

  # Select internationalisation properties.
  i18n.defaultLocale = locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Version
  system.stateVersion = "25.05"; 
}
