#!/bin/bash

Sequence_Alphabet=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
Shifted_Alphabet(){

n=${#Plain_Data}
for (( i=0;i<26;i++ ))
do	#echo $n
	k=$((i+n))
	if (( k < 26 ))
	then
	Shifted_Array[i]="${Sequence_Alphabet[$k]}"
	elif (( k >= 26 ))
	then
	N1=$((k-26))
	Shifted_Array[i]="${Sequence_Alphabet[$N1]}"
	fi
done
}
echo "-----------------------------------------------------------"
echo "*************** Welcome to Ceaser_Cipher ******************"
echo "-----------------------------------------------------------"
echo "Please Enter Your Data which you want to Encrypt or Decrypt"
read Plain_Data
echo "-----------------------------------------------------------"
Shifted_Alphabet ${#Plain_Data}
echo -e "What you want with the data encrypt or decrypt \n 1) Encryption  \n 2) Decryption "
read -s Choice
echo "-----------------------------------------------------------"
if [[ $Choice == "1" ]]
then
for (( i1=0; i1< ${#Plain_Data}; i1++ ))
do
	Data_Array[i1]="${Plain_Data:i1:1}"

	for (( j1=0; j1<26; j1++ ))
	do
	if [[ ${Sequence_Alphabet[j1]} == ${Data_Array[i1]} ]]
	then
	Encrypted_Data[i1]="${Shifted_Array[j1]}"
	fi
	done
done
for value in ${Encrypted_Data[@]}
do
	echo -n "$value"
done

elif [[ $Choice == "2" ]]
then
for (( i2=0; i2 < ${#Plain_Data}; i2++ ))
do
	EData_Array[i2]="${Plain_Data:i2:1}"
	for (( j2=0; j2 < 26; j2++ ))
	do
	if [[ ${Shifted_Array[j2]} == ${EData_Array[i2]} ]]
	then
#	echo "${Sequence_Alphabet[j2]}"
	Decrypted_Data[i2]="${Sequence_Alphabet[j2]}"
	fi
	done
done
#echo ${Decrypted_Data[@]}
for value in ${Decrypted_Data[@]}
do
	echo -n $value
done
fi
