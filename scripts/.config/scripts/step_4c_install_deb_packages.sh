#!/bin/bash

cd $HOME/Downloads/

echo "obsidian -------------------------------------------------------------------"
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.9.12/obsidian_1.9.12_amd64.deb
sudo dpkg -i obsidian_1.9.12_amd64.deb

echo "fastfetch -------------------------------------------------------------------"
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.49.0/fastfetch-linux-amd64.deb
sudo dpkg -i fastfetch-linux-amd64.deb

# echo "microsoft edge -----------------------------------------------------------"
# wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_132.0.2957.115-1_amd64.deb
# sudo dpkg -i microsoft-edge-stable_132.0.2957.115-1_amd64.deb

echo "lazygit -----------------------------------------------------------"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
chmod +x lazygit
sudo mv lazygit /usr/local/bin/

# echo "bitwarden -----------------------------------------------------------"
# xdg-open https://bitwarden.com/download/
# # https://github.com/bitwarden/clients/releases
#
# wget https://github.com/bitwarden/clients/releases/download/desktop-v2025.7.0/Bitwarden-2025.7.0-amd64.deb
#
# sudo dpkg -i Bitwarden-2025.7.0-amd64.deb

# to set Min as your default browser.
# sudo xdg-settings set default-web-browser min.desktop && sudo update-alternatives --config x-www-browser 

# A script to print out images of pokemon to the terminal
# git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git
# cd pokemon-colorscripts
# sudo ./install.sh
#
#
# cd $HOME/Downloads/

# echo "librewolf browser --------------------------------------------------------"
# sudo apt install fonts-liberation -yy
# sudo apt update && sudo apt install extrepo -y
# sudo extrepo enable librewolf
# sudo apt update && sudo apt install librewolf -y

# echo "min browser --------------------------------------------------------------"
# wget https://github.com/minbrowser/min/releases/download/v1.33.1/min-1.33.1-amd64.deb
# sudo dpkg -i min-1.33.1-amd64.deb

# echo "gitHub desktop -----------------------------------------------------------"
# wget -qO - https://mirror.mwt.me/shiftkey-desktop/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/mwt-desktop.gpg > /dev/null
# sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/mwt-desktop.gpg] https://mirror.mwt.me/shiftkey-desktop/deb/ any main" > /etc/apt/sources.list.d/mwt-desktop.list'
#
# sudo apt update && sudo apt install github-desktop
