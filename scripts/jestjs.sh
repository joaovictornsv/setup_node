#!/bin/bash
JESTCONFIG="https://gist.githubusercontent.com/joaovictornsv/25b62efad70e92fc9b6fde6d0473420c/raw/f5ab37d29b05e09b3622c6367f888f0bf71b9667/jest.config.js"

WHITE="\033[1;37m";
GREEN="\033[1;32m";
RESET="\033[0m";

echo -e "\n${WHITE}> [setup] [-] Jest-JS setup initialized${RESET}\n";

echo -e "${WHITE}> [setup] [1/2] Installing dependecies...${RESET}";
# Jest
yarn add -D jest;

echo -e "${WHITE}> [setup] [2/2] Copying configuration files...${RESET}";
curl $JESTCONFIG > jest.config.js;

echo -e "\n${GREEN}> [setup] [done] Jest-JS setup finished${RESET}\n";