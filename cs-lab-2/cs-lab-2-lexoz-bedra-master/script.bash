#!/bin/bash

a=$1
b=$2
printf "%.0f " "$(($a + $b))"
printf "%.0f " "$(($a - $b))"
printf "%.0f " "$(($a * $b))"
if [[ $b == 0 ]]
then
	printf "#\n"
else
	printf "%.2f\n" "$((10**2 * $a / $b))e-2"
fi
