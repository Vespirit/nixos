{pkgs, inputs, ... }:
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
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    osu-lazer-bin
    heroic
    (prismlauncher.override {
      textToSpeechSupport = false;
    })
  ];
}
