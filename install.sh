#!/bin/bash
set -eo pipefail

echo "🚀 Starting Fedora environment setup..."

if ! command -v task &> /dev/null; then
    echo "📦 go-task not found. Installing from Fedora Community repo..."
    sudo dnf install -y go-task
fi

echo "🏗️  Executing Taskfile..."
task default