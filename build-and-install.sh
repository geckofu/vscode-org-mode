#!/bin/bash
set -e

echo "Building extension..."
docker compose up --build

echo ""
echo "Installing extension..."
cursor --install-extension dist/org-mode-*.vsix --force

echo ""
echo "✓ Done! Reload VSCode to activate the updated extension."
echo "  Run: Cmd+Shift+P → 'Developer: Reload Window'"
