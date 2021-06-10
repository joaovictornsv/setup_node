#!/bin/bash
# Bash Menu Script Example
BLUE="\033[1;34m";
YELLOW="\033[1;33m";
WHITE="\033[1;37m";
RESET="\033[0m";

echo 'Please choose your template: '
PS3='> '
options=("Typescript" "Javascript" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Typescript")
            echo -e "\n${WHITE}Starting${RESET} ${BLUE}Typescript${RESET}${WHITE} setup...${RESET}\n" && /home/joaov/Codes/Terminal/setup_shell/typescript.sh && break
            ;;
        "Javascript")
            echo -e "\n${WHITE}Starting${RESET} ${YELLOW}Javascript${RESET}${WHITE} setup...${RESET}\n" && /home/joaov/Codes/Terminal/setup_shell/javascript.sh && break
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option" && break;;
    esac
done