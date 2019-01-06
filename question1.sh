#Controls the number of arguments.If there are not two arguments program gives error.Else it takes arguments as string and integer
if [ $# -ne 2 ]
then
	echo "You should give two inputs!"
	exit 1
else
	string=$1
	number=$2
fi
#Takes sizes of arguments
size_str=${#string}
size_int=${#number}

i=0
j=0
k=0
while [ $i -lt $size_int ]
do
	arr_int[$i]="${number:$i:1}"  #Splits number and adds into arr_int
	((i++))
done
index=0
while [ $index -lt $size_int ]
do
	if ! [[ "${arr_int[$index]}" =~ ^[0-9]+$ ]]  #If indexes of arr_int are not a number then it gives error
	then
        echo "You must give a positive integer for second input!" 
	exit 1 
	fi
((index++))
done 

if [ $size_str -eq $size_int ]    #Checks whether if the sizes of the inputs are equal, then add the indexes of second input to the first input's letters' ascii code to get the new string
then
	while [ $j -lt $size_str ]
	do
	ascii=$(echo -n "${string:$j:1}" | od -An -tuC)
	intIndex=arr_int[$j]
		#Checks if the first input has only letters in between A-Z or a-z by characters' ascii codes
		if [ $ascii -ge 62 ] && [ $ascii -le 90 ]
		then
		ascii=$(( ascii + intIndex )) 
			if [ $ascii -gt 90 ]
			then
			ascii=$(( ascii - 26))
			fi
		elif [ $ascii -ge 97 ] && [ $ascii -le 122 ]
		then
		ascii=$(( ascii + intIndex ))
			if [ $ascii -gt 122 ]
			then
			ascii=$(( ascii - 26))
			fi
		else
		echo "Your first input can have only letters!"
		exit 1
		fi
	arr_str[$j]=$(printf "\x$(printf %x $ascii)")
	((j++))
	done
	
elif [ $size_int -eq 1 ]  #Checks whether if the second input is a one-digit positive number, then add that number to the first input's letters' ascii code to get the new string
then
	while [ $k -lt $size_str ]
	do
	ascii=$(echo -n "${string:$k:1}" | od -An -tuC)
		#Checks if the first input has only letters in between A-Z or a-z by characters' ascii codes
		if [ $ascii -ge 62 ] && [ $ascii -le 90 ]
		then
		ascii=$(( ascii + number ))
			if [ $ascii -gt 90 ]
			then
			ascii=$(( ascii - 26))
			fi
		elif [ $ascii -ge 97 ] && [ $ascii -le 122 ]
		then
		ascii=$(( ascii + number ))
			if [ $ascii -gt 122 ]
			then
			ascii=$(( ascii - 26))
			fi
		else
		echo "Your first input can have only letters!"
		exit 1
		fi
	arr_str[$k]=$(printf "\x$(printf %x $ascii)")
	((k++))
	done

elif [ $size_int -ne 1 ] && [ $size_int -ne $size_str ] #Checks if the sizes of the inputs are different and the second input is not a one-digit number and then gives an error
then
	echo "String and integer must be the same size or integer must be one digit!"
	exit 1
fi
#If there is no error, program will print the new string
newStr=$(printf '%s' "${arr_str[@]}") 
echo "new string is $newStr"
exit 0
