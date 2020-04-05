#!/bin/bash -x

function simulator(){

#!Declaring Variables
key=""
flips=$1
coins=$2

#!declaring Dictionary
declare -A tripletCount

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
	tripletCount[$key]=$((${tripletCount[$key]}+1))
	key=""
done

echo "All Occurrence : " ${!tripletCount[@]}
echo "All Occurrence : " ${tripletCount[@]}

#!calling calulate Percentage Function
calcPercentage

}

function calcPercentage() {
for keys in ${!tripletCount[@]}
do
		tripletCount[$keys]=$((${tripletCount[$keys]} * 100 / $flips))
done

echo "All Occurrence key : " ${!tripletCount[@]}
echo "All Occurrence Percentage: " ${tripletCount[@]}

}

#!calling function
function flipCoin()
{
	local flips=0
	read -p "Press y to play other key for Quite : " play
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
		read -p "Press 1 to play other key for Quite : " play
	done
}

#!Starting Program
flipCoin
