{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        gh
        lazygit
    ];

    programs.git = {
        enable = true;
    };
}
