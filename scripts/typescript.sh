#!/bin/bash
PACKAGEJSON="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/85097bcd93b24cbc94b2e13547712a60fcacf8f4/package.json"
GITIGNORE="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/306d4d4ceedc332968483cd3ec4bb9ca96441415/.gitignore"
TSCONFIG="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/273b8fe74911c304c3a46cf6ff201e9adf53e36f/tsconfig.json"
JESTCONFIG="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/a53e244f1e61fb6bd79d036b4c54d7b771d747b5/jest.config.ts"
BABELCONFIG="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/273b8fe74911c304c3a46cf6ff201e9adf53e36f/babel.config.js"
LINTSTAGEDRC="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/a53e244f1e61fb6bd79d036b4c54d7b771d747b5/.lintstagedrc.js"

GREEN="\033[1;32m";
WHITE="\033[1;37m";
YELLOW="\033[1;33m";
RESET="\033[0m";

echo -e "\n${WHITE}> [setup] [-] Typescript setup initialized${RESET}\n";

echo -e "${WHITE}> [setup] [1/5] Git Init and Yarn Init${RESET}";

git init;
curl $GITIGNORE > .gitignore;

yarn init -y;
curl $PACKAGEJSON > package.json;


## INSTALLATION OF DEPENDENCIES

echo -e "${WHITE}> [setup] [2/5] Installing dependecies...${RESET}";

# Dependencies
yarn add dotenv express reflect-metadata;
yarn add -D @types/express;

# Typescript
yarn add -D typescript ts-node-dev tsconfig-paths;

# ESLint
yarn add -D eslint;

# Jest
yarn add -D jest @types/jest ts-jest;

# Babel
yarn add -D babel-jest @babel/core @babel/preset-env;
yarn add -D @babel/preset-typescript;
yarn add -D @babel/plugin-proposal-class-properties @babel/plugin-proposal-decorators;

# Husky and Lint-Staged
yarn add -D husky lint-staged


echo -e "${WHITE}> [setup] [3/5] Creating src folder...${RESET}";

mkdir src;
cd src;
touch app.ts;
touch server.ts;
cd ..;

echo -e "${WHITE}> [setup] [4/5] Copying configuration files...${RESET}";

echo "dist
*.config.ts" > .eslintignore;

yarn tsc --init;
curl $TSCONFIG > tsconfig.json;

curl $JESTCONFIG > jest.config.ts;

curl $BABELCONFIG > babel.config.js;

curl $LINTSTAGEDRC > .lintstagedrc.js;


echo -e "${WHITE}> [setup] [5/5] Setting husky...${RESET}";

yarn husky install .husky;
yarn husky add .husky/pre-commit 'lint-staged';
yarn husky add .husky/pre-push 'yarn test:coverage';

echo -e "\n${GREEN}> [setup] [done] Typescript setup finished${RESET}\n";

echo -e "${YELLOW}Configurations remaining:
  - package.json (name)
  - ESLint${RESET}"

echo -e "\n${WHITE}Access to more informations: https://github.com/joaovictornsv/setup_node${RESET}"
