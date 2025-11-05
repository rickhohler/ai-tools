#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
YEAR="$(date +%Y)"
DATE="$(date +%Y-%m-%d)"
FILE="$ROOT/journal/$YEAR/$DATE.md"

mkdir -p "$ROOT/journal/$YEAR"

# Create file with header if it doesn't exist
if [ ! -f "$FILE" ]; then
  echo "# Journal for $DATE" > "$FILE"
  echo "" >> "$FILE"
fi

# Append timestamped entry
echo "[$(date '+%Y-%m-%d %H:%M')]" "$@" >> "$FILE"

echo "✓ Appended to $FILE"
