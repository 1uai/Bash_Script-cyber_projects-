# /bin/bash
echo "---------------------------------------------------"
echo "*************** Multiple_wife *********************"
echo "---------------------------------------------------"
airmon-ng
echo "---------------------------------------------------"
echo "Choose the wireless adaptor"
read adaptor
echo "---------------------------------------------------"
airmon-ng check kill
airmon-ng start $adaptor
echo "Give the FIle which will have the names of networks"
read  file
echo "---------------------------------------------------"
mdk3 $adaptor b -c 1 -f $file
