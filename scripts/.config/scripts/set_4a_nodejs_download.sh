#!/bin/sh
# to make execurable
# chmod +x install_nodejs.sh 


echo "- Dowload NodeJs installer -----------------------------------------------"
if [[ ! -d /home/sdobri/.nvm ]]; then
  mkdir /home/sdobri/.nvm
fi

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# download and install Node.js (you may need to restart the terminal)
exit
