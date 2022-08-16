#!/bin/bash

# Author : Ruturajn <nanotiruturaj@gmail.com>

# This script runs at qtile startup, it tries to update the `interface`
# paramater in the `Net` widget, used in the Qtile Bar.

# Get the username for the current user.
user=$(cat /etc/passwd | grep "/home" | cut -d : -f 1)

# Wait till there is internet, access and then update the `Net` widget.
while :; do
	ping -c 2 google.com &>/dev/null
	check_internet=$?
	if [[ "${check_internet}" == 0 ]]; then
		# interface=$(ip a | grep "2:" | awk '{print $2}' | sed 's|:||' 2>/dev/null)
		interface=$(ls /sys/class/net | grep -v "lo")
		sed -i "s|interface=\".*\"|interface=\"$interface\"|" /home/"${user}"/.config/qtile/config.py
		dunstify -i "icons8-wi-fi-24" -t 3000 "Reloading Qtile!" "Found Internet"
		sed -i 's|^.*get_ip.*||' ~/.config/qtile/autostart.sh
		qtile cmd-obj -o cmd -f reload_config
		break
	fi
	echo "Not found connection" | tee -a ~/.cache/get_ip.log
done

# Update betterlockscreen cache
dunstify -i "icons8-info-48" -t 2000 "Updating Betterlockscreen Cache"
betterlockscreen -u /usr/share/Wallpapers/Mountains.jpg
dunstify -i "icons8-info-48" -t 2000 "Betterlockscreen Cache Updated"

# Call the first_startup script
alacritty -e ~/.config/qtile/Scripts/first_startup &

echo "Task Completed Successfully" | tee -a ~/.cache/get_ip.log
