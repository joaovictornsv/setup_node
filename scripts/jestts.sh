#!/bin/bash
JESTCONFIG="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/a53e244f1e61fb6bd79d036b4c54d7b771d747b5/jest.config.ts"
BABELCONFIG="https://gist.githubusercontent.com/joaovictornsv/039bb193dac7056671916bbb13378511/raw/273b8fe74911c304c3a46cf6ff201e9adf53e36f/babel.config.js"

WHITE="\033[1;37m";
GREEN="\033[1;32m";
RESET="\033[0m";

echo -e "\n${WHITE}> [setup] [-] Jest-TS setup initialized${RESET}\n";

echo -e "${WHITE}> [setup] [1/2] Installing dependecies...${RESET}";
# Jest
yarn add -D jest @types/jest ts-jest;

# Babel
yarn add -D babel-jest @babel/core @babel/preset-env;
yarn add -D @babel/preset-typescript;
yarn add -D @babel/plugin-proposal-class-properties @babel/plugin-proposal-decorators;

echo -e "${WHITE}> [setup] [2/2] Copying configuration files...${RESET}";

curl $JESTCONFIG > jest.config.ts;

curl $BABELCONFIG > babel.config.js;

echo -e "\n${GREEN}> [setup] [done] Jest-TS setup finished${RESET}\n";
