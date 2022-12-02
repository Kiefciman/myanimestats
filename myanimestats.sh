#!/bin/bash

file=myanimestats.txt
username=$(sed 1!d $file)
gender=$(sed 2!d $file)
red='\e[31m'
red_awk="\033[31m"
nocolor='\033[0m'
green='\e[32m'
green_awk="\033[32m"
yellow='\e[33m'
yellow_awk="\033[33m"
blue='\e[34m'
blue_awk="\033[34m"
magenta='\e[35m'
magenta_awk="\033[35m"
cian='\e[36m'
cian_awk="\033[36m"
get_color1=$(sed 3!d $file)
get_color2=$(sed 4!d $file)
show_now_watching=$(sed 5!d $file)

if [ "$get_color1" = "b" ] || [ "$get_color1" = "B" ]
then 
	color1="$blue"
	color1_awk="$blue_awk"
elif [ "$get_color1" = "r" ] || [ "$get_color1" = "R" ]
then
	color1="$red"
	color1_awk="$red_awk"
elif [ "$get_color1" = "g" ] || [ "$get_color1" = "G" ]
then
	color1="$green"
	color1_awk="$green_awk"
elif [ "$get_color1" = "y" ] || [ "$get_color1" = "Y" ]
then
	color1="$yellow"
	color1_awk="$yellow_awk"
elif [ "$get_color1" = "m" ] || [ "$get_color1" = "M" ]
then
	color1="$magenta"
	color1_awk="$magenta_awk"
elif [ "$get_color1" = "c" ] || [ "$get_color1" = "C" ]
then
	color1="$cian"
	color1_awk="$cian_awk"
fi

if [ "$get_color2" = "b" ] || [ "$get_color2" = "B" ]
then 
	color2="$blue"
	color2_awk="$blue_awk"
elif [ "$get_color2" = "r" ] || [ "$get_color2" = "R" ]
then
	color2="$red"
	color2_awk="$red_awk"
elif [ "$get_color2" = "g" ] || [ "$get_color2" = "G" ]
then
	color2="$green"
	color2_awk="$green_awk"
elif [ "$get_color2" = "y" ] || [ "$get_color2" = "Y" ]
then
	color2="$yellow"
	color2_awk="$yellow_awk"
elif [ "$get_color2" = "m" ] || [ "$get_color2" = "M" ]
then
	color2="$magenta"
	color2_awk="$magenta_awk"
elif [ "$get_color2" = "c" ] || [ "$get_color2" = "C" ]
then
	color2="$cian"
	color2_awk="$cian_awk"
fi

now_watching=$(awk -F'|' '$2~/^w/' animes.txt | awk -v color1_awk="$color1_awk" -F'|' '{print color1_awk" "$1}')
count_watching=$(awk -F'|' '$2~/^w/' animes.txt | wc -l)
count_plan_to_watch=$(awk -F'|' '$2~/^p/' animes.txt | wc -l)
count_on_hold=$(awk -F'|' '$2~/^h/' animes.txt | wc -l)
count_dropped=$(awk -F'|' '$2~/^d/' animes.txt | wc -l)
count_completed=$(awk -F'|' '$2~/^c/' animes.txt | wc -l)
count_total=$(($count_completed + $count_watching + $count_on_hold + $count_dropped + $count_plan_to_watch))

function stats(){
	clear
	echo " "
	echo -e "$color1 Weeb name:$color2 $username$color1-chan    "
	echo -e "$color2 Gender:$color1 $gender"
	echo -e "$color1 Total animes:$color2 $count_total"
	echo -e "$color2 Watching:$color1 $count_watching"
	echo -e "$color1 Completed:$color2 $count_completed$color1"
	echo -e "$color2 On hold:$color1 $count_on_hold"
	echo -e "$color1 Dropped:$color2 $count_dropped$color1"
	echo -e "$color2 Plan to watch:$color1 $count_plan_to_watch"
}

function now_watching(){
	echo " "
	echo -e "$color2 Now watching:"
	echo -e "$now_watching" | cut -d'|' -f1
}

if [ $username = 'a' ]
then
	clear
	read -p "What's your name, onii-chan? " username
	echo "Ohayo $username-chan"
	read -p "Are you a weabo, $username-chan? [Y/N] " weeb
	if [ $weeb = 'y' ] || [ $weeb = 'Y' ]
	then
		echo -e "${red}Time to take a bath you stinky weeb${nocolor}"
		read -p "Are you a waifu or a husbando? [W/H] " get_gender
		if [ "$get_gender" = "w" ] || [ "$gender" = "W" ]
		then
			gender="waifu"
		elif [ "$get_gender" = "h" ] || [ "$get_gender" = "H" ]
		then
			gender="husbando"
		fi
		echo "Please choose 2 colors"
		echo -e "${red}(r)red$blue (b)blue$green (g)green$yellow (y)yellow$magenta (m)magenta$cian (c)cian$nocolor"
		read -p "Color 1 [r/b/g/y/m/c]: " color1
		read -p "Color 2 [r/b/g/y/m/c]: " color2
		sed -i '1i\'"$username" $file
		sed -i '2i\'"$gender" $file
		sed -i '3i\'"$color1" $file
		sed -i '4i\'"$color2" $file
		echo "Profile created. Please run the script again"
	elif [ $weeb = 'n' ] || [ $weeb = 'N' ]
	then
		echo "Ara ara sayonara"
	else
		echo "Sussy baka, you spelled that wrong"
	fi
else
	while getopts 's' OPTION; do
		case "$OPTION" in
			s) if [ "$show_now_watching" = "0" ]
			then
				stats
			else
				paste <(stats) <(now_watching) | column -t -s $'\t'
			fi
			echo -e "$nocolor " ;;
		esac
	done
	if (( $OPTIND == 1 )); then
		./main.sh
fi
shift "$((OPTIND -1))"
fi
