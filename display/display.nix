{ config, pkgs, ... }:
{
  imports = [
    ./nvidia.nix
    ./flatpak.nix
    ./hyprland.nix
    ./gaming.nix
  ];

  programs = {
    firefox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    zenity
  ];
} 
