#!/bin/sh
set -e
: "${UUID:?UUID env var is required}"
: "${WS_PATH:=/ws-assets}"
: "${PORT:=10000}"
export UUID WS_PATH PORT
envsubst < /etc/xray/config.template.json > /etc/xray/config.json
exec /usr/local/bin/xray run -config /etc/xray/config.json
