#!/usr/bin/env bash
if [[ $UID != 0 ]]; then
    echo "Please run bootstrap.sh with sudo"
    exit 1
fi

pacman --sync --refresh
pacman --sync --noconfirm --needed - < packages.txt
