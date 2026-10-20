#!/bin/bash

# Navigate to the script's directory
cd "$(dirname "$0")"

echo "=== YouTube Downloader Setup & Launch ==="

# 1. Ensure Homebrew is loaded into PATH if it exists on the Mac
if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# 2. Check if Homebrew is installed after path loading
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Load Homebrew paths again post-installation
    if [ -f /opt/homebrew/bin/brew ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -f /usr/local/bin/brew ]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "✔ Homebrew is detected."
fi

# 3. Install Python3 and FFmpeg natively
echo "Checking/Installing Python3 and FFmpeg..."
brew install python ffmpeg

# 4. Install/Upgrade yt-dlp using python3 module syntax (safer on macOS)
echo "Installing Python dependencies (yt-dlp)..."
python3 -m pip install --upgrade yt-dlp

# 5. Run the App
echo "Launching YouTube Downloader App..."
python3 app.py
