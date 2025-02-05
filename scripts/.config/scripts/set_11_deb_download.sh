#!/bin/sh

# sudo dpkg -i <pakage_name>
# https://bitwarden.com/download/
# https://github.com/shiftkey/desktop/release

cd $HOME/Downloads/
sudo apt install fonts-liberation -yy

echo "min browser --------------------------------------------------------------"
wget https://github.com/minbrowser/min/releases/download/v1.33.1/min-1.33.1-amd64.deb
sudo dpkg -i min-1.33.1-amd64.deb

echo "gitHub desktop -----------------------------------------------------------"
wget https://github.com/shiftkey/desktop/releases/download/release-3.4.8-linux1/GitHubDesktop-linux-amd64-3.4.8-linux1.deb
sudo dpkg -i GitHubDesktop-linux-amd64-3.4.8-linux1.deb

echo "microsoft edge -----------------------------------------------------------"
wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_132.0.2957.115-1_amd64.deb
sudo dpkg -i microsoft-edge-stable_132.0.2957.115-1_amd64.deb


echo "bitwarden -----------------------------------------------------------"
xdg-open https://bitwarden.com/download/

echo "sudo dpkg -i Bitwarden-202"
