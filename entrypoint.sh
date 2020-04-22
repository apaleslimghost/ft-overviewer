#!/bin/bash

set -e

cd $GITHUB_WORKSPACE

source minecraft-tools/login.sh "$MINECRAFT_EMAIL" "$MINECRAFT_PASSWORD"
minecraft-tools/realms-download.sh
tar xvf world.tar.gz

/home/minecraft/entrypoint.sh
