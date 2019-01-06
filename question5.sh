if [ $# -eq 1 ] #Checks if the user enters one input, then search only in the current directory
then
	in=$1
	str=$(find -maxdepth 1 -type f -name "$in")
	if [[ -z $in ]] #Checks if the input is null, if it is then gives an error
	then
		echo "You can't enter a null input!"
		exit 1
	fi
	if [[ -z $str ]] #Checks if the input exists, if it doesn't then gives an error
	then
		echo "There isn't a file whose name obeys your wildcard!"
		exit 1
	fi
	

elif [ $# -eq 2 ] #Checks if the user enters two inputs, then search both the current directory and all of its subdirectories
then
	in=$1
	di=$2
	if ! [ -d $2 ] #Checks if the second input is a directory, if it isn't then gives an error
	then	
		echo "Second input must be a directory!"
		exit 1
	elif [ -d $2 ]
	then
		str=$(find "$di" -type f -name "$in")
	fi
	if [[ -z $str ]] #Checks if the first input exists, if it doesn't then gives an error
	then
		echo "There isn't a file whose name obeys your wildcard!"
		exit 1
	fi
	

else #If the user didn't enter one input, then gives an error
	echo "You must enter one or two inputs!"
	exit 1
fi
#Finds the files obey the wildcard and ask the user to delete them
counter=0
for line in $str
do
	echo "Do you want to delete $line ? (y/n) "
	read ans
		if [ $ans = "y" ] || [ $ans = "Y" ]
		then
			rm $line
			echo "$line deleted"
			((counter++))
			echo "$counter file(s) removed"
		elif [ $ans = "n" ] || [ $ans = "N" ]
		then
			echo "Not removed"
		else
			echo "Invalid answer!"
		fi
done
