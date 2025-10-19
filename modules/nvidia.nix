{ config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  boot = {
    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia.NVreg_UsePageAttributeTable=1"
      "nvidia.NVreg_InitializeSystemMemoryAllocations=0"
    ];

    blacklistedKernelModules = [ "nouveau" ];
  };

  powerManagement.cpuFreqGovernor = "performance";
}
