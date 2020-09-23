#!/bin/bash

lftp  -u"$FTP_USER,$FTP_PASS" "$FTP_HOST" -e "mirror --delete --only-newer --verbose $WORLD world ; quit"
