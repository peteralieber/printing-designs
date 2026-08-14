#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <design-name> [folder]"
  exit 1
fi

NAME="$1"
FOLDER="${2:-designs}"
SLUG="${NAME,,}"
SLUG="${SLUG//[^a-z0-9_-]/-}"
TARGET="$FOLDER/${SLUG}.scad"

mkdir -p "$FOLDER"

cat > "$TARGET" <<SCAD
/*
  ${SLUG}.scad

  Generated template for a new 3D-printed design.
  Update the dimensions and geometry to match the intended use.
*/

$fn = 48;

// Parametric design variables, in millimeters.
width = 40;
length = 60;
height = 10;
wall = 2;

module body() {
    cube([width, length, height], center = true);
}

module main() {
    body();
}

main();
SCAD

echo "Created $TARGET"
