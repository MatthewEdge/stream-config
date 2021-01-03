#!/bin/sh

# To get $DISCORD_WEBHOOK_URL
source ./.secrets

if [ ! -z "${DISCORD_WEBHOOK_URL}" ]; then
  echo "Posting to Discord..."
  curl -X POST -H "Content-Type: application/json" -d '{"content": "@everyone The Lab is opening soon! https://twitch.tv/medgelabs"}' $DISCORD_WEBHOOK_URL
fi
