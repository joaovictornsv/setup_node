#!/bin/bash
LINTSTAGEDRC="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/f5ab37d29b05e09b3622c6367f888f0bf71b9667/.lintstagedrc.js";

WHITE="\033[1;37m";
GREEN="\033[1;32m";
RESET="\033[0m";

echo -e "\n${WHITE}> [setup] [-] Husky-JS setup initialized${RESET}\n";

echo -e "${WHITE}> [setup] [1/3] Installing dependecies...${RESET}";
# Husky and Lint-Staged
yarn add -D husky lint-staged

echo -e "${WHITE}> [setup] [2/3] Copying configuration files...${RESET}";

curl $LINTSTAGEDRC > .lintstagedrc.js;

echo -e "${WHITE}> [setup] [3/3] Setting husky...${RESET}";
yarn husky install .husky;
yarn husky add .husky/pre-commit 'lint-staged';
yarn husky add .husky/pre-push 'yarn test:coverage';

echo -e "\n${GREEN}> [setup] [done] Husky-JS setup finished${RESET}\n";
