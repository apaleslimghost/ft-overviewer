#!/bin/bash

wget -m --ftp-username="$FTP_USER" --ftp-password="$FTP_PASS" "ftp://$FTP_HOST/$WORLD"

mv "$FTP_HOST/$WORLD" world
