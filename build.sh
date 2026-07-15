#!/bin/sh
set -e

USAGE="Usage: $0
Builds and starts the HPE Networking MCP server using the dev Docker Compose configuration.
Requires .env-Internal to be present in the current directory.

Run from the repo root:
  ./build.sh
"

if [ ! -f ".env-Internal" ]; then
  echo "Error: .env-Internal not found. Are you running from the repo root?" >&2
  echo "$USAGE" >&2
  exit 1
fi

docker compose -f docker-compose.yml -f docker-compose.dev.yml --env-file .env-Internal up -d --build