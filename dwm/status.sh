#!/bin/bash

# Author: Joshua Royar
# Description: Status bar for dwm

# Define colors

setcolors() {
    color1=#ffffff
    color2=#ffffff
    color3=#ffffff
    color4=#ffffff
    color5=#ffffff
    color6=#ffffff
    color7=#ffffff
    color8=#ffffff
    color9=#ffffff
    color10=#ffffff
    color11=#ffffff
    color12=#ffffff
    color13=#ffffff
    color14=#ffffff
    color15=#ffffff
}

setcolors_wal() {
    color1=$(sed -n 1,1p $HOME/.cache/wal/colors)
    color2=$(sed -n 2,2p $HOME/.cache/wal/colors)
    color3=$(sed -n 3,3p $HOME/.cache/wal/colors)
    color4=$(sed -n 4,4p $HOME/.cache/wal/colors)
    color5=$(sed -n 5,5p $HOME/.cache/wal/colors)
    color6=$(sed -n 6,6p $HOME/.cache/wal/colors)
    color7=$(sed -n 7,7p $HOME/.cache/wal/colors)
    color8=$(sed -n 8,8p $HOME/.cache/wal/colors)
    color9=$(sed -n 9,9p $HOME/.cache/wal/colors)
    color10=$(sed -n 10,10p $HOME/.cache/wal/colors)
    color11=$(sed -n 11,11p $HOME/.cache/wal/colors)
    color12=$(sed -n 12,12p $HOME/.cache/wal/colors)
    color13=$(sed -n 13,13p $HOME/.cache/wal/colors)
    color14=$(sed -n 14,14p $HOME/.cache/wal/colors)
    color15=$(sed -n 15,15p $HOME/.cache/wal/colors)
    if [ -e ~/.cache/wal/colors ]; then
        usingwal=true
    else
        usingwal=false
    fi
}

setcolors_cmd() {
    setcolorcmd1="^c${color1}^"
    setcolorcmd2="^c${color2}^"
    setcolorcmd3="^c${color3}^"
    setcolorcmd4="^c${color4}^"
    setcolorcmd5="^c${color5}^"
    setcolorcmd6="^c${color6}^"
    setcolorcmd7="^c${color7}^"
    setcolorcmd8="^c${color8}^"
    setcolorcmd9="^c${color9}^"
    setcolorcmd10="^c${color10}^"
    setcolorcmd11="^c${color11}^"
    setcolorcmd12="^c${color12}^"
    setcolorcmd13="^c${color13}^"
    setcolorcmd14="^c${color14}^"
    setcolorcmd15="^c${color15}^"
}

# Define items

bar_time() {
    echo "|  $(date +%H:%M)"
}

bar_date() {
    echo "|  $(date +%d/%m/%Y)"
}

bar_battery() {
    if [ -e "/sys/class/power_supply/BAT0/capacity" ]; then
        echo "|  $(cat /sys/class/power_supply/BAT0/capacity)%"
    elif [ -e "/sys/class/power_supply/BAT1/capacity" ]; then
        echo "|  $(cat /sys/class/power_supply/BAT1/capacity)%"
    fi
}

bar_volume(){
	vol=$(pamixer --get-volume | awk '{ print $1 }')
	mute=$(pamixer --get-mute)	
	if [[ "$mute" -eq "1" ]]; then
		icon= #mute icon
	else
		if [[ "$vol" -lt "40" ]]; then
			icon=
		elif [[ "$vol" -gt "40" && "$vol" -lt "70" ]]; then
			icon=奔
		elif [[ "$vol" -gt "70" ]]; then
			icon=墳
		fi
	fi

	echo "| $icon $vol%"
}

bar_wifi() {
    echo "|  $(awk '{$1=$1/1024000; print $1"B";}' /sys/class/net/[ew]*/statistics/tx_bytes | sed 's/.*\(....\)/\1/' | sed "s|B|B/s |")"
}

bar_memory() {
    echo "|  $(echo $(free -h --giga | awk '/^Mem/ {print $3}')B)"
}

# bar_storage() {
#    echo "}  "
# }

bar_cpu_temp() {
    if [ -e "/usr/bin/sensors" ]; then
        echo "|  $(sensors | grep "temp1" | sed 's/(.*//' | sed "s/temp1.//" | sed -r 's/\s+//g' | awk '{ print $1 }')"
    fi
}

bar_base() {
    sleeptime=6
}

print_bar() {
    xsetroot -name "${setcolorcmd1}$(bar_cpu_temp) ${setcolorcmd2}$(bar_memory) ${setcolorcmd3}$(bar_wifi) ${setcolorcmd4}$(bar_volume) ${setcolorcmd5}$(bar_battery) ${setcolorcmd6}$(bar_date) ${setcolorcmd7}$(bar_time)"
    if [ "$usingwal" == "true" ]; then
        if [ "$color1" = "$(sed 1,1p $HOME/.cache/wal/colors)" ]; then
            a=$a
        else
            setcolors_wal && setcolors_cmd
        fi
    fi
    sleep $sleeptime
    print_bar
}

bar_base

setcolors

if [ -e "~/.cache/wal/colors" ]; then
    setcolors_wal
fi

setcolors_cmd

print_bar
