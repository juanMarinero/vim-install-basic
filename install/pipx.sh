#!/bin/bash

# vim: set ts=2 sts=2 sw=2 expandtab tw=0 :

# Check if pipx is installed (either in PATH or as a Python module)
if command -v pipx &> /dev/null || \
  python3 -c "import pipx; exit(0)" &> /dev/null; then
    echo "pipx is already installed"
    return 0 2>/dev/null || exit 0
fi

# Install pipx
# https://www.howtogeek.com/install-python-apps-with-pipx/
sudo apt update && sudo apt install -y python3-venv python3-pip
sudo apt install -y pipx

# Make sure that pipx is hooked into our path, so that pipx installed apps will
# launch the same way all others do
pipx ensurepath
