#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <input.scad> [output.png]"
  exit 1
fi

INPUT="${1}"
OUTPUT="${2:-${INPUT%.scad}.png}"

mkdir -p "$(dirname "$OUTPUT")"

echo "Rendering $INPUT -> $OUTPUT"
openscad -o "$OUTPUT" "$INPUT"
