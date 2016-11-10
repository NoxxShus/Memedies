#!/bin/bash


declare -i count
declare -i admin


menuSelect=""
temp=""


uname=""
paswrd=""


enterName=""
enterPass=""


count=0
admin=0


cont=""
contAdd=""
contNum=""
contPass=""
contAdmin=""


contGet=""
contNumSet=""

<<<<<<< HEAD
invToPay=""
invWithName=""
=======
invoice=""
inv=""
>>>>>>> refs/remotes/NoxxShus/master


echo sup


while (($count == 0))
do
	echo -------------------------------------
<<<<<<< HEAD
	echo \|Welcome to the Group Login Program \|
	echo -------------------------------------
	echo \|Please enter your username\:       \|
=======
	echo \|"Welcome to the Group Login Program "\|
	echo -------------------------------------
	echo \|"Please enter your username:        "\|
>>>>>>> refs/remotes/NoxxShus/master
	echo -------------------------------------
	read uname


	enterName=$(grep "$uname" ~/Desktop/scripts/udata/user_list.txt)


	echo -------------------------------------
<<<<<<< HEAD
	echo \|Please enter your password\:       \|
=======
	echo \|"Please enter your password:        "\|
>>>>>>> refs/remotes/NoxxShus/master
	echo -------------------------------------
	read paswrd


	if [ "$enterName" ];
    	then
    	echo $enterName > ~/Desktop/scripts/udata/temp.txt
    	enterPass=$(awk '{print $4}' ~/Desktop/scripts/udata/temp.txt)
    	if [ "$enterPass" = "$paswrd" ];
        	then
    	clear
        	echo \| '\t' '\t' '\s' '\s' '\s'Welcome $uname
        	echo -------------------------------------
		clear
        	count=1


    	else
<<<<<<< HEAD
        	echo \|Sorry, wrong password.             \|
=======
        	echo \|"Sorry, wrong password.             "\|
>>>>>>> refs/remotes/NoxxShus/master
    		echo -------------------------------------
    	fi


    
	else
    clear
<<<<<<< HEAD
    	echo \|Sorry, that user does not exist.   \|
=======
    	echo \|"Sorry, that user does not exist.   "\|
>>>>>>> refs/remotes/NoxxShus/master
    	echo -------------------------------------
	clear
	fi
done


count=0




while (($count == 0))
do

clear

echo -------------------------------------
<<<<<<< HEAD
echo -e\| '\t'Commands available to you    \|
=======
echo \|"     Commands available to you    "\|
>>>>>>> refs/remotes/NoxxShus/master
echo -------------------------------------


admin=$(awk '{print $6}' ~/Desktop/scripts/udata/temp.txt)
if [ $admin = "1"  ];     
    	then         	
    	{
<<<<<<< HEAD
        	echo \|1. Create user                     \|
        	echo \|2. Change password                 \|
        	echo \|3. Generate invoice                \|
        	echo \|4. Add contacts to device          \|
        	echo \|5. Place call                      \|
        	echo \|6. Check device call log           \|
        	echo \|7. Check contacts                  \|
		echo -------------------------------------
		if grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt ; then
		echo -------------------------------------
		echo \|You have an invoice due.           \|
=======
        	echo \|"1. Create user                    "\|
        	echo \|"2. Change password                "\|
        	echo \|"3. Generate invoice               "\|
        	echo \|"4. Add contacts to device         "\|
        	echo \|"5. Place call                     "\|
        	echo \|"6. Check device call log          "\|
        	echo \|"7. Check contacts                 "\|
>>>>>>> refs/remotes/NoxxShus/master
		echo -------------------------------------
		echo
        	echo Please enter the number of the menu you wish to enter

		else
		echo Please enter the number of the menu you wish to enter
		fi
    	read menuSelect
    
    case $menuSelect in
    1)
    while (($count == 0))
    do
	echo -------------------------------------
<<<<<<< HEAD
    	echo \|Please enter user name\:           \|
=======
    	echo \|"Please enter user name\:           "\|
>>>>>>> refs/remotes/NoxxShus/master
	echo -------------------------------------
    	read contAdd
    
	echo -------------------------------------
