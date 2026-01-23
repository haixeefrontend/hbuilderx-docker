#!/bin/bash
set -e

log() {
  echo "[entrypoint] $*"
}

log "🚀 Starting HBuilderX in background..."

su-exec node /opt/hbuilderx/cli open > /var/log/hbuilderx.log 2>&1

log "✅ HBuilderX started."

if [ "$#" -gt 0 ]; then
  log "Running command: $*"
  exec su-exec node "$@"
else
  exec su-exec node "bash"
fi
