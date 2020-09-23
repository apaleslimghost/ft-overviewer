#!/bin/bash

wget -m --user="$FTP_USER" --password="$FTP_PASS" "ftp://$FTP_HOST/$WORLD"

mv "$FTP_HOST/$WORLD" world
