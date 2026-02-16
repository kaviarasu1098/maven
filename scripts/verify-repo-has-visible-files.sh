#!/usr/bin/env bash
set -euo pipefail

# Count visible files in the current working tree, excluding hidden paths.
visible_files_count="$(find . -type f ! -path './.git/*' ! -name '.*' ! -path '*/.*' | wc -l | tr -d '[:space:]')"

if [[ "${visible_files_count}" -eq 0 ]]; then
  echo "ERROR: no visible files were found in the repository working tree."
  echo "This often means only placeholder dotfiles are present."
  exit 1
fi

echo "OK: found ${visible_files_count} visible file(s)."
