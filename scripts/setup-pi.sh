#!/usr/bin/env bash
# Install Pi extensions: pi-ask-user and pi-plans
set -euo pipefail

echo "=== Installing Pi extensions ==="

echo "Installing pi-ask-user..."
if pi install npm:pi-ask-user 2>&1; then
    echo "  ✓ pi-ask-user installed"
else
    echo "  ✗ pi-ask-user install failed"
    exit 1
fi

echo "Installing pi-plans..."
if pi install npm:pi-plans 2>&1; then
    echo "  ✓ pi-plans installed"
else
    echo "  ✗ pi-plans install failed"
    exit 1
fi

echo ""
echo "Done. Run '/reload' in Pi to activate extensions."
