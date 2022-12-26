#!/bin/bash

file=myanimestats.txt
username=$(sed 1!d $file)
gender=$(sed 2!d $file)
red="\e[31m"
red_awk="\033[31m"
blue="\e[34m"
blue_awk="\033[34m"
green="\e[32m"
green_awk="\033[32m"
yellow="\e[33m"
yellow_awk="\033[33m"
magenta="\e[35m"
magenta_awk="\033[35m"
cian="\e[36m"
cian_awk="\033[36m"
get_color1=$(sed 3!d $file)
get_color2=$(sed 4!d $file)
nocolor="\033[0m"
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

list_watching=$(awk -F'|' '$2~/^w/' animes.txt | awk -v color2_awk="$color2_awk" -v color1_awk="$color1_awk" -F'|' '{print color2_awk$1color1_awk": season "$4"/"$3" episode "$6"/"$5" rating "$7"🟊 "}')
now_watching=$(awk -F'|' '$2~/^w/' animes.txt | awk -v color1_awk="$color1_awk" -F'|' '{print color1_awk" "$1}')
count_watching=$(awk -F'|' '$2~/^w/' animes.txt | wc -l)
list_plan_to_watch=$(awk -F'|' '$2~/^p/' animes.txt | awk -v color2_awk="$color2_awk" -v color1_awk="$color1_awk" -F'|' '{print color2_awk$1color1_awk": seasons "$3}')
count_plan_to_watch=$(awk -F'|' '$2~/^p/' animes.txt | wc -l)
list_completed=$(awk -F'|' '$2~/^c/' animes.txt | awk -v color2_awk="$color2_awk" -v color1_awk="$color1_awk" -F'|' '{print color2_awk$1color1_awk": seasons "$3" rating "$7"🟊 "}')
count_completed=$(awk -F'|' '$2~/^c/' animes.txt | wc -l)
list_on_hold=$(awk -F'|' '$2~/^h/' animes.txt | awk -v color2_awk="$color2_awk" -v color1_awk="$color1_awk" -F'|' '{print color2_awk$1color1_awk": season "$4"/"$3" episode "$6"/"$5" rating "$7"🟊 "}')
count_on_hold=$(awk -F'|' '$2~/^h/' animes.txt | wc -l)
list_dropped=$(awk -F'|' '$2~/^d/' animes.txt | awk -v color2_awk="$color2_awk" -v color1_awk="$color1_awk" -F'|' '{print color2_awk$1color1_awk": season "$4"/"$3" episode "$6"/"$5" rating "$7"🟊 "}')
count_dropped=$(awk -F'|' '$2~/^d/' animes.txt | wc -l)
count_total=$(($count_completed + $count_watching + $count_on_hold + $count_dropped + $count_plan_to_watch))

function repeat(){
  for ((i=0;i<$1;i++)); do
    eval ${*:2}
  done
}

function new_anime(){
	clear
	echo " "
	echo -e "$color2 Let me help you add this new anime,\n$color1 'cause you're such a$color2 baka,$color1 onii-chan"
	echo -e "$color2 Just put$color1 ?$color2 if you don't know the answer"
	echo -e "$color1 What's the sauce? Don't use'$color2|$color1'$color2"
	read -p " > " sauce
	echo -e "$color1 Haha such a weeb"
	echo -e "$color2 How many seasons does it have? $color1"
	read -p " > " seasons
	echo -e "$color2 Are you currently watching it$color1 (w)$color2,\n$color1 have u completed it already$color2 (c)$color1,\n$color2 did u dropped it$color1 (d)$color2,\n$color1 did u started it but don't wanna contine it for now$color2 (h)$color1,\n$color2 or are u planning to start watching it later$color1 (p)$color2?$color1"
	read -p " > " state
	if [ "$state" = "w" ] || [ "$state" = "h" ] || [ "$state" = "d" ] || [ "$state" = "W" ] || [ "$state" = "H" ] || [ "$state" = "D" ]
	then
		echo -e "$color2 Which season?$color1"
		read -p " > " current_season
		echo -e "$color2 How many episodes does this season have?$color1"
		read -p " > " episodes
		echo -e "$color2 Wich episode did u watched last?$color1"
		read -p " > " current_episode
		echo -e "$color2 How many 🟊 do you give to this anime?$color1"
		read -p " > " rating
	elif [ "$state" = "c" ] || [ "$state" = "C" ]
	then
		current_season="$seasons"
		episodes=0
		current_episode=0
		echo -e "$color2 How many 🟊 do you give to this anime?$color1"
		read -p " > " rating
	elif [ "$state" = "p" ] || [ "$state" = "P" ]
	then
		current_season=0
		episodes=0
		current_episode=0
		rating=0
	else
		new_anime
	fi
	echo "$sauce|$state|$seasons|$current_season|$episodes|$current_episode|$rating" >> animes.txt
	if [ "$state" = "w" ] || [ "$state" = "W" ]
	then
		echo -e "$color1 $sauce$color2 succesfully added to$color1 watching$color2 list"
	elif [ "$state" = "c" ] || [ "$state" = "C" ]
	then
		echo -e "$color1 $sauce$color2 succesfully added to$color1 completed$color2 list"
	elif [ "$state" = "p" ] || [ "$state" = "P" ]
	then
		echo -e "$color1 $sauce$color2 succesfully added to$color1 plan to watch$color2 list"
	elif [ "$state" = "h" ] || [ "$state" = "H" ]
	then
		echo -e "$color1 $sauce$color2 succesfully added to$color1 on hold$color2 list"
	elif [ "$state" = "d" ] || [ "$state" = "D" ]
	then
		echo -e "$color1 $sauce$color2 succesfully added to$color1 dropped$color2 list"
	fi
	echo -e "$color1 Do you wanna add a new anime?$color2 [y/n]"
	read -p " > " addnew
	if [ "$addnew" = "y" ] || [ "$addnew" = "Y" ]
	then
		new_anime
	else
		./myanimestats.sh
	fi
}

