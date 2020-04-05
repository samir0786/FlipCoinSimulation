#!/bin/bash -x

function flipCoin() {
   if [ $((RANDOM%2)) -eq 1 ]
   then
      echo "heads"
   else
      echo "Tails"
   fi
}
flipCoin

