#!/bin/bash

set -e

source $GITHUB_WORKSPACE/minecraft-tools/login.sh "$MINECRAFT_EMAIL" "$MINECRAFT_PASSWORD" > /dev/null
$GITHUB_WORKSPACE/minecraft-tools/realms-download.sh "$SLOT_NUMBER"
tar xvf world.tar.gz -C /home/minecraft/server
