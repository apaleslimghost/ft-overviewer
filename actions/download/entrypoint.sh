#!/bin/bash

lftp  -u"$FTP_USER,$FTP_PASS" "$FTP_HOST" -e "mirror --delete --only-newer $WORLD world ; quit"
