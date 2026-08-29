#!/usr/bin/env bash
#
# Workflow entry point: regenerate the stdlib reference pages only when the latest
# `prima` release is newer than the stored version stamp.
#
# Exit codes:
#   0  success (either up-to-date or regenerated)
#   1  failure (network / release resolution / generation error)
#
# The deploy workflow calls this with `set -e` semantics and decides whether to commit
# by checking `git diff` afterwards.
set -euo pipefail

REPO="${REPO:-TickPoints/prima-language}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STAMP_FILE="$ROOT/src/generated/version.txt"

CURRENT="$(cat "$STAMP_FILE")"

echo "resolving latest release of $REPO ..."
LATEST="$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
  | python3 -c 'import json,sys; print(json.load(sys.stdin)["tag_name"])')"

if [[ "$LATEST" == "$CURRENT" ]]; then
  echo "up-to-date (latest release $LATEST == stored $CURRENT); nothing to regenerate"
  exit 0
fi

echo "new release detected: stored $CURRENT -> latest $LATEST"
"$ROOT/scripts/generate.sh" --version "$LATEST"
echo "regenerated docs for $LATEST"
