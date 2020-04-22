#!/bin/bash

set -e

source $GITHUB_WORKSPACE/minecraft-tools/login.sh "$MINECRAFT_EMAIL" "$MINECRAFT_PASSWORD"
$GITHUB_WORKSPACE/minecraft-tools/realms-download.sh
tar xvf world.tar.gz -C /home/minecraft/server
