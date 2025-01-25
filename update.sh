#!/usr/bin/env bash

set -eu

die() {
    echo -e "\033[31m$1\033[m"
    exit 1
}

if test $# -ne 1; then
    die "Usage: ./update.sh <version>"
fi

# Copy the JAR.
cp ../Nguhcraft-Fabric/build/libs/Nguhcraft-$1.jar mods/Nguhcraft.jar

# Bump the version.
sed -i -E "s/version = \".+\"/version = \"$1\"/" pack.toml

# Update the index.
packwiz refresh
