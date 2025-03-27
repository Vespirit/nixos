{ config, pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ./gaming/gaming.nix
    ./hyprland.nix
  ];
  hardware.enableRedistributableFirmware = true;

  hardware.graphics = { 
  	enable = true;
  	enable32Bit = true;
  };

  programs = {
    firefox.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    baobab
    xdg-user-dirs
    xdg-utils
    duf
    vesktop
    spotify
    obs-studio
  ];
} 
