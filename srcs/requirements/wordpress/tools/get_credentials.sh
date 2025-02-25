#!/bin/bash

while IFS='=' read -r key value; do
	if [ -n "$key" ] && [ -n "$value" ]; then
		if [ "$key" = "$1" ]; then
			echo $value
		fi
	fi
done < /run/secrets/credentials