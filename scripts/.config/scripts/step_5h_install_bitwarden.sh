#!/bin/bash

cd $HOME/Downloads/

echo "bitwarden -----------------------------------------------------------"
wget https://github.com/bitwarden/clients/releases/download/desktop-v2025.7.0/Bitwarden-2025.7.0-amd64.deb

sudo dpkg -i Bitwarden-2025.7.0-amd64.deb

cd $HOME
