#! /usr/bin/bash
set -e

echo "Debug: trying to launch nginx"
nginx -g "daemon off;"
echo "Nginx started"
