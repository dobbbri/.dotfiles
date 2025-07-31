#!/bin/bash

echo "install ssh ------------------------------------------------------------"
# got to https://github.com/dobbbri/.ssh and Downloads repo as zip file
cd $HOME
unzip $HOME/Downloads/ssh-main.zip
mv $HOME/.ssh-main $HOME/.ssh
chmod 400 $HOME/.ssh/id_ed25519
