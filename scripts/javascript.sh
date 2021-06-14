#!/bin/bash
PACKAGEJSON="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/306d4d4ceedc332968483cd3ec4bb9ca96441415/package.json"
GITIGNORE="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/306d4d4ceedc332968483cd3ec4bb9ca96441415/.gitignore"
JESTCONFIG="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/f5ab37d29b05e09b3622c6367f888f0bf71b9667/jest.config.js"
LINTSTAGEDRC="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/f5ab37d29b05e09b3622c6367f888f0bf71b9667/.lintstagedrc.js"
SEQUELIZERC="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/4bc1f0d9675f3e9d27268da539176c278f3a22ee/.sequelizerc"

GREEN="\033[1;32m";
WHITE="\033[1;37m";
YELLOW="\033[1;33m";
RESET="\033[0m";

echo -e "\n${WHITE}> [setup] [-] Javascript setup initialized${RESET}\n";

echo -e "${WHITE}> [setup] [1/5] Git Init and Yarn Init${RESET}";

git init;
curl $GITIGNORE > .gitignore;

yarn init -y;
curl $PACKAGEJSON > package.json;

echo -e "${WHITE}> [setup] [2/5] Installing dependecies...${RESET}";

## INSTALLATION OF DEPENDENCIES

yarn add dotenv express;

# ESLint
yarn add -D eslint;

# Nodemon
yarn add -D nodemon;

# Jest
yarn add -D jest;

# Husky and Lint-Staged
yarn add -D husky lint-staged

echo -e "${WHITE}> [setup] [3/5] Creating src folder...${RESET}";

mkdir src;
cd src;
touch app.js;
touch server.js;
cd ..;

echo -e "${WHITE}> [setup] [4/5] Copying configuration files...${RESET}";

curl $JESTCONFIG > jest.config.js;

curl $LINTSTAGEDRC > .lintstagedrc.js;

curl $SEQUELIZERC > .sequelizerc

echo -e "${WHITE}> [setup] [5/5] Setting husky...${RESET}";

yarn husky install .husky;
yarn husky add .husky/pre-commit 'lint-staged';
yarn husky add .husky/pre-push 'yarn test:coverage';

echo -e "\n${GREEN}> [setup] [done] Javascript setup finished${RESET}\n";

echo -e "${YELLOW}Configurations remaining:
  - package.json (name)
  - ESLint${RESET}"

echo -e "\n${WHITE}Access to more informations: https://github.com/joaovictornsv/setup_node${RESET}"