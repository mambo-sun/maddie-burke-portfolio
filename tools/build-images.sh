#!/usr/bin/env bash
#
# Maddie Burke portfolio — image pipeline
#
#   tools/build-images.sh <source> <out-dir> <name> [crop-geometry]
#
# Produces WebP + JPEG fallbacks at 640 / 1280 / 2000px wide, strips all
# metadata, and NEVER upscales — a 532px source will only ever emit a 532px
# derivative, because inventing pixels just makes a soft image bigger.
#
# Requires ImageMagick 7 (brew install imagemagick).

set -euo pipefail

SRC="${1:?usage: build-images.sh <source> <out-dir> <name> [crop]}"
OUT="${2:?missing out-dir}"
NAME="${3:?missing name}"
CROP="${4:-}"

[ -f "$SRC" ] || { echo "no such file: $SRC" >&2; exit 1; }
mkdir -p "$OUT"

# Work from a single normalised intermediate so crop and orientation are
# applied once rather than per-size.
TMP="$(mktemp -t mbimg).png"
trap 'rm -f "$TMP"' EXIT

if [ -n "$CROP" ]; then
  magick "$SRC" -auto-orient -strip -crop "$CROP" +repage "$TMP"
else
  magick "$SRC" -auto-orient -strip "$TMP"
fi

SRC_W="$(magick identify -format '%w' "$TMP")"
echo "  $NAME  source ${SRC_W}px wide${CROP:+  (cropped $CROP)}"

for W in 640 1280 2000; do
  if [ "$W" -gt "$SRC_W" ]; then
    echo "    ${W}w  skipped — would upscale"
    continue
  fi
  magick "$TMP" -resize "${W}x" -strip -quality 82 "$OUT/$NAME-$W.webp"
  magick "$TMP" -resize "${W}x" -strip -quality 84 "$OUT/$NAME-$W.jpg"
  printf '    %4sw  webp %6sB   jpg %6sB\n' "$W" \
    "$(wc -c < "$OUT/$NAME-$W.webp" | tr -d ' ')" \
    "$(wc -c < "$OUT/$NAME-$W.jpg" | tr -d ' ')"
done

# The source is not always wider than the smallest step. Emit it at native
# width so there is always at least one derivative.
if [ "$SRC_W" -lt 640 ]; then
  magick "$TMP" -strip -quality 82 "$OUT/$NAME-$SRC_W.webp"
  magick "$TMP" -strip -quality 84 "$OUT/$NAME-$SRC_W.jpg"
  printf '    %4sw  webp %6sB   jpg %6sB  (native)\n' "$SRC_W" \
    "$(wc -c < "$OUT/$NAME-$SRC_W.webp" | tr -d ' ')" \
    "$(wc -c < "$OUT/$NAME-$SRC_W.jpg" | tr -d ' ')"
fi
