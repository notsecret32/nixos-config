{ config, pkgs, lib, ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable GNOME Desktop Environment
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configuring Keymap for X11
  services.xserver.xkb = {
    layout = "us,ru";
  };
}
