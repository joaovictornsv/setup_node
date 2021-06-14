#!/bin/bash
LINTSTAGEDRC="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/a53e244f1e61fb6bd79d036b4c54d7b771d747b5/.lintstagedrc.js"

WHITE="\033[1;37m";
GREEN="\033[1;32m";
RESET="\033[0m";

echo -e "\n${WHITE}> [setup] [-] Husky-TS setup initialized${RESET}\n";

echo -e "${WHITE}> [setup] [1/3] Installing dependecies...${RESET}";

# Husky and Lint-Staged
yarn add -D husky lint-staged

echo -e "${WHITE}> [setup] [2/3] Copying configuration files...${RESET}";

curl $LINTSTAGEDRC > .lintstagedrc.js;

echo -e "${WHITE}> [setup] [3/3] Setting husky...${RESET}";

yarn husky install .husky;
yarn husky add .husky/pre-commit 'lint-staged';
yarn husky add .husky/pre-push 'yarn test:coverage';

echo -e "\n${GREEN}> [setup] [done] Husky-TS setup finished${RESET}\n";

