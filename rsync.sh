#!/bin/bash

# Installation on raspberry pi
# 1. sudo apt install apache
# 2. sudo chown pi:pi -R /var/www/html
# 4. raspivid -t 0 -w 320 -h 180 -fps 12 -rot 180 -a 12 -ifx saturation -ex auto  -n -l -o tcp://127.0.0.1:3030 -pf baseline 2>&1
# 3. copy

npm run build
rsync -vzr --delete dist/ betahaus:/var/www/html/
