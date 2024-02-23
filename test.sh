#!/bin/bash

#"python script.py <number_in_string> <number_of_strings> <range_start> <range_end> <quote>"
if [ "$#" -ne 3 ]; then
	    echo "./test <number_in_string> <number_of_tests> <max_oprations>"
			exit 1
fi

numbers=$1
strings=$2
beginning=$((-1 * $1))
end=$1
quote="\""
max_op=$3

pct=0
mid=0
ind=0
max=-1
min=-1
max_set=""
min_set=""
ind=0
ok="OK"

while [ $ind -lt "$strings" ]
do
	combination=$(python3 ./gen_numbers.py "$numbers" "1" "$beginning" "$end")
	ind=$((ind + 1))
	echo $combination
	num=$(../push_swap $combination | wc -l)
	if [ $num -le $max_op ]
	then
		echo -e "\e[34m$num\e[0m"
	else
		pct=$(($pct + 1))
		echo -e "\e[31m$num\e[0m"
	fi

	if [ $num -gt $max ]
	then
		max=$num
		max_set=$combination
	fi
	if [ $min -eq -1 ] || [ $num -lt $min ]
	then
		min=$num
		min_set=$combination
	fi

	res=$(../push_swap $combination | ../checker_linux $combination)
	if [ "$res" == "OK" ]
	then
		echo -e "\e[32m$res\e[0m"  # prints in green
	else
		ok=$res
		echo -e "\e[31m$res\e[0m"  # prints in red
	fi
	echo ""

	mid=$mid+$num
done

echo "MID => $((mid / ind))"

if [ $max -le $max_op ]
then
	echo -e "MAX => \e[34m$max\e[0m"
else
	echo -e "MAX => \e[31m$max\e[0m" 
fi

echo "MIN => $min"

if [ "$ok" == "OK" ]
then
	echo -e "\e[32m$ok\e[0m"  # prints in green
else
	echo -e "\e[31m$ok\e[0m"  # prints in red
fi
echo -e "FAILS PCT => \e[31m$(($pct * 100 / $2))%\e[0m"
echo -e "MAX_SET => \n $max_set"
echo -e "MIN_SET => \n $min_set"
echo "" 

