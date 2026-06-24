#!/bin/bash
# Reasonix Go 一键安装脚本
# 用法: curl -fsSL https://raw.githubusercontent.com/Katsro/reasonix-go-dist/main/install.sh | bash

set -e

REPO="Katsro/reasonix-go-dist"
BIN_NAME="reasonix"
CMD_NAME="reasonixgo"
TMP_DIR=$(mktemp -d)

cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

# 检测架构和 OS
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
case "$ARCH" in
    arm64|aarch64) ARCH="arm64" ;;
    x86_64|amd64)  ARCH="amd64" ;;
    *) echo "Unsupported arch: $ARCH"; exit 1 ;;
esac
case "$OS" in
    linux|darwin) ;;
    *) echo "Unsupported OS: $OS"; exit 1 ;;
esac

# 下载二进制
BIN_URL="https://github.com/$REPO/releases/latest/download/reasonix-${OS}-${ARCH}"
echo "Downloading $BIN_URL ..."
curl -fsSL "$BIN_URL" -o "$TMP_DIR/$BIN_NAME"
chmod +x "$TMP_DIR/$BIN_NAME"

# 安装
INSTALL_DIR="${HOME}/.local/bin"
mkdir -p "$INSTALL_DIR"
mv "$TMP_DIR/$BIN_NAME" "$INSTALL_DIR/$BIN_NAME"

# 创建全局快捷命令
SYMLINK_PATH="$INSTALL_DIR/$CMD_NAME"
ln -sf "$INSTALL_DIR/$BIN_NAME" "$SYMLINK_PATH"

echo ""
echo "✅ Installed: $INSTALL_DIR/$BIN_NAME"
echo "✅ Command:   $CMD_NAME"
echo ""
echo "Make sure $INSTALL_DIR is in your PATH:"
echo "  export PATH=\"$INSTALL_DIR:\$PATH\""
echo ""
echo "Test: $CMD_NAME --version"
