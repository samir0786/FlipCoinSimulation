#!/bin/bash -x

#!Declaring Varibles
declare -A singletCount
H=0
T=0

#!function for Flip Coin
function flipCoin() {
read -p "Enter How Many Times You want To FlipCoin : " flips

for((i=0;i<flips;i++))
do
   if(($((RANDOM % 2)) == 1 ))
   then
       singletCount["result"$i]="Head"
         ((H++))
   else
       singletCount["result"$i]="Tails"
         ((T++))
   fi
done
echo "Heads Percentage = $(echo "scale=2; $H * 100 / $flips" | bc )"
echo "Tails Percentage =  $(echo "scale=2; $T * 100 / $flips" | bc )"

}
flipCoin
echo "All Occurrence : "${singletCount[@]}

