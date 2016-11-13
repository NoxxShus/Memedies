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


invoice=""
inv=""




while (($count == 0))
do
	echo -------------------------------------
	echo \|"Welcome to the Group Login Program "\|
	echo -------------------------------------
	echo \|"Please enter your username:        "\|
	echo -------------------------------------
	read uname




	enterName=$(grep "$uname" ~/Desktop/scripts/udata/user_list.txt)




	echo -------------------------------------
	echo \|"Please enter your password:        "\|
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
        	echo \|"Sorry, wrong password.             "\|
    		echo -------------------------------------
    	fi




    
	else
    clear
    	echo \|"Sorry, that user does not exist.   "\|
    	echo -------------------------------------
	clear
	fi
done




count=0








while (($count == 0))
do


clear


echo -------------------------------------
echo \|"     Commands available to you    "\|
echo -------------------------------------




admin=$(awk '{print $6}' ~/Desktop/scripts/udata/temp.txt)
if [ $admin = "1"  ];     
    	then         	
    	{
        	echo \|"1. Create user                    "\|
        	echo \|"2. Change password                "\|
        	echo \|"3. Generate invoice               "\|
        	echo \|"4. Add contacts to device         "\|
        	echo \|"5. Place call                     "\|
        	echo \|"6. Check device call log          "\|
        	echo \|"7. Check contacts                 "\|
		echo -------------------------------------
        	echo Please enter the number of the menu you wish to enter
    	read menuSelect
    
    case $menuSelect in
    1)
    while (($count == 0))
    do
	echo -------------------------------------
    	echo \|Please enter user name\:           \|
	echo -------------------------------------
    	read contAdd
    
	echo -------------------------------------
    	echo \|Please enter user password\:       \|
	echo -------------------------------------
    	read contPass


	echo -------------------------------------
    	echo \|Is User an admin? 1\/0\:           \|
	echo -------------------------------------
    	read contAdmin
    	
	if [ $(echo "$contPass" | tr -dc "[:digit:]") ];
 then
		if [ $(echo "$contPass" | tr -dc "[:lower:]") ];
 then
			if [ $(echo "$contPass" | tr -dc "[:upper:]") ];
 then
	 echo Username $contAdd password $contPass admin $contAdmin >> ~/Desktop/scripts/udata/user_list.txt
	 touch ~/Desktop/scripts/udata/call_log/"$contAdd.txt"
   	 touch ~/Desktop/scripts/udata/contacts/"$contAdd.txt"
   	 touch ~/Desktop/scripts/udata/invoice/"$contAdd.txt"
count=1
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
    while (($count == 0))
    do
        	echo \|Please enter the username\:        \|
		echo -------------------------------------
        	read uname2  
    
        	enterName=$(grep "$uname2"  ~/Desktop/scripts/udata/user_list.txt)
    
   	 
    
   	 if [ "$enterName" ];
        	then
   	 {
   		 echo -------------------------------------
       		 echo \|Please enter old password\:        \|
		 echo -------------------------------------
       		 read paswrd
           		 echo $enterName > ~/Desktop/scripts/udata/temp2.txt
           		 enterPass=$(awk '{print $4}' ~/Desktop/scripts/udata/temp2.txt)
           		 if [ "$enterPass" = "$paswrd" ];
                	then
   		 {
               		 
           	 
          while [ "$enterPass" == "$paswrd" ] ;
   			 do

			 echo -------------------------------------
               		 echo \|Enter new password \for $uname2     \|
			 echo -------------------------------------
               		 read temp    

                         perl -pi -e "s/$paswrd/$temp/g" ~/Desktop/scripts/udata/temp2.txt

           if [ $(echo "$temp" | tr -dc "[:digit:]") ]; 
		then
		
		if [ $(echo "$temp" | tr -dc "[:lower:]") ]; 
			then
			
			if [ $(echo "$temp" | tr -dc "[:upper:]") ]; 
				then
   				 
           		    		 echo valid
				
   				perl -pi -e "s/$paswrd/$temp/g" ~/Desktop/scripts/udata/user_list.txt
break;
   				 

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
                	echo \|Sorry, wrong password.             \|
			echo -------------------------------------
   		 }    
   	 	fi


   	 }   	 
        	else
   	 {
            	echo -------------------------------------
            	echo \|Sorry, that user does not exist.   \|
		echo -------------------------------------
   	 }
        	fi
    
    done
    
    count=0
    temp=""
    ;;
    
    3)
		 echo -------------------------------------
   		 echo Do you want to create an invoice? \(Y\/n\)
		 echo -------------------------------------
   		 read temp
    
   	 case $temp in
   		 [yY] )
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
   	 esac
    ;;
    
    4)
		 echo -------------------------------------
   		 echo \|"Please enter contact name:        "\|
		 echo -------------------------------------
   		 read contAdd
    
		 echo -------------------------------------
   		 echo \|"Please enter contact number:      "\|
		 echo -------------------------------------
   		 read contNum


		 temp = wc -l ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
    
   		 echo $temp $contAdd Number $contNum\n >> ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
    ;;
    
    5)
	 echo -------------------------------------
   	 echo Please enter the name of the person you are calling
	 echo -------------------------------------
   	 read temp
    
   	 echo $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
   	 echo "1" >> ~/Desktop/scripts/udata/invoice/$uname".txt"
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
   		echo \|"1. Add contacts to device          "\|
        	echo \|"2. Place call                      "\|
        	echo \|"3. Check device call log           "\|
        	echo \|"4. Check contacts                  "\|
        	echo \|"5. Check invoice                   "\|
        	echo \|"6. Pay bill                        "\|
		echo -------------------------------------
        	echo Please enter the number of the menu you wish to enter
        	read menuSelect




    case $menuSelect in
    1)
		echo -------------------------------------
   	 	echo \|"Please enter contact name:         "\|
		echo -------------------------------------
   	 	read contAdd
   	 
		echo -------------------------------------
   	 	echo \|"Please enter contact number:       "\|
		echo -------------------------------------
   	 	read contNum
   	 
   	 	cont=(wc -l ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt)
   		 
   	 	echo $cont $contAdd Number $contNum\n >> ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
   	 ;;




   	 2)
		 echo -------------------------------------
   		 echo Please enter the name of the person you are calling
		 echo -------------------------------------
   		 read temp
   	 
   	 echo $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
   	 echo "1" >> ~/Desktop/scripts/udata/invoice/$uname".txt"
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
   	 	grep -i ~/Desktop/scripts/udata/invoice/$uname".txt"
   	 
   	 	echo do you want to pay the bill Y or n
   	 	read $temp
   	 
   	 	if [[$temp -eq Y] || [$temp -eq y]];
   	 	then
   			 {
   			 	cat "" > ~/Desktop/scripts/udata/invoice/$uname".txt"
   			 }




   	 	elif [[$temp -eq N] || [$temp -eq n]];
   	 	then
   			 {
   			 	echo Okay, maybe some other time.
   			 }




   	 	else
   			 {
   			 	echo Invalid input, please try again.
   			 }
   	 	fi
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







