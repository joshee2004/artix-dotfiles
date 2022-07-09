#!/bin/bash

# Author: Joshua Royar
# Description: Status bar for dwm

# Define colors

source "$HOME/.cache/wal/colors.sh"

setcolors() {
    if [ -e "$HOME/.cache/wal/colors.sh" ]; then
        color1=${color1}
        color2=${color2}
        color3=${color3}
        color4=${color4}
        color5=${color5}
        color6=${color6}
        color7=${color7}
        color8=${color8}
        color9=${color9}
        color10=${color10}
        color11=${color11}
        color12=${color12}
        color13=${color13}
        color14=${color14}
        color15=${color15}
        usingwal=true
    else
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
    echo -e "|  $(date +%H:%M)"
}

bar_date() {
    echo -e "|  $(date +%d/%m/%Y)"
}

bar_battery() {
    if [ -e "/sys/class/power_supply/BAT0/capacity" ]; then
        capacity=$(cat /sys/class/power_supply/BAT0/capacity)
    elif [ -e "/sys/class/power_supply/BAT1/capacity" ]; then
        capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    else
        capacity=0
    fi

    if [[ $capacity -lt 10 ]]; then
        icon=
    elif [[ $capacity -gt 10 && $capacity -lt 20 ]]; then
        icon=
    elif [[ $capacity -gt 20 && $capacity -lt 30 ]]; then
        icon=
    elif [[ $capacity -gt 30 && $capacity -lt 40 ]]; then
        icon=
    elif [[ $capacity -gt 40 && $capacity -lt 50 ]]; then
        icon=
    elif [[ $capacity -gt 50 && $capacity -lt 60 ]]; then
        icon=
    elif [[ $capacity -gt 60 && $capacity -lt 70 ]]; then
        icon=
    elif [[ $capacity -gt 70 && $capacity -lt 80 ]]; then
        icon=
    elif [[ $capacity -gt 80 && $capacity -lt 90 ]]; then
        icon=
    elif [[ $capacity -gt 90 ]]; then
         icon=
    else
         icon=NULL
    fi

    echo -e "| $icon $capacity%"
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

	echo -e "| $icon $vol%"
}

bar_wifi() {
    echo -e "|  $(awk '{$1=$1/1024000; print $1"B";}' /sys/class/net/[ew]*/statistics/tx_bytes | sed 's/.*\(....\)/\1/' | sed "s|B|B/s |")"
}

bar_memory() {
    echo -e "|  $(echo $(free -h --giga | awk '/^Mem/ {print $3}')B)"
}

# TODO - script to display storage
# bar_storage() {
#    echo -e "|  "
# }

bar_cpu_temp() {
    if [ -e "/usr/bin/sensors" ]; then
        echo -e "|  $(sensors | grep "temp1" | sed 's/(.*//' | sed "s/temp1.//" | sed -r 's/\s+//g' | awk '{ print $1 }')"
    fi
}

bar_base() {
    sleeptime=6
}

print_bar() {
    xsetroot -name "${setcolorcmd1}$(bar_cpu_temp) ${setcolorcmd2}$(bar_memory) ${setcolorcmd3}$(bar_wifi) ${setcolorcmd4}$(bar_volume) ${setcolorcmd5}$(bar_battery) ${setcolorcmd6}$(bar_date) ${setcolorcmd7}$(bar_time)"
    if [[ "$usingwal" == "true" ]]; then
        if [[ "$color1" = "$(sed 1,1p $HOME/.cache/wal/colors.sh)" ]]; then
            a=$a
        else
            setcolors_cmd
        fi
    fi
    sleep $sleeptime
    print_bar
}

bar_base

setcolors

setcolors_cmd

print_bar
