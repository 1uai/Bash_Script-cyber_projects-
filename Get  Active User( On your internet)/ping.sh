#!/bin/bash


echo -e "\n"
echo "=============================================================================================="
ifconfig
echo "----------------------------------------------------------------------------------------------"
echo "In upper information the inet and broadcoast address is given you now you choose the range"
echo "----------------------------------------------------------------------------------------------"
echo "Enter the First part of the ip address like 192.0.0."
read First
echo "Enter the second part of the ip address frome where the range starts like 0-24(0 is the first)"
read Start
echo "Now Enter the  last part of range "
read last
for (( i=$Start; i<=$last; i++  ))
do
echo "-----------------------------------------------------------------------------------------------"
ping  -c 4  $First$i  
echo "-----------------------------------------------------------------------------------------------"
done


