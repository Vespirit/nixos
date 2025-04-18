# 💫 https://github.com/JaKooLit 💫 #

{ lib, pkgs, config, ... }:
with lib;
{
  boot.kernelParams = [ 
    "nvidia_drm.fbdev=1" 
    "nvidia.NVreg_RegistryDwords=\"PowerMizerEnable=0x1; PerfLevelSrc=0x2222; PowerMizerLevel=0x3; PowerMizerDefault=0x3; PowerMizerDefaultAC=0x3\""
  ];
  boot.initrd.kernelModules = [ 
    "nvidia" 
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
    "nvme" # xanmod
  ];
  boot.blacklistedKernelModules = [ "nouveau" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
    libvdpau
    libvdpau-va-gl 
    nvidia-vaapi-driver
    vdpauinfo
    libva
    libva-utils	
    rocmPackages.clr
  ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;
      
    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
      
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
      
    dynamicBoost.enable = false; # Dynamic Boost

    nvidiaPersistenced = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;
      
    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = false;
      
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];
}
