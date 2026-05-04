#!/usr/bin/env bash
#
# Encode a video for web delivery on melix.cl:
#   - max 720p (preserves aspect ratio, never upscales)
#   - H.264 high profile, CRF 28 (small file, fine for muted hover loops)
#   - audio stripped (we never play sound)
#   - faststart (so playback can begin before full download)
#   - all input metadata wiped, then a marker tag added so the pre-commit
#     hook can skip files we've already encoded
#
# Usage: bin/encode-video.sh <path-to-video>
# Replaces the file in place.
#
# Requires: ffmpeg (brew bundle)
set -euo pipefail

input="${1:?usage: encode-video.sh <path>}"

if [ ! -f "$input" ]; then
  echo "not a file: $input" >&2
  exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1 || ! command -v ffprobe >/dev/null 2>&1; then
  cat >&2 <<'ERR'
ffmpeg/ffprobe not found. Install with:

    brew bundle

(or: brew install ffmpeg)
ERR
  exit 1
fi

marker="melix-encoded-v1"

existing_marker="$(
  ffprobe -v error -show_entries format_tags=comment \
    -of default=noprint_wrappers=1:nokey=1 "$input" 2>/dev/null || true
)"
if [ "$existing_marker" = "$marker" ]; then
  echo "already encoded: $input"
  exit 0
fi

tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT
tmp="$tmp_dir/out.mp4"

before="$(du -h "$input" | cut -f1)"
echo "encoding: $input ($before)"

ffmpeg -y -hide_banner -loglevel error -i "$input" \
  -vf "scale='min(720,iw)':'-2'" \
  -c:v libx264 -profile:v high -crf 28 -preset medium \
  -an \
  -movflags +faststart \
  -pix_fmt yuv420p \
  -map_metadata -1 \
  -metadata comment="$marker" \
  "$tmp"

mv "$tmp" "$input"
trap - EXIT
rm -rf "$tmp_dir"

after="$(du -h "$input" | cut -f1)"
echo "done:     $input ($after)"
