#!/bin/bash

Alphabet=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")

#====================================================================
# Creating Function which produce random Key
#====================================================================
Random_String_Generator() {
local Random_string=""
for (( i=0; i<3 ;i++ ))
do
random_index=$((RANDOM % ${#Alphabet[@]}))
Random_string="${Random_string}${Alphabet[random_index]}"
done
echo "$Random_string"
}
Random_string=$(Random_String_Generator)
#===================================================================
# For Creating Plain_Txt
#===================================================================
echo "Enter the Data You want to encrypt"
read Plain_Data
for (( i=0; i<${#Plain_Data} ; i++ ))
do
Data[i]="${Plain_Data:i:1}"
done
# ==================================================================
# Setting key into a Array
# ==================================================================
for (( j=0; j<${#Random_string}; j++ ))
do
Key[j]="${Random_string:j:1}"
done
#====================================================================

# For Creating Key Stream
#====================================================================
for (( i1=0; i1<${#Plain_Data} ; i1++ ))
do
if (( $i1 < ${#Random_string} ))
then
C[i1]="${Key[i1]}"

elif (( $i1 >= ${#Random_string} ))
then
n=$((i1-${#Random_string}))
C[i1]="${Key[n]}"
fi
done
echo "Here is your keyword ::${C[@]}"
# ===================================================================
# For Creating Matrix
declare -A matrix
for (( i2=0; i2<26; i2++ ))
do

	for (( j2=0; j2<26; j2++ ))
	do
	n=$((i2+j2))
	if (( n<26 ))
	then
	matrix[$i2,$j2]="${Alphabet[n]}"
	elif (( n>=26 ))
	then
	k=$((n-26))
	matrix[$i2,$j2]="${Alphabet[k]}"
	fi
	done
done
# =================================================================
# Encrypted loop
# ================================================================
declare -A Encrypted_Data
for (( i3=0; i3<${#Plain_Data}; i3++ ))
do
	for (( j3=0; j3<26; j3++ ))
	do

	 if [[ "${matrix[0,$j3]}" == "${Data[$i3]}" ]]
	 then
		for (( k=0;k<26;k++ ))
		do

		 if [[ "${matrix[$k,0]}" == "${C[$i3]}" ]]
		  then
			echo -n "${matrix[$k,$j3]}"
			Encyrpted_Data[i3]="${matrix[$k,$j3]}"
		 fi
		done
       	fi
	done
done
