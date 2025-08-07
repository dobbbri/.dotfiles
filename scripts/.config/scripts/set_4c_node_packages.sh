#!/bin/bash

# to make execurable
# chmod +x install_nodejs.sh 

echo "- Install PNPM packages --------------------------------------------------"
npm i -g pnpm
npm i -g neovim tree-sitter tree-sitter-cli npm-check-updates
npm i -g typescript typescript-language-server
npm i -g @ast-grep/cli

echo "- pnpm enable and activate ----------------------------------------------"
corepack enable
corepack prepare pnpm@latest --activate

# echo "- Fix NPM access --------------------------------------------------------"
# mkdir ~/.npm-global
# npm config set prefix "$HOME/.npm-global"
# export PATH="$HOME/.npm-global/bin:$PATH"

