#!/bin/bash
set -o errexit

overviewer.py --config /config.py
overviewer.py --config /config.py --genpoi
