#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# nerd-fonts requirements
sudo apt-get install -y ruby-dev
sudo apt install -y gcc make

# Install nerd-fonts
# Define the download directory and font directory
DOWNLOAD_DIR=$HOME/Downloads
FONT_DIR=$HOME/.local/share/fonts

# Check if the font files already exist in the font directory
if [ -d "$FONT_DIR" ] && ls "$FONT_DIR" | grep -q "JetBrainsMono"; then
  echo "JetBrainsMono fonts are already installed."
else
  # Download the font archive if it doesn't exist
  if [ ! -f "$DOWNLOAD_DIR/JetBrainsMono.tar.xz" ]; then
    echo "Downloading JetBrainsMono fonts..."
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz -o "$DOWNLOAD_DIR/JetBrainsMono.tar.xz"
  else
    echo "JetBrainsMono.tar.xz already exists."
  fi
  # Extract the font archive if it hasn't been extracted yet
  tar -xvf "$DOWNLOAD_DIR/JetBrainsMono.tar.xz" -C "$DOWNLOAD_DIR"
  # Move the font files to the font directory
  if [ ! -d "$FONT_DIR" ]; then
    echo "Creating font directory..."
    mkdir -p "$FONT_DIR"
  fi
  mv $DOWNLOAD_DIR/JetBrainsMono*.ttf "$FONT_DIR/"
  # Remove compressed archive
  rm "$DOWNLOAD_DIR/JetBrainsMono.tar.xz"
  # Remove remaining uncompressed archives
  rm "$DOWNLOAD_DIR/README.md"
  rm "$DOWNLOAD_DIR/OFL.txt"
  # Update the font cache
  echo "Updating font cache..."
  fc-cache -f -v
fi

# Verify installation
echo "Verifying installation..."
fc-list | grep JetBrainsMono
