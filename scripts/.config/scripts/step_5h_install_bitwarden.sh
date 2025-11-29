#!/bin/bash

cd $HOME/Downloads/

echo "bitwarden -----------------------------------------------------------"
wget https://github.com/bitwarden/clients/releases/download/desktop-v2025.11.2/Bitwarden-2025.11.2-amd64.deb

sudo dpkg -i Bitwarden-2025.11.2-amd64.deb

cd $HOME
