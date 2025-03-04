#!/bin/sh

# git clone git@github.com:dobbbri/dotfiles.git
# git clone git@github.com:elisapetcare/epc_in_dev.git
# git clone git@github.com:dobbbri/elisa_pet_care_v2.git
# git clone git@github.com:dobbbri/Projects.git

echo "Add Sites Folder -----------------------------------------------------------"
if [[ ! -d //home/sdobri/Sites ]]; then
  mkdir /home/sdobri/Sites
fi

cd /home/sdobri/Sites

git clone git@github.com:dobbbri/espaco_videira_2025.git
git clone git@github.com:dobbbri/terapeuta_luciana_2025.git
git clone git@github.com:elisapetcare/epc_in_dev.git
git clone git@github.com:dobbbri/pousada_do_tucunare_2020.git
git clone git@github.com:dobbbri/elisa_pet_care_v2.git
git clone git@github.com:dobbbri/Projects.git


cd /home/sdobri
