#!/usr/bin/env bash
if [[ $1 == "" ]]; then
    u=""
else
    u="--upgrade"
fi
sudo nixos-rebuild -I nixos-config=/home/ves/nixos/configuration.nix switch $u

