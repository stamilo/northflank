#!/bin/sh

echo "Starting Xray..."
sed -i "s/UUID_REPLACE/$UUID/g" /etc/xray/config.json

xray -config /etc/xray/config.json &

echo "Starting Cloudflare Tunnel..."
cloudflared tunnel run --token $TUNNEL_TOKEN