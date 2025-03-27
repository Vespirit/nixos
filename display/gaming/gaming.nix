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
      package = pkgs.steam.override {
        extraPkgs = (pkgs: with pkgs; [
	        gamemode
	      ]);
      };
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.osu-stable
    osu-lazer-bin
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.gamescope
      ];
    })
  ];
}
