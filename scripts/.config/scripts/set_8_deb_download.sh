#!/bin/bash

# sudo dpkg -i <pakage_name>
# https://bitwarden.com/download/
# https://github.com/shiftkey/desktop/release

cd $HOME/Downloads/
sudo apt install fonts-liberation -yy

echo "librewolf browser --------------------------------------------------------"
sudo apt update && sudo apt install extrepo -y
sudo extrepo enable librewolf
sudo apt update && sudo apt install librewolf -y

# echo "min browser --------------------------------------------------------------"
# wget https://github.com/minbrowser/min/releases/download/v1.33.1/min-1.33.1-amd64.deb
# sudo dpkg -i min-1.33.1-amd64.deb

# echo "gitHub desktop -----------------------------------------------------------"
# wget https://github.com/shiftkey/desktop/releases/download/release-3.4.8-linux1/GitHubDesktop-linux-amd64-3.4.8-linux1.deb
# sudo dpkg -i GitHubDesktop-linux-amd64-3.4.8-linux1.deb

echo "microsoft edge -----------------------------------------------------------"
wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_132.0.2957.115-1_amd64.deb
sudo dpkg -i microsoft-edge-stable_132.0.2957.115-1_amd64.deb

echo "lazygit -----------------------------------------------------------"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
chmod +x lazygit
sudo mv lazygit /usr/local/bin/

echo "bitwarden -----------------------------------------------------------"
xdg-open https://bitwarden.com/download/

echo "sudo dpkg -i Bitwarden-202"

# to set Min as your default browser.
# sudo xdg-settings set default-web-browser min.desktop && sudo update-alternatives --config x-www-browser 
