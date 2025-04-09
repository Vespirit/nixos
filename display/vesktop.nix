{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [

        (vesktop.overrideAttrs (finalAttrs: previousAttrs: {
            desktopItems = [
                ((builtins.elemAt previousAttrs.desktopItems 0).override { 
                    exec = "vesktop %U --ozone-platform-hint=x11";
                })
            ];
        }))
    ];
}
