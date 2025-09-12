#!/bin/bash

echo "Generate new ssh key ------------------------------------------------------------"
cd $HOME

# generate a new SSH key on your local machine
ssh-keygen -t ed25519 -C "sergiodobri@gmail.com"

# Add your SSH private key to the ssh-agent.
ssh-add $HOME/.ssh/id_ed25519

# Adding a new SSH key to your github account
cat ~/.ssh/id_ed25519.pub | xclip -selection clipboard

echo "the contents of the id_ed25519.pub file copied to your clipboard, add to to your github account"


# chmod 400 $HOME/.ssh/id_ed25519
