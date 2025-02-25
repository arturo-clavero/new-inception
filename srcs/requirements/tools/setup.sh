#!/bin/bash

create_dir() {
    if [ ! -d "$1" ]; then
        sudo mkdir -p "$1"
        echo "Directory '$1' created."
    fi
}


set_value() {
	if [ ! -f "$1" ]; then
		sudo touch "$1"
		echo "File '$1' created."
	fi
	if [ -f "$1" ]; then
		sudo chmod 644 ./srcs/.env
		echo "Appending 'hello' to the file..."
		echo "hello" >> $1
	else
		echo "File '$1' does not exist or cannot be accessed!"
	fi
	grep -qE "^$2[[:space:]]*$" $1 && sed -i "/^$2[[:space:]]*$/d" $1 && echo deleted existing "1"
	grep -qE "^DOMAIN_NAME=" ./srcs/.env && "Deleted existing '$2'"
	grep -qE "^${2%?}[[:space:]]*$" $1 && sed -i "/^${2%?}[[:space:]]*$/d" $1 && echo deleted existing "1"
}
create_dir /home/artclave/data/database
create_dir /home/artclave/data/website
set_value ./srcs/.env DOMAIN_NAME=
