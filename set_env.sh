# #!/bin/bash


# enter_secretely() {
# 	local password=""
# 	local mask="*"
# 	local show_password=0
# 	input="(Ctrl+V) $1"
# echo -n "$input" >&2
# 	while IFS= read -r -s -n1 char; do
# 	#handle delete char
# 		if [[ -z "$char" || "$char" == $'\n' ]]; then
# 			if [ $show_password -eq 1 ]; then
# 				echo -ne "\r$input" >&2
# 				echo -n "$(printf "%*s" ${#password} | tr ' ' "${mask:0:1}")" >&2
# 			fi
# 			break
# 		elif [[ "$char" == $'\x16' ]]; then  # Ctrl+V
# 			(( show_password = 1 - show_password ))
# 			echo -ne "\r$input" >&2
# 			if [ $show_password -eq 1 ]; then
# 				echo -n "$password" >&2
# 			else
# 				echo -n "$(printf "%*s" ${#password} | tr ' ' "${mask:0:1}")" >&2
# 			fi
# 		elif [[ "$char" == $'\177' ]]; then  # Backspace key
# 			if [ -n "$input" ]; then
# 				password="${password%?}"
# 				echo -ne "\b \b" >&2
# 			fi
# 		else
# 			password+="$char"
# 			if [ $show_password -eq 1 ]; then
# 				echo -n "$char" >&2
# 			else
# 				echo -n "$mask" >&2
# 			fi
# 		fi
# 	done
# 	echo "" >&2
# 	echo "$password"
# }

# read -p "Enter wordpress-database name: " val
# export DB_NAME="$val"
# echo $DB_NAME
# val=""

# while true; do
# 	read -p "Enter wordpress-database admin username: " val
# 	if [[ ! "$val" == *"admin"* ]]; then
# 	break
# 	fi
# 	echo "this username can not contain 'admin'..."
# done
# export DB_ADMIN="$val"
# val=""

# while true; do
# 	val=$(enter_secretely "Enter wordpress-database admin password: ")
# 	temp=$(enter_secretely "Enter password again: ")
#     if [ "$temp" == "$val" ]; then
# 		break
# 	fi
# 	echo "passwords do not match..."
# done
# export DB_NAME_PWD="$val"
# temp=""
# val=""

# while true; do
# 	while true; do
# 		val=$(enter_secretely "Enter wordpress-database root password: ")
# 		if [ ${#val} -lt 8 ]; then
# 			echo "Too short (minimum 8 chars)."
# 		elif ! [[ "$val" =~ [A-Z] ]]; then
# 			echo "Must have at least one uppercase letter [A-Z]."
# 		elif ! [[ "$val" =~ [a-z] ]]; then
# 			echo "Must have at least one lowercase letter [a-z]."
# 		elif ! [[ "$val" =~ [0-9] ]]; then
# 			echo "Must have at least one digit [0-9]."
# 		elif ! [[ "$val" =~ [^A-Za-z0-9] ]]; then
# 			echo "Must have at least one special character."
# 		else
# 			break
# 		fi
# 	done
# 	temp=$(enter_secretely "Enter wordpress-database root password: ")
# 	if [ "$temp" == "$val" ]; then
# 			break;
# 	fi
# 	echo "passwords do not match"
# done
# export DB_ROOT_PW="$val"
# temp=""
# val=""
