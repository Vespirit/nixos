{ pkgs, ... }:
{
    virtualisation = {
        libvirtd.enable = true;
        spiceUSBRedirection = true;
    };

    users.groups.libvirtd.members = [ "ves" ];

    programs.virt-manager.enable = true;
}
