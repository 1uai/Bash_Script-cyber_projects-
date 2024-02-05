#!/bin/bash

First_Array=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M")
Second_Array=("N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
echo "-----------------------------------------------------"
echo "****************Welcome to Rot_13********************"
echo "-----------------------------------------------------"
echo "Enter Your Data"
read Data_Array
echo "-----------------------------------------------------"
echo -e "What you want to do with Data \n 1)Encryption \n 2)Decryption "
read -s Choice
echo "-----------------------------------------------------"
if [[ $Choice == 1 ]]
then
for (( i=0 ; i< ${#Data_Array}; i++ ))
do
	Plain_Data[i]="${Data_Array:i:1}"
	for (( j=0; j < 13; j++ ))
	do
	if [[ ${First_Array[j]} == ${Plain_Data[i]} ]]
	then
	Encrypted_Data[i]="${Second_Array[j]}"	
	elif [[ ${Second_Array[j]} == ${Plain_Data[i]} ]]
	then
	Encrypted_Data[i]="${First_Array[j]}"
	fi
	done
done
echo -n "Your Encrypted Data is : "
for value in ${Encrypted_Data[@]}
do
echo -n $value
done

elif [[ $Choice == 2 ]]
then
for (( i1=0 ; i1< ${#Data_Array}; i1++ ))
do
        Plain_Data[i1]="${Data_Array:i1:1}"
        for (( j1=0; j1 < 13; j1++ ))
        do
        if [[ ${First_Array[j1]} == ${Plain_Data[i1]} ]]
        then
        Decrypted_Data[i1]="${Second_Array[j1]}"  
        elif [[ ${Second_Array[j1]} == ${Plain_Data[i1]} ]]
        then
         Decrypted_Data[i1]="${First_Array[j1]}"
        fi
        done
done
echo -n "Your Decrypted Data is : "
for value in ${Decrypted_Data[@]}
do
echo -n $value
done
fi
echo -e "\n====================================================="
