#! /bin/bash


#------------------------------------------------------------------------------
# For asking the use about the source website  and the target
echo "--------------------------------------------------------------------"
echo "Choose which source you want to use for passive reconnasense"
echo "--------------------------------------------------------------------"
echo -e "1) Shodan \n2) Subdomain_Discovery \n3) Pentest-Tools.com  \n4) Seranking  \n5) FindSubdomain.com "
echo "--------------------------------------------------------------------"
read A1
echo "You choose the $A1 option"
echo "===================================================================="
echo "Name of the target that yoy want to reconnasense"
read Target
echo "--------------------------------------------------------------------"
#-----------------------------------------------------------------------------



#-----------------------------------------------------------------------------
# For Opening the website and search for the target 
case $A1 in
#=============================================================================
"Shodan")

firefox  "https://www.shodan.io/search?query=$Target"
;;
#=============================================================================
"FindSubdomain.com")

firefox "https://findsubdomains.com.siteindices.com/"
firefox "https://$Target.siteindices.com/"
;;
#=============================================================================
"Seranking")

firefox "https://online.seranking.com/research.competitor.html/?input=$Target.com&mode=base_domain&source=us&globalRegion=undefined"
;;
#=============================================================================
"Subdomain_Discovery")

firefox "https://suip.biz/?act=subfinder"
;;
#=============================================================================
"Pentest-Tools")

firefox "https://pentest-tools.com/information-gathering/find-subdomains-of-domain?view_report=true"
;;
#============================================================================

esac
