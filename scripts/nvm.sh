#!/bin/bash

echo "installing nvm"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

source ~/.bashrc

nvm install node
nvm install-latest-npm

npm install -g vercel
npm install -g degit
npm install -g svelte 
npm install -g rollup-plugin-svelte
npm install -g mdsvex