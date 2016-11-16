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


invToPay=""
invWithName=""

cont=""
contAdd=""
contNum=""
contPass=""
contAdmin=""




contGet=""
contNumSet=""


invoice=""
inv=""


temp3=""
temp4=0


temp=$(cat ~/Desktop/scripts/udata/user_list.txt | wc -l )

uname=$(awk '{ print $2 }' ~/Desktop/scripts/udata/user_list.txt)
	
echo $uname > ~/Desktop/scripts/udata/temp3.txt
((abc=0))
  echo $temp
  echo $temp4
for contMain in $(seq $temp4 $temp)
do
	((abc=abc+1))
  echo $abc
	temp3=$(awk -v def=$abc '{ print $def }' ~/Desktop/scripts/udata/temp3.txt)
  touch ~/Desktop/scripts/udata/invoice/"$temp3.txt"
	
	for contSub in {1..5}
	do
		((temp2=($RANDOM%2)))
		if [ $temp2 == 1 ];
		then
			#here we say that they got an incoming call
			echo "1" >> ~/Desktop/scripts/udata/invoice/"$temp3.txt"
		fi


	done
done


uname=""



while (($count == 0))
do
	echo --------------------------------------
	echo \|" Welcome to the Group Login Program "\|
  echo \|"                                    "\|
	echo \|"    Please enter your username:     "\|
	echo --------------------------------------
	read uname




	enterName=$(grep "$uname" ~/Desktop/scripts/udata/user_list.txt)




	echo --------------------------------------
	echo \|"   Please enter your password:     "\|
	echo --------------------------------------
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
echo \|"           Welcome $uname          "\|
echo \|"     Commands available to you    "\|
echo -------------------------------------




admin=$(awk '{print $6}' ~/Desktop/scripts/udata/temp.txt)
case $admin in    
    	1)
        	echo \|"1. Create user                    "\|
        	echo \|"2. Change password                "\|
        	echo \|"3. Generate invoice               "\|
        	echo \|"4. Add contacts to device         "\|
        	echo \|"5. Place call                     "\|
        	echo \|"6. Check device call log          "\|
        	echo \|"7. Check contacts                 "\|
          echo \|"8. Pay Invoice (to yourself)      "\|
          echo \|"9. Exit                           "\|
		echo -------------------------------------
		
		if  grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt  ; 
			then
  		echo -------------------------------------
 		echo \|"     You have an invoice due.      "\|
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
	echo --------------------------------------
  echo \|"    Please enter user username:     "\|
  echo --------------------------------------
    	read contAdd
    
	echo -------------------------------------
    	echo \|"    Please enter "$contAdd"'s password:   "\|
	echo -------------------------------------
    	read contPass


	echo -------------------------------------
    	echo \|"   Will "$contAdd" be an Admin? (1/0)   "\|
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
        	echo "|Please enter the username\:        |"
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
  		 echo ------------------------------------------
    		 echo \|"Do you want to create an invoice? (Y/n)"\|
  		 echo ------------------------------------------
     		 read temp
      
     	 case $temp in
     		 [yY] )
		 
 		 echo -------------------------------------
     echo \|"        Please enter a user.       "\|
 		 echo -------------------------------------
 		 read temp
 
                  invToPay=$(wc -l < ~/Desktop/scripts/udata/invoice/$temp.txt)
                  ((invToPay--))
 		 echo Username $temp Balance "$"$invToPay >> ~/Desktop/scripts/udata/invoice/htp.txt
 		 echo -------------------------------------
                  echo \|"An invoice has been created. $"$invToPay" is owed."\|
 		 echo ------------------------------------- 
     ;;
     [nN] )
      echo ------------------------------------------------
      echo \|"No man has ever made money by saying no to it."\|
      echo ------------------------------------------------
      echo press enter to return to main menu
     read temp
     ;;
 		 * )
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
    
   		 echo $contAdd Number $contNum >> ~/Desktop/scripts/udata/contacts/$uname.txt
    ;;
    
    5)
 
 	 if grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt  ; 
		then
 	 echo -------------------------------------
 	 echo You have an invoice due. Please pay this off before making additional calls.
 	 echo -------------------------------------
   echo press enter to return to main menu
     read temp
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
       echo ------------------------------------------------------------------------
       echo \|" Please enter the name of the user you want to check the call log of: "\|
       echo ------------------------------------------------------------------------
     read temp
       echo -------------------------------------
       echo \|"          $temp""'s"" Call Log:         "\|
       echo -------------------------------------
     
     cat ~/Desktop/scripts/udata/call_log/"$temp.txt"
     echo press enter to return to main menu
     read temp
    ;;
    
    7)    
		   echo -------------------------------------
   		 echo Please enter the name of the user you want to check the contacts of\:
	   	 echo -------------------------------------
   	 read temp
       echo -------------------------------------
       echo \|"      $temp""'s"" Contacts List:       "\|
       echo -------------------------------------
   	 
   	 cat ~/Desktop/scripts/udata/contacts/"$temp.txt"
     echo press enter to return to main menu
     read temp
    ;;

    8)
    grep $uname ~/Desktop/scripts/udata/invoice/htp.txt > ~/Desktop/scripts/udata/temp3.txt
    temp=$(awk '{ print $4 }' ~/Desktop/scripts/udata/temp3.txt)


      echo -------------------------------------
      echo "        Your invoice is : "$temp"         "
      echo -------------------------------------
        echo Do you want to pay the bill? Y,N
        read temp
    case $temp in
        [yY] )
    perl -pi -e "/$name//g" ~/Desktop/scripts/udata/invoice/htp.txt

        rm  ~/Desktop/scripts/udata/invoice/"$uname.txt"

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

    9 )
    echo Goodbye
    count=1
    ;;
    
    *)
   	 echo invalid input
    ;;
    esac
