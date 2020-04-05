#!/bin/bash -x

function simulator(){

#!Declaring Variables
key=""
flips=$1
coins=$2

#!declaring Dictionary
declare -A doubletCount

for((i=1;i<=$flips;i++))
do
	for((j=1;j<=$coins;j++))
	do
		if(( $((RANDOM%2==0)) ))
		then
 			key+=H
		else
 			key+=T
		fi
	done
	doubletCount[$key]=$((${doubletCount[$key]}+1))
	key=""
done

echo "All Occurrence : " ${!doubletCount[@]}
echo "All Occurrence : " ${doubletCount[@]}

#!calling calulate Percentage Function
calcPercentage

}

function calcPercentage() {
for keys in ${!doubletCount[@]}
do
		doubletCount[$keys]=$((${doubletCount[$keys]} * 100 / $flips))
done

echo "All Occurrence key : " ${!doubletCount[@]}
echo "All Occurrence Percentage: " ${doubletCount[@]}

}

#!calling function
function flipCoin()
{
	local flips=0
	read -p "Press y to play other key for Quite : " play
	while [ $play == 'y' ]
	do
		read -p "Enter How Many Times You want To FlipCoin : " flips
		echo -e "Enter 1 for Single coin \nEnter 2 for Two Coins "
		read choice
		case $choice in
			1)
				simulator $flips 1
				;;
			2)
				simulator $flips 2
				;;
			*)
				echo "Invalid Option"
				;;
		esac
		read -p "Press 1 to play other key for Quite : " play
	done
}

#!Starting Program
flipCoin

