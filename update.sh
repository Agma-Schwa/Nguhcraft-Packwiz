#!/usr/bin/env bash

set -eu

die() {
    echo -e "\033[31m$1\033[m"
    exit 1
}

if test $# -ne 1; then
    die "Usage: ./update.sh <version>"
fi

cp ../Nguhcraft-Fabric/build/libs/Nguhcraft-$1.jar mods/Nguhcraft.jar
packwiz refresh