<<<<<<< HEAD
    	echo \|Please enter user password\:       \|
=======
    	echo \|"Please enter user password\:       "\|
>>>>>>> refs/remotes/NoxxShus/master
	echo -------------------------------------
    	read contPass


	echo -------------------------------------
<<<<<<< HEAD
    	echo \|Is User an admin? 1\/0\:           \|
=======
    	echo \|"Is User an admin? 1\/0\:           "\|
>>>>>>> refs/remotes/NoxxShus/master
	echo -------------------------------------
    	read contAdmin
    	
	if [ $(echo "$contPass" | tr -dc "[;digit;]") ]; then
		if [ $(echo "$contPass" | tr -dc "[;lower;]") ]; then
			if [ $(echo "$contPass" | tr -dc "[;upper;]") ]; then
    	cont="Username\s" $contAdd "\s password \s" $contPass "\s admin \s" $contAdmin "\n"
   	 
    	 $cont >> ~/Desktop/scripts/udata/user_list.txt
   	 touch ~/Desktop/scripts/udata/call_log/"$contAdd.txt"
   	 touch ~/Desktop/scripts/udata/contacts/"$contAdd.txt"
   	 touch ~/Desktop/scripts/udata/invoice/"$contAdd.txt"
	 		else
   			{
          		    	echo invalid password, please use capitals, lowercase, and numbers.
   			}
           		fi
		else
   		{
          		   echo invalid password, please use capitals, lowercase, and numbers.
   		}
           	fi
	else
   	{
          	echo invalid password, please use capitals, lowercase, and numbers.
   	}
        fi
	
	done
	count=0
   
    ;;
    2)
    temp=$uname
    while (($count == 0))
    do
<<<<<<< HEAD
        	echo \|Please enter the username\:        \|
=======
        	echo \|"Please enter the username\:        "\|
>>>>>>> refs/remotes/NoxxShus/master
		echo -------------------------------------
        	read uname  
    
        	enterName=$(grep "$uname"  ~/Desktop/scripts/udata/user_list.txt)
    
   	 
    
   	 if [ "$enterName" ];
        	then
   	 {
   		 echo -------------------------------------
<<<<<<< HEAD
       		 echo \|Please enter old password\:        \|
=======
       		 echo \|"Please enter old password\:        "\|
>>>>>>> refs/remotes/NoxxShus/master
		 echo -------------------------------------
       		 read paswrd
           		 echo $enterName > ~/Desktop/scripts/udata/temp.txt
           		 enterPass=$(awk '{print $4}' ~/Desktop/scripts/udata/temp.txt)
           		 if [ "$enterPass" = "$paswrd" ];
                	then
   		 {
               		 echo -------------------------------------
<<<<<<< HEAD
               		 echo \|Enter new password \for $uname     \|
=======
               		 echo \|"Enter new password \for $uname     "\|
>>>>>>> refs/remotes/NoxxShus/master
			 echo -------------------------------------
               		 read $temp    
           	 
          				 while (awk "{print $4}" = $paswrd)
   			 do
           if [ $(echo "$contPass" | tr -dc "[;digit;]") ]; then
		if [ $(echo "$contPass" | tr -dc "[;lower;]") ]; then
			if [ $(echo "$contPass" | tr -dc "[;upper;]") ]; then
   				 {
           		    		 echo valid
   				 sed -e 's/$paswrd/$temp/g'~/Desktop/scripts/udata/user_list.txt  
   				 }
   	           		 	else
   				 {
          		    			 echo invalid password, please use capitals, lowercase, and numbers.
   				 }
           			 	fi
			else
   				 {
          		    			 echo invalid password, please use capitals, lowercase, and numbers.
   				 }
           			 	fi
		else
   				 {
          		    			 echo invalid password, please use capitals, lowercase, and numbers.
   				 }
           			 	fi
           			 done  
                	count=1
   		 }
    
            	else
   		 {
			echo -------------------------------------
<<<<<<< HEAD
                	echo \|Sorry, wrong password.             \|
=======
                	echo \|"Sorry, wrong password.             "\|
>>>>>>> refs/remotes/NoxxShus/master
			echo -------------------------------------
   		 }    
   	 	fi


   	 }   	 
        	else
   	 {
            	echo -------------------------------------
<<<<<<< HEAD
            	echo \|Sorry, that user does not exist.   \|
=======
            	echo \|"Sorry, that user does not exist.   "\|
>>>>>>> refs/remotes/NoxxShus/master
		echo -------------------------------------
   	 }
        	fi
    
    done
    
    count=0
    uname=$temp
    temp=""
    ;;
    
    3)
		 echo -------------------------------------
   		 echo \|"Do you want to create an invoice? \(Y\/n\)"\|
		 echo -------------------------------------
   		 read temp
    
   	 case $temp in
   		 [yY] )
