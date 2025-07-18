{ config, lib, pkgs, ... }:

{
  users.users.notsecret32 = {
    isNormalUser = true;
    description = "notsecret32";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
