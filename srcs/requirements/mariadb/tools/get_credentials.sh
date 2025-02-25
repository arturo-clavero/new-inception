#!/bin/bash

echo "searching for $1" >> mylogs.txt

while IFS='=' read -r key value; do
	if [ -n "$key" ] && [ -n "$value" ]; then
		if [ "$key" = "$1" ]; then
			echo "found $value" >> mylogs.txt
			echo $value
		fi
	fi
done < /run/secrets/credentials