<<<<<<< HEAD
		 echo -------------------------------------
		 echo \|"For an individual(1) or for all(2)?"\|
		 echo -------------------------------------
		 read temp
	 case $temp in
		 [1] )
		 echo -------------------------------------
       		 echo \|"Please enter a user.              "\|
		 echo -------------------------------------
		 read temp

                 invToPay=$(wc -l < ~/Desktop/scripts/udata/invoice/$temp.txt)
		 echo Username $temp Balance "$"$invToPay >> ~/Desktop/scripts/udata/invoice/htp.txt
		 echo -------------------------------------
                 echo \|"An invoice has been created. $"$invToPay" is owed."\|
		 echo -------------------------------------      
;;
		 [2] )
		 
		 echo -------------------------------------
		 echo \|"Well, you cant.                    "\|
		 echo -------------------------------------
;;
		 * )
		 echo -------------------------------------
       		 echo \|"Invalid input, please try again.   "\|
		 echo -------------------------------------
;;
esac
     
;;
    
		 [nN] )
		 echo -------------------------------------
       		 echo \|Okay, maybe some other time.       \|
		 echo -------------------------------------

;;
   	 
    
   		 *)
		 echo -------------------------------------
       		 echo \|Invalid input, please try again.   \|
		 echo -------------------------------------

;;
=======
                 inv=$(wc -l < ~/Desktop/scripts/udata/call_log/"$uname.txt")
                 echo An invoice has been created.
                
;;
    
   		 [nN] )
		 echo -------------------------------------
       		 echo \|"Okay, maybe some other time.       "\|
		 echo -------------------------------------

;;
   	 
    
   		 *)
		 echo -------------------------------------
       		 echo \|"Invalid input, please try again.   "\|
		 echo -------------------------------------

;;
>>>>>>> refs/remotes/NoxxShus/master
   	 esac
    ;;
    
    4)
		 echo -------------------------------------
<<<<<<< HEAD
   		 echo \|Please enter contact name\:        \|
=======
   		 echo \|"Please enter contact name\:        "\|
>>>>>>> refs/remotes/NoxxShus/master
		 echo -------------------------------------
   		 read contAdd
    
		 echo -------------------------------------
<<<<<<< HEAD
   		 echo \|Please enter contact number\:      \|
=======
   		 echo \|"Please enter contact number\:      "\|
