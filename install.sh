#!/bin/bash
#
# git-qcommit installer
# Usage: curl https://raw.githubusercontent.com/jsamuel1/git-qcommit/main/install.sh | sh
#

set -e

# Configuration
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="git-qcommit"
REPO_OWNER="jsamuel1"
REPO_NAME="git-qcommit"
REPO_BRANCH="main"
SCRIPT_URL="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}/${REPO_BRANCH}/${SCRIPT_NAME}"

echo "====================================="
echo "  git-qcommit Installer"
echo "====================================="
echo ""

# Create installation directory if it doesn't exist
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating directory: $INSTALL_DIR"
    mkdir -p "$INSTALL_DIR"
fi

# Download the script
echo "Downloading git-qcommit from $SCRIPT_URL"
if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$SCRIPT_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"
elif command -v wget >/dev/null 2>&1; then
    wget -qO "$INSTALL_DIR/$SCRIPT_NAME" "$SCRIPT_URL"
else
    echo "Error: Neither curl nor wget found. Please install one of them and try again."
    exit 1
fi

# Make the script executable
echo "Making script executable"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo ""
echo "====================================="
echo "  Installation Complete!"
echo "====================================="
echo ""
echo "git-qcommit has been installed to: $INSTALL_DIR/$SCRIPT_NAME"
echo ""

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo "⚠️  WARNING: $INSTALL_DIR is not in your PATH"
    echo ""
    echo "To use git-qcommit, add the following line to your shell configuration file"
    echo "(~/.bashrc, ~/.zshrc, ~/.profile, or similar):"
    echo ""
    echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
    echo "Then reload your shell configuration or restart your terminal."
else
    echo "✓ $INSTALL_DIR is in your PATH"
    echo ""
    echo "You can now use git-qcommit by running:"
    echo "    git qcommit"
fi

echo ""
echo "For more information, visit: https://github.com/${REPO_OWNER}/${REPO_NAME}"
