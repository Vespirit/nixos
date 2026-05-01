{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
    ./emulation.nix
  ];
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      platformOptimizations.enable = true;
      gamescopeSession.enable = true;
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gamescope-wsi
    gamescope
    inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    heroic
    #osu-lazer-bin

    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    #(prismlauncher.override {
    #  textToSpeechSupport = false;
    #})
    #bolt-launcher
    #dolphin-emu
  ];
}