>>>>>>> refs/remotes/NoxxShus/master
		 echo -------------------------------------
   		 read contNum
    
   		 cont=(wc -l ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt)".\s" $contAdd "\sNumber\s" $contNum\n
   	 
   		 $cont >> ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
    ;;
    
    5)

	 if grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt ; then
	 echo -------------------------------------
	 echo You have an invoice due. Please pay this off before making additional calls.
	 echo -------------------------------------
	 else
	 echo -------------------------------------
   	 echo Please enter the name of the person you are calling
	 echo -------------------------------------
   	 read temp
    
   	 echo $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
   	 echo $temp >> ~/Desktop/scripts/udata/invoice/$uname".txt"
	 fi
    ;;
    
    6)
	 echo -------------------------------------
   	 echo Please the name of the user to check their call log\:
	 echo -------------------------------------
   	 read temp
    
   	 cat ~/Desktop/scripts/udata/call_log/"$temp.txt"
    ;;
    
    7)    
		 echo -------------------------------------
   		 echo Please enter the name of the user you want to check the contacts of\:
	   	 echo -------------------------------------
   	 read temp
   	 
   	 cat ~/Desktop/scripts/udata/contacts/$temp.txt
    ;;
    
    *)
   	 echo invalid input
    ;;
    esac
}
else
{
<<<<<<< HEAD
   		echo \|1. Add contacts to device          \|
        	echo \|2. Place call                      \|
        	echo \|3. Check device call log           \|
        	echo \|4. Check contacts                  \|
        	echo \|5. Check invoice                   \|
        	echo \|6. Pay bill                        \|
		echo -------------------------------------
		if grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt ; then
=======
   		echo \|"1. Add contacts to device          "\|
        	echo \|"2. Place call                      "\|
        	echo \|"3. Check device call log           "\|
        	echo \|"4. Check contacts                  "\|
        	echo \|"5. Check invoice                   "\|
        	echo \|"6. Pay bill                        "\|
>>>>>>> refs/remotes/NoxxShus/master
		echo -------------------------------------
		echo \|You have an invoice due.           \|
		echo -------------------------------------
		echo
        	echo Please enter the number of the menu you wish to enter
		else
		echo Please enter the number of the menu you wish to enter
		fi
        	read menuSelect


    case $menuSelect in
    1)
		echo -------------------------------------
<<<<<<< HEAD
   	 	echo \|Please enter contact name\:        \|
=======
   	 	echo \|"Please enter contact name:         "\|
>>>>>>> refs/remotes/NoxxShus/master
		echo -------------------------------------
   	 	read contAdd
   	 
		echo -------------------------------------
<<<<<<< HEAD
   	 	echo \|Please enter contact number\:      \|
=======
   	 	echo \|"Please enter contact number:       "\|
>>>>>>> refs/remotes/NoxxShus/master
		echo -------------------------------------
   	 	read contNum
   	 
   	 	cont=(wc -l ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt)".\s" $contAdd "\sNumber\s" $contNum\n
   		 
   	 	$cont >> ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
   	 ;;


   	 2)
<<<<<<< HEAD
		
	 	if grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt ; then
		echo -------------------------------------
	 	echo You have an invoice due. Please pay this off before making additional calls.
	 	echo -------------------------------------

		else
		echo -------------------------------------
   		echo Please enter the name of the person you are calling
		echo -------------------------------------
   		read temp
=======
		 echo -------------------------------------
   		 echo Please enter the name of the person you are calling
		 echo -------------------------------------
   		 read temp
>>>>>>> refs/remotes/NoxxShus/master
   	 
   	 	echo $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
   	 	echo $temp >> ~/Desktop/scripts/udata/invoice/$uname".txt"
		fi
   	 ;;
    
   	 3)
		echo -------------------------------------
   	 	cat ~/Desktop/scripts/udata/call_log/$uname".txt"
		echo -------------------------------------
   	 ;;
    
   	 4)
		echo -------------------------------------
   	 	cat ~/Desktop/scripts/udata/contacts/$uname".txt"
		echo -------------------------------------
   	 ;;
    
   	 5)
		echo -------------------------------------
   	 	cat ~/Desktop/scripts/udata/invoice/$uname".txt"
		echo -------------------------------------
   	 ;;
    
   	 6)
		echo -------------------------------------
   	 	echo Your invoice is\:
		grep $uname ~/Desktop/scripts/udata/invoice/htp.txt
   	 	echo -------------------------------------
   	 	echo "Do" you want to pay the bill? Y,N
   	 	read temp
		case $temp in
   		[yY] )
		sed -i "/$uname/d" ~/Desktop/scripts/udata/invoice/htp.txt
		echo -------------------------------------
		echo \|Bill has been paid.               \|
		echo -------------------------------------
;;
		[nN] )
		echo -------------------------------------
       		echo \|You had best pay up soon.          \|
		echo -------------------------------------
;;
		* )
		echo -------------------------------------
		echo Invalid Input.
		echo -------------------------------------
;;
esac



   	 ;;
    


    *)
   	 echo invalid input
    ;;
    esac
}
fi
echo
temp=""
done
