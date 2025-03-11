{ config, pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ./flatpak.nix
    ./hyprland.nix
    ./gaming.nix
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
    vesktop
    spotify
    baobab
    xdg-user-dirs
    xdg-utils
    duf
  ];
} 
