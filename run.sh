#!/bin/bash
set -e

USAGE="Usage: $0 <env-file>
Starts the HPE Networking MCP server using the specified env file.

Examples:
  $0 .env-Internal
  $0 .env-Production
"

if [ -z "$1" ]; then
  echo "Error: env file argument is required." >&2
  echo "$USAGE" >&2
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: env file '$1' not found." >&2
  echo "$USAGE" >&2
  exit 1
fi

docker compose --env-file "$1" up -d