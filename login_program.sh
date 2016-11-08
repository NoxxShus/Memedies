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


echo sup


while (($count == 0))
do
	echo -------------------------------------
	echo \|Welcome to the Group Login Program\s\|
	echo -------------------------------------
	echo \|Please enter your username\:\s\s\t\|
	echo -------------------------------------
	read uname


	enterName=$(grep "$uname" ~/Desktop/scripts/udata/user_list.txt)


	echo -------------------------------------
	echo \|Please enter your password\:\t\s\s\|
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
        	echo \|Sorry, wrong password.\t\t\s\s\s\|
    		echo -------------------------------------
    	fi


    
	else
    clear
    	echo \|Sorry, that user does not exist.\s\s\s\|
    	echo -------------------------------------
	clear
	fi
done


count=0




while (($count == 0))
do

clear

echo -------------------------------------
echo -e\| '\t'Commands available to you\s\s\s\s\|
echo -------------------------------------


admin=$(awk '{print $6}' ~/Desktop/scripts/udata/temp.txt)
if [ $admin = "1"  ];
    	then
    	{
        	echo \|1. Create user\t\t\t\t\s\|
        	echo \|2. Change password\t\t\t\s\s\|
        	echo \|3. Generate invoice\t\t\t\s\|
        	echo \|4. Add contacts to device\t\t\|
        	echo \|5. Place call\t\t\t\t\s\|
        	echo \|6. Check device call log\t\t\s\|
        	echo \|7. Check contacts\t\t\t\s\s\s\|
		echo -------------------------------------
        	echo Please enter the number of the menu you wish to enter
    	read menuSelect
    
    case $menuSelect in
    1)
    while (($count == 0))
    do
	echo -------------------------------------
    	echo \|Please enter user name\:\t\t\s\|
	echo -------------------------------------
    	read contAdd
    
	echo -------------------------------------
    	echo \|Please enter user password\:\t\s\s\|
	echo -------------------------------------
    	read contPass


	echo -------------------------------------
    	echo \|Is User an admin? 1\/0\:\t\t\s\|
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
        	echo \|Please enter the username\:\t\s\s\s\|
		echo -------------------------------------
        	read uname  
    
        	enterName=$(grep "$uname"  ~/Desktop/scripts/udata/user_list.txt)
    
   	 
    
   	 if [ "$enterName" ];
        	then
   	 {
   		 echo -------------------------------------
       		 echo \|Please enter old password\:\t\s\s\s\|
		 echo -------------------------------------
       		 read paswrd
           		 echo $enterName > ~/Desktop/scripts/udata/temp.txt
           		 enterPass=$(awk '{print $4}' ~/Desktop/scripts/udata/temp.txt)
           		 if [ "$enterPass" = "$paswrd" ];
                	then
   		 {
               		 echo -------------------------------------
               		 echo \|Enter new password \for $uname\t\|
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
                	echo \|Sorry, wrong password.\t\t\s\s\s\|
			echo -------------------------------------
   		 }    
   	 	fi


   	 }   	 
        	else
   	 {
            	echo -------------------------------------
            	echo \|Sorry, that user does not exist.\s\s\s\|
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
       		 echo \|Okay, maybe some other time.\t\s\s\|
		 echo -------------------------------------

;;
   	 
    
   		 *)
		 echo -------------------------------------
       		 echo \|Invalid input, please try again.\s\s\s\|
		 echo -------------------------------------

;;
   	 esac
    ;;
    
    4)
		 echo -------------------------------------
   		 echo \|Please enter contact name\:\t\s\s\s\|
		 echo -------------------------------------
   		 read contAdd
    
		 echo -------------------------------------
   		 echo \|Please enter contact number\:\t\s\|
		 echo -------------------------------------
   		 read contNum
    
   		 cont=(wc -l ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt)".\s" $contAdd "\sNumber\s" $contNum\n
   	 
   		 $cont >> ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
    ;;
    
    5)
	 echo -------------------------------------
   	 echo Please enter the name of the person you are calling
	 echo -------------------------------------
   	 read temp
    
   	 $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
   	 '1' >> ~/Desktop/scripts/udata/invoice/$uname".txt"
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
   		echo \|1. Add contacts to device\t\t\|
        	echo \|2. Place call\t\t\t\t\s\s\|
        	echo \|3. Check device call log\t\t\s\|
        	echo \|4. Check contacts\t\t\t\s\s\s\|
        	echo \|5. Check invoice\t\t\t\s\s\s\s\|
        	echo \|6. Pay bill\t\t\t\t\s\s\s\s\|
		echo -------------------------------------
        	echo Please enter the number of the menu you wish to enter
        	read menuSelect


    case $menuSelect in
    1)
		echo -------------------------------------
   	 	echo \|Please enter contact name\:\t\s\s\s\|
		echo -------------------------------------
   	 	read contAdd
   	 
		echo -------------------------------------
   	 	echo \|Please enter contact number\:\t\s\|
		echo -------------------------------------
   	 	read contNum
   	 
   	 	cont=(wc -l ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt)".\s" $contAdd "\sNumber\s" $contNum\n
   		 
   	 	$cont >> ~/Desktop/scripts/udata/contacts/$uname\_contacts.txt
   	 ;;


   	 2)
		 echo -------------------------------------
   		 echo Please enter the name of the person you are calling
		 echo -------------------------------------
   		 read temp
   	 
   	 $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
   	 "1" >> ~/Desktop/scripts/udata/invoice/$uname".txt"
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
