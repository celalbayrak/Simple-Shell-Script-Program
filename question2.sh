if [ $# -eq 1 ] #Checks if the user enter one input
then
	if [ -e "$(pwd)/giris.txt" ] && [ -e "$(pwd)/gelisme.txt" ] && [ -e "$(pwd)/sonuc.txt" ] #Checks whether if all the txt files we need are exist
	then
		file="$(pwd)/giris.txt" #Read the first text and write the lines of it into an array
		i=0
		while IFS="" read -r p || [ -n "$p" ]
		do
			if [ "$p" != "" ]
			then
			arr_giris[$i]=$p
			((i++))
			fi
		done <"$file"


		file="$(pwd)/gelisme.txt" #Read the second text and write the lines of it into an array
		j=0
		while IFS="" read -r p || [ -n "$p" ]
		do
			if [ "$p" != "" ]
			then
			arr_gelisme[$j]=$p
			((j++))
			fi
		done <"$file"


		file="$(pwd)/sonuc.txt" #Read the third text and write the lines of it into an array
		k=0
		while IFS="" read -r p || [ -n "$p" ]
		do
			if [ "$p" != "" ]
			then
			arr_sonuc[$k]=$p
			((k++))
			fi
		done <"$file"
		#Create three random numbers
		random1=$((RANDOM % 3 ))
		random2=$((RANDOM % 3 ))
		random3=$((RANDOM % 3 ))

		file=$1
		if [ -e "$file" ]
		then
			echo "$file exists. Do you want it to be modified? (y/n):" #If there is a file with the same name, ask the user to modify it
			read ans
				if [ $ans = "y" ] || [ $ans = "Y" ] #If 'yes', select a line in every text randomly and create a story in that file
				then
				{
				echo -e "${arr_giris[$random1]}\n
				${arr_gelisme[$random2]}\n
				${arr_sonuc[$random3]}"
				} >$file
				echo -e "A random story is created and stored in $file"
				exit 0
				elif [ $ans = "n" ] || [ $ans = "N" ] #If 'no', terminate
				then
				echo "$file did not to be modified"
				exit 0
				else #If the user enters an answer other than yes or no, then give an error
				echo "Invalid answer!"
				exit 1
				fi
				
		else #If the file doesn't exist, select a line in every text randomly and create a story in a new file
				{
				echo -e "${arr_giris[$random1]}\n
				${arr_gelisme[$random2]}\n
				${arr_sonuc[$random3]}"
				} >$file
		echo -e "A random story is created and stored in $file"
		exit 0
		fi
	else #If one or more files we need are missing, then give an error
		echo "One or more files doesn't exist under current directory."
		exit 1
	fi
else #If the user didn't enter one input, then give an error
	echo "You must enter ONE input for the name of file you want to create!"
	exit 1
fi		


