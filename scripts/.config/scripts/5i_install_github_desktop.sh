#!/bin/bash

cd $HOME/Downloads/

echo "gitHub desktop -----------------------------------------------------------"

# wget -qO- "https://mirror.mwt.me//install.sh" | sudo -s
# sudo apt update && sudo apt install github-desktop

wget https://github.com/shiftkey/desktop/releases/download/release-3.4.13-linux1/GitHubDesktop-linux-amd64-3.4.13-linux1.deb

sudo dpkg -i GitHubDesktop-linux-amd64-3.4.13-linux1.deb

cd $HOME
