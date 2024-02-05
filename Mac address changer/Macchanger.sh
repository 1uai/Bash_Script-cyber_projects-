#!/bin/bash
echo -e "\n"
echo "----------------------------------------------------------------------------"
echo "*********************   Welcome to Macchanger   ****************************"
echo "----------------------------------------------------------------------------"
echo "-------->  Please select the wifi adaptor that you want to change <---------"
echo "----------------------------------------------------------------------------"
ifconfig | grep 'wlan'
read w_Ad
echo "----------------------------------------------------------------------------"
ifconfig $w_Ad down
macchanger -r $w_Ad
ifconfig $w_Ad up
echo "----------------------------------------------------------------------------"