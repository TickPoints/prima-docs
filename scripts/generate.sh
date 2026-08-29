#!/usr/bin/env bash
#
# Regenerate the stdlib reference pages under src/generated/ from a `prima` binary.
#
# The stdlib is a set of embedded `.pra` signature modules; `prima doc --stdlib`
# concatenates one `# Module \`name\`` section per module. This script runs it,
# splits the output into one Markdown page per module, writes the module/builtin-class
# indexes, regenerates the mdbook SUMMARY, and stamps the producing prima version.
#
# Usage:
#   generate.sh --binary /path/to/prima [--stamp v0.3.0]   use a local binary
#   generate.sh --version v0.3.0                           download the release binary
#   generate.sh                                            latest release (query + download)
#
# Environment: REPO (default TickPoints/prima-language), TARGET (default x86_64-unknown-linux-gnu).
set -euo pipefail

REPO="${REPO:-TickPoints/prima-language}"
TARGET="${TARGET:-x86_64-unknown-linux-gnu}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$ROOT/src/generated"
BINARY=""
VERSION=""
STAMP=""

usage() {
  sed -n '2,20p' "${BASH_SOURCE[0]}"
  exit 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --binary) BINARY="$2"; shift 2 ;;
    --version) VERSION="$2"; shift 2 ;;
    --stamp) STAMP="$2"; shift 2 ;;
    -h|--help) usage ;;
    *) echo "error: unknown option $1" >&2; usage >&2 ;;
  esac
done

# Resolve the prima binary (download from a release unless --binary was given).
if [[ -n "$BINARY" ]]; then
  [[ -x "$BINARY" ]] || { echo "error: not executable: $BINARY" >&2; exit 1; }
  PRIMA_BIN="$BINARY"
  [[ -n "$STAMP" ]] || STAMP="unknown"
else
  if [[ -z "$VERSION" ]]; then
    echo "querying latest release of $REPO ..."
    VERSION="$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
      | python3 -c 'import json,sys; print(json.load(sys.stdin)["tag_name"])')"
  fi
  [[ -n "$STAMP" ]] || STAMP="$VERSION"
  ASSET="prima-${VERSION}-${TARGET}"
  BIN_DIR="$ROOT/prima-bin"
  mkdir -p "$BIN_DIR"
  PRIMA_BIN="$BIN_DIR/prima"
  if [[ ! -x "$PRIMA_BIN" ]]; then
    echo "downloading $ASSET for $VERSION ..."
    curl -fsSL -o "$PRIMA_BIN" "https://github.com/$REPO/releases/download/${VERSION}/${ASSET}"
    chmod +x "$PRIMA_BIN"
  fi
fi

echo "using prima binary: $PRIMA_BIN"
mkdir -p "$OUT_DIR"

# 1. Run the toolchain doc generator.
ALL="$OUT_DIR/_all.md"
"$PRIMA_BIN" doc --stdlib > "$ALL"

# 2. Split on `# Module \`name\`` headers into one page per module.
awk -v out="$OUT_DIR" '
  /^# Module `/ {
    if (fn != "") close(fn)
    title = $0
    name = title
    sub(/^# Module `/, "", name)
    sub(/`$/, "", name)
    slug = name
    gsub(/::/, "-", slug)
    gsub(/\//, "-", slug)
    fn = out "/" slug ".md"
    print title > fn
    next
  }
  { if (fn != "") print >> fn }
' "$ALL"
rm -f "$ALL"

# 3. Index pages: importable modules vs builtin classes (core::*).
MODULES=()
CLASSES=()
for f in "$OUT_DIR"/*.md; do
  base="$(basename "$f")"
  [[ "$base" == modules.md || "$base" == classes.md ]] && continue
  slug="${base%.md}"
  name="$(awk '/^# Module `/ { line=$0; sub(/^# Module `/, "", line); sub(/`$/, "", line); print line; exit }' "$f")"
  if [[ "$name" == core::* ]]; then
    CLASSES+=("$slug")
  else
    MODULES+=("$slug")
  fi
done

write_index() {
  local header="$1" title="$2"
  local out="$OUT_DIR/$header"
  {
    echo "# $title"
    echo
    echo "The pages under this index are **auto-generated** from the embedded stdlib"
    echo "\`.pra\` signature modules by \`prima doc --stdlib\` (see the top-level README)."
    echo
  } > "$out"
}

# First non-empty line after the `# Module` title (the module `//!` doc paragraph).
page_desc() {
  awk 'BEGIN{seen=0} !/^$/ && seen {print; exit} /^# Module/ {seen=1}' "$1"
}

write_index modules.md "Importable Modules"
echo "| Module | Description |" >> "$OUT_DIR/modules.md"
echo "|---|---|" >> "$OUT_DIR/modules.md"
for slug in "${MODULES[@]}"; do
  desc="$(page_desc "$OUT_DIR/$slug.md")"
  echo "| [\`$slug\`](./$slug.md) | $desc |" >> "$OUT_DIR/modules.md"
done

write_index classes.md "Builtin Value Classes"
echo "| Class | Description |" >> "$OUT_DIR/classes.md"
echo "|---|---|" >> "$OUT_DIR/classes.md"
for slug in "${CLASSES[@]}"; do
  desc="$(page_desc "$OUT_DIR/$slug.md")"
  echo "| [\`$slug\`](./$slug.md) | $desc |" >> "$OUT_DIR/classes.md"
done

# 4. mdbook SUMMARY.
SUMMARY="$ROOT/src/SUMMARY.md"
{
  echo "# Summary"
  echo
  echo "- [Prima Standard Library](./index.md)"
  echo "- [Generated Reference](./generated/modules.md)"
  for slug in "${MODULES[@]}"; do
    echo "  - [\`$slug\`](./generated/$slug.md)"
  done
  echo "- [Builtin Classes](./generated/classes.md)"
  for slug in "${CLASSES[@]}"; do
    echo "  - [\`$slug\`](./generated/$slug.md)"
  done
} > "$SUMMARY"

# 5. Version stamp.
printf '%s\n' "$STAMP" > "$OUT_DIR/version.txt"

echo "generated $((${#MODULES[@]} + ${#CLASSES[@]})) pages for $STAMP"
echo "modules:      ${MODULES[*]}"
echo "builtin:      ${CLASSES[*]}"
