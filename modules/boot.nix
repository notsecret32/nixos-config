{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    loader = {
      grub = {
        enable = true;
        device = "/dev/nvme0n1";
        useOSProber = true;
        extraConfig = ''
          set timeout=1
          set timeout_style=hidden
          set menu_auto_hide=1
          set gfxmode=auto,800x600,1024x768
          terminal_output gfxterm
        '';
        gfxmodeEfi = "auto";
        gfxpayloadEfi = "keep";
        splashImage = null;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };

    kernelParams = [
      "quiet"
      "splash"
      "loglevel=0"
      "systemd.show_status=auto"
      "udev.log_level=0"
      "rd.udev.log_level=0"
      "vt.global_cursor_default=0"
      "consoleblank=0"
      "rd.systemd.show_status=false"
      "rd.verbose=0"
      "systemd.log_level=err"
      "systemd.log_target=null"

      "plymouth.ignore-serial-consoles"
      "plymouth.enable=1"
      "fbcon=nodefer"

      "acpi_osi=Linux"
      "acpi_backlight=vendor"
      "earlyprintk=off"
    ];

    consoleLogLevel = 0;

    initrd = {
      verbose = false;
      systemd.enable = true;
      preLVMCommands = ''
        ${pkgs.kbd}/bin/setleds +num
      '';
    };

    plymouth = {
      enable = true;
      theme = "bgrt";
    };
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  systemd.services."getty@tty1".enable = false;
  systemd.services."getty@tty2".enable = false;
  systemd.services."getty@tty3".enable = false;
}
