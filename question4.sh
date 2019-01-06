if [ $# -eq 1 ] #Checks if the user enter one input
then
	num=$1 
	size_int=${#num}
	i=0
	while [ $i -lt $size_int ] #Splits number and adds into arr_int
	do
		arr_int[$i]="${num:$i:1}"  
		((i++))
	done
	index=0
	while [ $index -lt $size_int ]
	do
		if ! [[ "${arr_int[$index]}" =~ ^[0-9]+$ ]]  #If one of the indexes of arr_int is not a number then gives an error
		then
		echo "You must give a positive integer!"
		exit 1
		fi
	((index++))
	done 

	if [ $num -eq 1 ] || [ $num -eq 2 ] #If the input is 1 or 2, gives a warning message
	then
		echo "There isn't any prime number smaller than $1"
		exit 1
	fi
	
	#Finds the prime numbers smaller than the input and write them into prime_arr
	c=2
	j=0
	while [ $c -lt $num ]  
	do  
	flag=1  
	i=2  
		while [ $i -lt $c ]  
		do  
		a=`expr $c % $i`  
			if [ $a -eq 0 ]  
			then  
			flag=0  
			fi  
		((i++))  
		done
	  
		if [ $flag -ne 0 ]  
		then  
		prime_arr[$j]=$c
		((j++))
		fi  
	((c++)) 
	done  

	#Prints the indexes of prime_arr and the hexadecimals of them
	k=0
	size_prime=${#prime_arr[@]}
	while [ $k -lt $size_prime ]
	do
	printf '%s%d%s' "Hexadecimal of " ${prime_arr[$k]} " is: "
	printf '%x\n'  ${prime_arr[$k]}
	((k++))
	done
	exit 0

else #If the user didn't enter one input, then gives an error
	echo "You must give ONE input!" 
	exit 1
fi
