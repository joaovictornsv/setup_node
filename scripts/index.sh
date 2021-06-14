#!/bin/bash
PATH=/home/joaov/Codes/Terminal/setup_node/scripts/
ARRAY=('_typescript_' '_javascript_' '_jestjs_' '_jestts_' '_huskyjs_' '_huskyts_');
LIBS=()

WHITE="\033[1;37m";
GREEN="\033[1;32m";
RESET="\033[0m";
RED="\033[1;31m";

for param in $@; do
  lib=$(echo ${param}  | cut -d'-' -f 3)
  if ! [[ "${ARRAY[@]}" =~ "_${lib}_" ]];
  then
    echo -e "${RED}> Error: ${lib} not exists in setup core${RESET}"; break;
  else
    LIBS+=($lib)
  fi;
done;

if [[ ${#LIBS[@]} -eq 0 ]];
  then echo -e "${RED}> Error: No libs provided for setup${RESET}"

else
  echo -e "${WHITE}Libs to install and config:${RESET}"
  for lib in ${LIBS[@]}; do
    echo -e "${GREEN} - $lib ${RESET}";
  done;

  echo -e -n "${WHITE}Continue? ${RESET}"
  read decision;
  if [ "${decision,,// /}" = 'yes' ] || [ "${decision,,// /}" =  'y' ];
  then
    echo -e "${GREEN}Installing...${RESET}";
    for lib in ${LIBS[@]}; do
      $PATH$lib.sh
    done;
  else
    echo 'Aborting...';
  fi;
fi;