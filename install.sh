#!/bin/bash

# Simple installer for the Pomo CLI tool

# Configuration
INSTALL_DIR="$HOME/.local/bin"
SCRIPT_NAME="pomo"
REPO_URL="https://raw.githubusercontent.com/ABB00717/pomo-cli/refs/heads/master/pomo"

# Colors 
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_RED='\033[0;31m'
COLOR_RESET='\033[0m'

echo -e "${COLOR_GREEN}Starting installation of Pomo CLI...${COLOR_RESET}"

# Check for dependencies
echo "Checking for dependencies..."
if ! command -v notify-send &> /dev/null; then
    echo -e "${COLOR_RED}Error: 'notify-send' is not found.${COLOR_RESET}"
    echo "Please install it using your package manager and try again."
    exit 1
fi
echo "Dependencies met."

# Create installation directory
echo "Ensuring installation directory exists at ${INSTALL_DIR}..."
mkdir -p "$INSTALL_DIR"

# Download the script
echo "Downloading the latest script from GitHub..."
if command -v curl &> /dev/null; then
    curl -fsSL "$REPO_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"
elif command -v wget &> /dev/null; then
    wget -qO "$INSTALL_DIR/$SCRIPT_NAME" "$REPO_URL"
else
    echo -e "${COLOR_RED}Error: You need 'curl' or 'wget' to download the script.${COLOR_RESET}"
    exit 1
fi

# Make it executable
echo "Making the script executable..."
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Check if directory is in PATH and provide final instructions
echo -e "${COLOR_GREEN}Installation successful!${COLOR_RESET}"
echo "Script installed at: ${INSTALL_DIR}/${SCRIPT_NAME}"
echo ""

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "${COLOR_YELLOW}Warning: Your PATH does not seem to include ${INSTALL_DIR}.${COLOR_RESET}"
    echo "To run 'pomo' directly, please add the following line to your shell's startup file (e.g., ~/.bashrc or ~/.zshrc):"
    echo ""
    echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
    echo "Then, restart your shell or run 'source ~/.bashrc'."
else
    echo "You can now run the timer by simply typing 'pomo' in your terminal."
fi

echo "Happy focusing! (b•-•)b"
