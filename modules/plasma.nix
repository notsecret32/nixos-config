{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        sessionCommands = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --newmode "1280x960_240.00"  476.10  1280 1392 1536 1792  960 961 964 1107  -HSync +Vsync
        '';
      };
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
