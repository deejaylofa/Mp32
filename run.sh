#!/bin/bash

# Navigate to the script's directory
cd "$(dirname "$0")"

echo "=== YouTube Downloader Setup & Launch ==="

# 1. Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to path for Apple Silicon or Intel Macs
    if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "✔ Homebrew is already installed."
fi

# 2. Install Python3 and FFmpeg natively
echo "Checking/Installing Python3 and FFmpeg..."
brew install python ffmpeg

# 3. Install/Upgrade yt-dlp python package
echo "Installing Python dependencies (yt-dlp)..."
pip3 install --upgrade yt-dlp

# 4. Run the App
echo "Launching YouTube Downloader App..."
python3 app.py
