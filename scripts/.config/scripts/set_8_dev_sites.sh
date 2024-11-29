#!/bin/sh

# git clone git@github.com:dobbbri/dotfiles.git
# git clone git@github.com:elisapetcare/epc_in_dev.git
# git clone git@github.com:dobbbri/elisa_pet_care_v2.git
# git clone git@github.com:dobbbri/Projects.git

echo "Add Sites Folder -----------------------------------------------------------"
if [[ ! -d /$HOME/Sites ]]; then
  mkdir $HOME/Sites
fi

cd $HOME/Sites

git clone git@github.com:elisapetcare/epc_in_dev.git
git clone git@github.com:dobbbri/rancho_tres_coracoes_2019.git
git clone git@github.com:dobbbri/pousada_do_tucunare_2020.git
git clone git@github.com:dobbbri/elisa_pet_care_v2.git
git clone git@github.com:dobbbri/Projects.git
