#!/bin/sh

# Start Nginx in the background
nginx &

# Wait for 30 seconds (or any duration you need)
sleep 240

# Stop Nginx
nginx -s stop

