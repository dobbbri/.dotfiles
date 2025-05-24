#!/bin/sh

# git clone git@github.com:dobbbri/dotfiles.git
# git clone git@github.com:elisapetcare/epc_in_dev.git
# git clone git@github.com:dobbbri/elisa_pet_care_v2.git
# git clone git@github.com:dobbbri/Projects.git

echo "Add Sites Folder -----------------------------------------------------------"
mkdir -p /home/sdobri/Sites

cd /home/sdobri/Sites

git clone git@github.com:dobbbri/blog.git
git clone git@github.com:dobbbri/videira_blog_2025.git
git clone git@github.com:dobbbri/espaco_videira_2025.git
git clone git@github.com:dobbbri/terapeuta_luciana_2025.git
git clone git@github.com:elisapetcare/epc_in_dev.git
git clone git@github.com:dobbbri/pousada_do_tucunare_2020.git
git clone git@github.com:dobbbri/elisa_pet_care_v2.git
git clone git@github.com:dobbbri/Projects.git

cd /home/sdobri
