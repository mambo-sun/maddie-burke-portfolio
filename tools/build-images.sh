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

# Every standard width at or below the source, plus the source's own width if
# it does not already coincide with one. A 1080px source therefore emits 640
# and 1080 rather than stopping at 640 and wasting half its detail.
WIDTHS=""
for W in 640 1280 2000; do
  if [ "$W" -le "$SRC_W" ]; then WIDTHS="$WIDTHS $W"; else
    echo "    ${W}w  skipped — would upscale"
  fi
done
# Native width is emitted only to FILL A GAP beneath the largest standard step
# — never to exceed it. The layout caps at 1320px, so a 4000px source has no
# use for a 4000px derivative; 2000 already covers it past 1.5x.
if [ "$SRC_W" -lt 2000 ]; then
  case " $WIDTHS " in
    *" $SRC_W "*) ;;
    *) WIDTHS="$WIDTHS $SRC_W" ;;
  esac
fi

for W in $WIDTHS; do
  magick "$TMP" -resize "${W}x" -strip -quality 82 "$OUT/$NAME-$W.webp"
  magick "$TMP" -resize "${W}x" -strip -quality 84 "$OUT/$NAME-$W.jpg"
  printf '    %4sw  webp %6sB   jpg %6sB%s\n' "$W" \
    "$(wc -c < "$OUT/$NAME-$W.webp" | tr -d ' ')" \
    "$(wc -c < "$OUT/$NAME-$W.jpg" | tr -d ' ')" \
    "$([ "$W" = "$SRC_W" ] && echo '  (native)' || echo '')"
done
