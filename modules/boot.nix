{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      grub = {
        enable = true;
        device = "/dev/nvme0n1";
        useOSProber = true;
      };

      grub2-theme = {
        enable = true;
        theme = "stylish";
        footer = true;
      };

      efi.canTouchEfiVariables = true;
    };
  };
}
