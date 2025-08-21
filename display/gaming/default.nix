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
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    (inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin.override {
      pipewire_latency = "32/48000";
    })
    heroic
    #(prismlauncher.override {
    #  textToSpeechSupport = false;
    #})
    #bolt-launcher
    dolphin-emu
  ];
}
