#!/usr/bin/env bash
set -euo pipefail
# Diagnostic only: no shutdown.
timestamp="$(date --iso-8601=seconds)"
printf '%s guardian dry-run: schedule triggered; no shutdown\n' "$timestamp"
logger -t guardian "Scheduled event fired (dry run; no shutdown)"
