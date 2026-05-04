#!/usr/bin/env bash
#
# One-shot re-encode every video under assets/video/. Idempotent — files
# already encoded by us (marked via comment tag) are skipped.
set -euo pipefail

cd "$(dirname "$0")/.."

find assets/video -type f \( -iname '*.mp4' -o -iname '*.mov' -o -iname '*.m4v' -o -iname '*.webm' \) -print0 \
  | while IFS= read -r -d '' f; do
      bin/encode-video.sh "$f"
    done
