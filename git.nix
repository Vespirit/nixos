{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [

        git
        gh
        lazygit
    ];

    programs.git = {
        enable = true;
    };
}
