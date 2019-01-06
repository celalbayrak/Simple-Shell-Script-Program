if [ $# -ne 0 ] #Checks if the user enter an input
then
	echo "You should not give an input!"
	exit 1
fi
if ! [ -d writable ] #If there isn't a directory with the name 'writable', then create it under the current directory
then
	mkdir writable
fi
count=$(find -maxdepth 1 -type f -perm -u+w | wc -l) #Count the files with write permission for user
mv $(find -maxdepth 1 -type f -perm -u+w ) writable #Move the files with write permisson for user under the current directory to 'writable' directory

echo "$count file(s) moved to writable directory."
exit 0
