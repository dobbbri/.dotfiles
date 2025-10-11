#!/bin/bash

# https://helium.computer/

sudo apt install wget

sudo rm /usr/local/bin/helium

wget helium-0.5.2.1-x86_64.AppImage
chmod u+x helium-0.5.2.1-x86_64.AppImage
sudo mv helium-0.5.2.1-x86_64.AppImage /usr/local/bin/helium

