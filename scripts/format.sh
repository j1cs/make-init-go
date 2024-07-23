#!/usr/bin/env bash

# ANSI escape sequences for setting text colors and styles
RED="\033[0;31m"
WHITE="\033[0;37m"
NOCOLOR="\033[0m"
BOLD=$(tput bold)
NORMAL=$(tput sgr0)


# Format your Go code
GOFMT=$(gofmt -l -w ./ 2>&1)

# Check if the command failed
if [ $? -ne 0 ]; then
    echo -e "${RED}${BOLD}Failed to format your Go code with gofmt:${NORMAL}${NOCOLOR}"
    echo -e "${RED}$GOFMT${NOCOLOR}"
    exit 1
fi

# Use goimports on your Go code
GOIMPORTS=$(go run golang.org/x/tools/cmd/goimports -l -w ./ 2>&1)

# Check if the command failed
if [ $? -ne 0 ]; then
    echo -e "${RED}${BOLD}Failed to format your Go code with goimports:${NORMAL}${NOCOLOR}"
    echo -e "${RED}$GOIMPORTS${NOCOLOR}"
    exit 1
fi

echo -e "${GREEN}${BOLD}Successfully formatted your Go code!${NORMAL}${NOCOLOR}"
