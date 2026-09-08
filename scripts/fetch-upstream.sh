#!/usr/bin/env bash
set -euo pipefail

[[ $(git branch --show-current) == main ]] || {
  echo "Run this script from the main branch." >&2
  exit 1
}

git fetch upstream
git rebase upstream/main
git push --force-with-lease origin main