function edit_anime(){
	clear
	echo " "
	echo -e "$color2 uwu$color1 Here you can edit your progress of this anime:$color2"
	name=$(name "$1")
	line_number=$(line_number $name)
	if [ "$name" = "" ]
	then 
		./main.sh
	else
		echo " $name"
		echo -e "$color1 What's wrong whit this anime??"
		echo -e "$color2 Edit status$color1 (s)"
		echo -e "$color1 Edit total seasons$color2 (ts)"
		echo -e "$color2 Edit current season$color1 (cs)"
		echo -e "$color1 Edit total eps of current season$color2 (te)"
		echo -e "$color2 Edit current episode$color1 (ce)"
		echo -e "$color1 Edit rating$color2 (r)"
		echo -e "$color2 Edit name$color1 (n)"
		echo -e "$color1 Back$color2 (b)"
		read -p " > " edit
		clear
		if [ "$edit" = "s" ] || [ "$edit" = "S" ]
		then
			echo " "
			echo -e "$color1 Pwease input the new status of$color2$name"
			echo -e "$color2 Watching$color1 (w)"
			echo -e "$color1 Completed$color2 (c)"
			echo -e "$color2 On hold$color1 (h)"
			echo -e "$color1 Dropped$color2 (d)"
			echo -e "$color2 Plan to watch$color1 (p)"
			read -p " > " new_status
			if [ "$new_status" = "w" ] || [ "$new_status" = "W" ]
			then
				awk -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$2="w"} {print}' animes.txt > tmp && mv tmp animes.txt 
			elif [ "$new_status" = "c" ] || [ "$new_status" = "C" ]
			then
				awk -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$2="c"} {print}' animes.txt > tmp && mv tmp animes.txt
			elif [ "$new_status" = "h" ] || [ "$new_status" = "H" ]
			then
				awk -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$2="h"} {print}' animes.txt > tmp && mv tmp animes.txt
			elif [ "$new_status" = "d" ] || [ "$new_status" = "D" ]
			then
				awk -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$2="d"} {print}' animes.txt > tmp && mv tmp animes.txt
			elif [ "$new_status" = "p" ] || [ "$new_status" = "P" ]
			then
				awk -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$2="p"} {print}' animes.txt > tmp && mv tmp animes.txt
			fi
			edit_other "$list_watching"
			./main.sh
		elif [ "$edit" = "ts" ] || [ "$edit" = "Ts" ] || [ "$edit" = "TS" ]
		then
			echo " "
			echo -e "$color1 How many seasons does$color2$name$color1 have?$color2"
			read -p " > " new_total_seasons
			awk -v new_total_seasons="$new_total_seasons" -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$3=new_total_seasons} {print}' animes.txt > tmp && mv tmp animes.txt
			./main.sh
		elif [ "$edi" = "cs" ] || [ "$edit" = "Cs" ] || [ "$edit" = "CS" ]
		then
			echo -e "$color1 Wich season are u currently watching?$color2"
			read -p " > " new_current_season
			awk -v new_current_season="$new_current_season" -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$4=new_current_season} {print}' animes.txt > tmp && mv tmp animes.txt
			./main.sh
		elif [ "$edit" = "te" ] || [ "$edit" = "Te" ] || [ "$edit" = "TE" ]
		then
			echo " "
			echo -e "$color1 How many episodes does the season you're currently watching have?$color2"
			read -p " > " new_total_episodes
			awk -v new_total_episodes="$new_total_episodes" -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$5=new_total_episodes} {print}' animes.txt > tmp && mv tmp animes.txt
			./main.sh
		elif [ "$edit" = "ce" ] || [ "$edit" = "Ce" ] || [ "$edit" = "CE" ]
		then
			echo " "
			echo -e "$color1 Wich episode did you watched last time?$color2"
			read -p " > " new_current_episode
			awk -v new_current_episode="$new_current_episode" -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$6=new_current_episode} {print}' animes.txt > tmp && mv tmp animes.txt
			./main.sh
		elif [ "$edit" = "r" ] || [ "$edit" = "R" ]
		then
			echo " "
			echo -e "$color1 How much 🟊 do you give to$color2$name$color1?$color2"
			read -p " > " new_rating
			awk -v new_rating="$new_rating" -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$7=new_rating} {print}' animes.txt > tmp && mv tmp animes.txt
			./main.sh
		elif [ "$edit" = "n" ] || [ "$edit" = "N" ]
		then
			echo " "
			echo -e "$color1 Do you thimk you have the right to change the name of an anime now???"
			echo -e "$color2 Ok fine. But only this time!!"
			echo -e "$color1 What new name do you wanna give to$color2$name$color1?$color2"
			read -p " > " new_name
			awk -v new_name="$new_name" -v line_number="$line_number" -F'|' 'NR==line_number{OFS=FS;$1=new_name} {print}' animes.txt > tmp && mv tmp animes.txt
			./main.sh
		elif [ "$edit" = "b" ] || [ "$edit" = "B" ]
		then
			./main.sh
		fi	
	fi
}