;;

*)
   		    echo \|"1. Add contacts to device          "\|
        	echo \|"2. Place call                      "\|
        	echo \|"3. Check device call log           "\|
        	echo \|"4. Check contacts                  "\|
        	echo \|"5. Check invoice                   "\|
        	echo \|"6. Pay bill                        "\|
          echo \|"7. Quit                            "\|
		      echo -------------------------------------
		if  grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt  ; then
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
       echo \|"Please enter contact name:        "\|
     echo -------------------------------------
       read contAdd
    
     echo -------------------------------------
       echo \|"Please enter contact number:      "\|
     echo -------------------------------------
       read contNum
    
       echo $contAdd Number $contNum >> ~/Desktop/scripts/udata/contacts/$uname.txt
    ;;




   	 2)
 		
 	 	if  grep -q $uname ~/Desktop/scripts/udata/invoice/htp.txt  ; 
      then
 		echo ------------------------------------------------------------------------
 	 	echo \|"You have an invoice due. Please pay this off before making additional calls."\|
 	 	echo ------------------------------------------------------------------------
 
 		else
 		echo -------------------------------------
    		echo Please enter the name of the person you are calling
 		echo -------------------------------------
    		read temp
     	 
    	 	echo $temp >> ~/Desktop/scripts/udata/call_log/$uname".txt"
    	 	echo $temp >> ~/Desktop/scripts/udata/invoice/$uname".txt"
 		fi
     	 ;;
    
   	 3)
		echo -------------------------------------
   	 	cat ~/Desktop/scripts/udata/call_log/$uname".txt"
		echo -------------------------------------
    echo press enter to return to main menu
     read temp
   	 ;;
    
   	 4)
		echo -------------------------------------
   	 	cat ~/Desktop/scripts/udata/contacts/$uname".txt"
		echo -------------------------------------
    echo press enter to return to main menu
     read temp
   	 ;;
    
   	 5)
		  invToPay=$(wc -l < ~/Desktop/scripts/udata/invoice/$uname.txt)
      ((invToPay--))
     echo -------------------------------------
                  echo \|"Currently you owe $"$invToPay"."\|
     echo ------------------------------------- 
    echo press enter to return to main menu
     read temp
   	 ;;
    
   	 6)
  		grep $uname ~/Desktop/scripts/udata/invoice/htp.txt > ~/Desktop/scripts/udata/temp3.txt
    temp=$(awk '{ print $4 }' ~/Desktop/scripts/udata/temp3.txt)


      echo -------------------------------------
      echo "        Your invoice is : $"$invToPay"         "
      echo -------------------------------------
        echo Do you want to pay the bill? Y,N
        read temp
    case $temp in
        [yY] )
    perl -pi -e "/$name//g" ~/Desktop/scripts/udata/invoice/htp.txt

        echo '' >  ~/Desktop/scripts/udata/invoice/"$uname.txt"

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


    7 )
    echo Goodbye
    count=1
    ;;

    *)
   	 echo invalid input
    ;;
    esac
;;
esac
done
