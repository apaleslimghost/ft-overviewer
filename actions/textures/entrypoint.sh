#!/bin/bash

set -e

manifest_url=https://launchermeta.mojang.com/mc/game/version_manifest.json

echo "Downloading version manifest from $manifest_url"

response=$(http --check-status --ignore-stdin $manifest_url)
version=${MINECRAFT_VERSION:-$(echo $response | jq -r .latest.release)}
version_url=$(echo $response | jq -r ".versions[] | select(.id == \"$version\") | .url")

echo "Dowloading $version manifest from $version_url"

response=$(http --check-status --ignore-stdin $version_url)
jar_url=$(echo $response | jq -r ".downloads.client.url")

echo "Downloading JAR from $jar_url"

http --check-status --ignore-stdin --body --download --output $GITHUB_WORKSPACE/client.jar $jar_url