function edit_other(){
	echo -e "$color1 Do you wanna edit something else?$color2 [y/n]"
	read -p " > " edit_other
	if [ "$edit_other" = "y" ] || [ "$edit_other" = "Y" ]
	then 
		edit_anime "$1"
	elif [ "$edit_other" = "n" ] || [ "$edit_other" = "N" ]
	then 
		./main.sh
	fi
}

function name(){
	echo -e "$1" | fzf --ansi | cut -d'|' -f1
}

function line_number(){
	grep -n "$1" animes.txt | grep -Eo '^[^:]+'
}

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

function settings(){
	clear
	echo " "
	echo -e "$color1 Something wrong$color2 onii-chan?"
	echo -e "$color2 Watcha wanna change?"
	echo -e "$color1 Username$color2 (u)"
	echo -e "$color2 Gender$color1 (g)"
	echo -e "$color1 Color1$color2 (1)"
	echo -e "$color2 Color2$color1 (2)"
	echo -e "$color1 Stats$color2 (s)"
	read -p " > " setting
	if [ "$setting" = "u" ] || [ "$setting" = "U" ]
	then
		echo -e "$color1 So u lied to me!!"
		echo -e "$color2 What's your$color1 real$color2 name then??$color1"
		read -p " > " new_username
		awk  -v new_username="$new_username" -F';' 'NR==1{$1=new_username} {print}' myanimestats.txt > tmp && mv tmp myanimestats.txt
		echo -e "$color2 Ok then,$color1 $new_username"
	elif [ "$setting" = "g" ] || [ "$setting" = "G" ]
	then
		echo -e "$color1 Do you even have a gender?"
		echo -e "$color2 Waifu$color1 (w)"
		echo -e "$color1 Husbando$color2 (h)"
		read -p " > " new_gender
		if [ "$new_gender" = "w" ] || [ "$new_gender" = "W" ]
		then
			gndr="waifu"
		elif [ "$new_gender" = "h" ] || [ "$new_gender" = "H" ]
		then
			gndr="husbando"
		fi
		awk -v gndr="$gndr" -F';' 'NR==2{$1=gndr} {print}' myanimestats.txt > tmp && mv tmp myanimestats.txt
		echo -e "$color1 I knew it from the beginning"
	elif [ "$setting" = "1" ]
	then
		choose_color
		new_color1="$new_color"
		color1="$color_new"
		awk -v new_color1="$new_color1" -F';' 'NR==3{$1=new_color1} {print}' myanimestats.txt > tmp && mv tmp myanimestats.txt
		echo -e "$color1 Color changed"
		sleep 1
		./main.sh
	elif [ "$setting" = "2" ]
	then
		choose_color
		new_color2="$new_color"
		color2="$color_new"
		awk -v new_color2="$new_color2" -F';' 'NR==4{$1=new_color2} {print}' myanimestats.txt > tmp && mv tmp myanimestats.txt
		echo -e "$color2 Color changed"
		sleep 1
		./main.sh
	elif [ "$setting" = "s" ] || [ "$setting" = "S" ]
	then
		echo -e "$color1 Show now watching list on the right side\n of the stats screen?$color2 [Y/N]"
		read -p " > " stats_now_watching
		if [ "$stats_now_watching" = "y" ] || [ "$stats_now_watching" = "Y" ]
		then
			show_now_watching=1
			awk -v show_now_watching="$show_now_watching" -F';' 'NR==5{$1=show_now_watching} {print}' myanimestats.txt > tmp && mv tmp myanimestats.txt
			./main.sh
		elif [ "$stats_now_watching" = "n" ] || [ "$stats_now_watching" = "N" ] 
		then
			show_now_watching=0
			awk -v show_now_watching="$show_now_watching" -F';' 'NR==5{$1=show_now_watching} {print}' myanimestats.txt > tmp && mv tmp myanimestats.txt
			./main.sh
		fi
	fi
}

