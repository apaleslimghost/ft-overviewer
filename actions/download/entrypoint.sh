#!/bin/bash

set -e

auth_server=https://authserver.mojang.com
client_token=github.com/air/minecraft-tools

response=$(http --check-status --ignore-stdin POST ${auth_server}/authenticate username=${MINECRAFT_EMAIL} password=${MINECRAFT_PASSWORD} clientToken=${client_token} agent:='{"name": "Minecraft", "version": 1}')
if [ $? -ne 0 ];then
  echo "Error authenticating, response: ${response}"
  return 1
fi

# parse details from the JSON response
access_token=$(echo ${response} | jq -r .accessToken)
name=$(echo ${response} | jq -r .selectedProfile.name)
id=$(echo ${response} | jq -r .selectedProfile.id)

echo "Logged in as $name"

realms_server=https://mcoapi.minecraft.net
version=1.11.2

cookie_string="Cookie:sid=token:${access_token}:${id};user=${name};version=${version}"

# 1. get world ID
echo ${realms_server}/worlds
response=$(http --check-status --ignore-stdin --verify=no GET ${realms_server}/worlds "${cookie_string}")
if [ $? -ne 0 ];then
  echo "Error getting worlds, response: ${response}"
  exit 1
fi
world_id=$(echo ${response} | jq .servers[0].id)
echo "Downloading from world $world_id"

# 2. get download link
echo ${realms_server}/worlds/${world_id}/slot/${SLOT_NUMBER}/download
response=$(http --check-status --ignore-stdin --verify=no GET ${realms_server}/worlds/${world_id}/slot/${SLOT_NUMBER}/download "${cookie_string}")
if [ $? -ne 0 ];then
  echo "Error getting download link, response: ${response}"
  exit 2
fi
url=$(echo ${response} | jq -r .downloadLink)
echo "Downloading $url"

# 3. download backup
http --check-status --ignore-stdin --body --download --verify=no --output=world.tar.gz ${url}
if [ $? -ne 0 ];then
  echo "Error downloading, exit code: $?"
  exit 3
fi

echo "Extracting to $GITHUB_WORKSPACE"

tar xvf -C $GITHUB_WORKSPACE world.tar.gz
