 while :
  do
     echo "-------------------------------------"
     echo " Main Menu "
     echo "-------------------------------------"
     echo "[1] Cipher word"
     echo "[2] Create story"
     echo "[3] Move files"
     echo "[4] Convert hexadecimal"
     echo "[5] Delete files"
     echo "[6] Exit"
     echo "======================="
     echo -n "Enter your menu choice [1-6]: "
     read yourch
     case $yourch in
        1) echo "Enter a string:" ; read str ; echo "Enter an integer:" ; read int ; ./question1.sh "$str" "$int" ;;
 	2) echo "Enter a filename for the story:" ; read str ; ./question2.sh "$str" ;;
 	3) ./question3.sh ;;
 	4) echo "Enter a number:" ; read num ; ./question4.sh "$num" ;;
 	5) 
	set -f ; echo "Enter all arguments in one line :" ; read str ; ./question5.sh $str
	set +f;;
 	6) exit 0;;
	*) echo "Opps!!! Please select choice 1,2,3,4,5 or 6";
     esac
  done