function choose_color(){
	echo -e "$color1 Please choose a color:"
	echo -e "$red red (r)"
	echo -e "$blue blue (b)"
	echo -e "$green green (g)"
	echo -e "$yellow yellow (y)"
	echo -e "$magenta magenta (m)"
	echo -e "$cian cian (c)$color2"
	read -p " > " choose_new_color
	if [ "$choose_new_color" = "r" ] || [ "$choose_new_color" = "R" ]
	then
		new_color="r"
		color_new="\e[31m"
	elif [ "$choose_new_color" = "b" ] || [ "$choose_new_color" = "B" ]
	then
		new_color="b"
		color_new="\e[34m"
	elif [ "$choose_new_color" = "g" ] || [ "$choose_new_color" = "G" ]
	then
		new_color="g"
		color_new="\e[32m"
	elif [ "$choose_new_color" = "y" ] || [ "$choose_new_color" = "Y" ]
	then
		new_color="y"
		color_new="\e[33m"
	elif [ "$choose_new_color" = "m" ] || [ "$choose_new_color" = "M" ]
	then
		new_color="m"
		color_new="\e[35m"
	elif [ "$choose_new_color" = "c" ] || [ "$choose_new_color" = "C" ]
	then
		new_color="c"
		color_new="\e[36m"
	fi
}

clear
echo " "
echo -e "$color1 Ohayo $color2$username$color1-chan"
echo -e "$color2 Did you watched anime today??"
echo -e "$color1 Choose wisely:"
echo -e "$color1 (w)$color2 Watching $color1$count_watching"
echo -e "$color2 (c)$color1 Completed $color2$count_completed"
echo -e "$color1 (p)$color2 Plan to watch $color1$count_plan_to_watch"
echo -e "$color2 (h)$color1 On hold $color2$count_on_hold"
echo -e "$color1 (d)$color2 Dropped $color1$count_dropped"
echo -e "$color2 (a)$color1 Add new anime"
echo -e "$color1 (t)$color2 Stats"
echo -e "$color2 (s)$color1 Settings"
echo -e "$color1 (q)$color2 Quit $color1:("
echo -e "$color1 What would you like to do today,$color2 onii-chan?"
echo -e "$color2 Or perhaps do you want to do$color1 me instead?"
read -p " > " choice

if [ "$choice" = "w" ] || [ "$choice" = "W" ]
then
	edit_anime "$list_watching"
elif [ "$choice" = "c" ] || [ "$choice" = "C" ]
then
	edit_anime "$list_completed"
elif [ "$choice" = "p" ] || [ "$choice" = "P" ]
then
	edit_anime "$list_plan_to_watch"
elif [ "$choice" = "h" ] || [ "$choice" = "H" ]
then
	edit_anime "$list_on_hold"
elif [ "$choice" = "d" ] || [ "$choice" = "D" ]
then
	edit_anime "$list_dropped"
elif [ "$choice" = "a" ] || [ "$choice" = "A" ]
then
	new_anime
elif [ "$choice" = "q" ] || [ "$choice" = "Q" ]
then
	echo -e "$nocolor"
	exit
elif [ "$choice" = "t" ] || [ "$choice" = "T" ]
then
	if [ "$show_now_watching" = "0" ]
	then 
		stats
	else
		paste <(stats) <(now_watching) | column -t -s $'\t'
	fi
	echo -e "$nocolor"
elif [ "$choice" = "s" ] || [ "$choice" = "S" ]
then
	settings
else
	./main.sh
fi

# made on arch btw
