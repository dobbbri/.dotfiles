#!/bin/bash

# https://helium.computer/

sudo apt install wget

sudo rm /usr/local/bin/helium

wget https://github.com/imputnet/helium-linux/releases/download/0.5.8.1/helium-0.5.8.1-x86_64.AppImage
chmod u+x helium-0.5.8.1-x86_64.AppImage
sudo   mv helium-0.5.8.1-x86_64.AppImage /usr/local/bin/helium

