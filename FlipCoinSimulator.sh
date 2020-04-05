#!/bin/bash -x 


function simulator() {
#!Declaring Variables
flips=$1
coins=$2

#!declaring Dictionary
declare -A coinFacesDict

#!outer loop for number of Flips
for((i=1;i<=$flips;i++))
do
	#!inner loop for number of Coins
	for((j=1;j<=$coins;j++))
	do
		if(( $((RANDOM%2==0)) ))
		then
			#!append value in Key
 			key+=H
		else
 			key+=T
		fi
	done
	#!storing value in key and increment occurrence
	coinFacesDict[$key]=$((${coinFacesDict[$key]}+1))
	#!making key blank for next iteration
	key=""
done

echo "All Occurrence of Key : " ${!coinFacesDict[@]}
echo "All Occurrence of Values: " ${coinFacesDict[@]}

#!calling calulate Percentage Function
calcPercentage
}

#!function to calculate Percentage
function calcPercentage() {
for keys in ${!coinFacesDict[@]}
do
		coinFacesDict[$keys]=$(echo "scale=2;${coinFacesDict[$keys]} * 100 / $flips" | bc ) 
done

echo "Key : " ${!coinFacesDict[@]}
echo "Percentage : " ${coinFacesDict[@]}
sortFunction
}

#!Sorting Function
function sortFunction() {
	echo "Winning Key and Occurrence Percentage"
	for i in ${!coinFacesDict[@]}
	do
		echo -e "$i = ${coinFacesDict[$i]}"
	done | sort -k3 -rn | head -n 1
}

#!Main Function
function flipCoin()
{
	local flips=0
	read -p "Do You want To Play [Y / N]: " play
	while [ $play == 'y' ]
	do
		read -p "Enter How Many Times You want To FlipCoin : " flips
		echo -e "Enter 1 for Single coin \nEnter 2 for Two Coins \nEnter 3 for Three Coins "
		read choice
		case $choice in
			1)
				simulator $flips 1
				;;
			2)
				simulator $flips 2
				;;
			3)
				simulator $flips 3
				;;
			*)
				echo "Invalid Option"
				;;
		esac
	read -p "Do You Want To Countinue [y / N]: " play
	done
}

#!Starting Program
flipCoin
