#!/bin/bash

lftp  -u"$FTP_USER,$FTP_PASS" "$FTP_HOST" -c "mirror --delete --only-newer $WORLD world"
