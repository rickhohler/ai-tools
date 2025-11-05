#!/usr/bin/env bash
set -euo pipefail

if [ "${1-}" = "" ]; then
  echo "Usage: scripts/setup-project.sh /absolute/path/to/project [project_domain] [central_docs_override]"
  exit 1
fi

PROJECT_PATH="$1"
PROJECT_NAME="$(basename "$PROJECT_PATH")"
PROJECT_DOMAIN="${2-}"
CENTRAL_DOCS_DEFAULT="$HOME/CODE/GITHUB/ai-tools/docs"
CENTRAL_DOCS="${3-$CENTRAL_DOCS_DEFAULT}"

TEMPLATES_DIR="$(cd "$(dirname "$0")/.." && pwd)/templates"

copy_and_customize() {
  src="$1"
  dest="$2"
  cp "$src" "$dest"

  # macOS sed requires the empty string after -i
  sed -i '' "s|__CENTRAL_DOCS__|$CENTRAL_DOCS|g" "$dest"
  sed -i '' "s|__PROJECT_NAME__|$PROJECT_NAME|g" "$dest"
  sed -i '' "s|__PROJECT_PATH__|$PROJECT_PATH|g" "$dest"
  sed -i '' "s|__PROJECT_DOMAIN__|$PROJECT_DOMAIN|g" "$dest"
  # Leave __ADDITIONAL_RULES__ as-is for manual project customization
}

mkdir -p "$PROJECT_PATH"

copy_and_customize "$TEMPLATES_DIR/WARP.md.template" "$PROJECT_PATH/WARP.md"
copy_and_customize "$TEMPLATES_DIR/.cursorrules.template" "$PROJECT_PATH/.cursorrules"
copy_and_customize "$TEMPLATES_DIR/.continue-config.template" "$PROJECT_PATH/.continue-config"

echo "✓ Installed AI tools templates into $PROJECT_PATH"
echo ""
echo "Next steps:"
echo "1) Edit WARP.md, .cursorrules, and .continue-config to replace __ADDITIONAL_RULES__ with project-specific rules."
echo "2) Confirm __PROJECT_DOMAIN__ is set appropriately. If blank, rerun with a domain value."
