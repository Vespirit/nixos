{pkgs, ... }:
let
  nix-gaming = import (builtins.fetchTarball "https://github.com/fufexan/nix-gaming/archive/master.tar.gz");
in 
{
  imports = [
    nix-gaming.nixosModules.platformOptimizations
  ];
  programs.steam.enable = true;
  programs.steam.platformOptimizations.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    lutris
    nix-gaming.packages.${hostPlatform.system}.osu-stable
  ];
}
