#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

figlet -f slant ClamAntiVirus


echo -e "${GREEN}*****************************************************************"
echo  "Dobrodosli u automatizovano skeniranje fajlova sa clamAV"
echo "*****************************************************************"
sleep 3s

# Define directory for karantin

echo "##### Kreiranje Karantin Direkotrijuma #####"
sleep 1s
karantin_Dir="karantin"
if [ ! -d "$karantin_Dir" ]; then
	mkdir "$karantin_Dir"
	echo "Karantin direktorijuma kreiran u : $karantin_Dir"
fi

# Define logging directory

echo "##### Kreiranje Log Direktorijuma #####"
log_Dir="AntiVirusLogs"
mkdir "$log_Dir"
datum=$(date +"%F-%T")



PS3='Please enter your choice: '
options=("Scan 1 file-a" "Scan 2 Dir" "Scan 3 FS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Scan 1 file-a")
	    echo "######################################################"
            echo "You chose the first option to scan a file "
	    read -p "Enter file name :" fileName
	    if [ -e "$fileName" ]; then
		echo "FIle ${fileName} exists performing scan"
		result=$(clamscan "$fileName" -l /home/skuller/logs/scan."$datum".log)
		echo "$result"
		if echo "$result" | grep "Infected files: 1"; then
			echo "Fajl ${fileName} is infected. Moving to karantin directory!"
			mv "$fileName" "$karantin_Dir"
		fi
	    else
		echo "FIle ${fileName} does not exist"
	    fi
            ;;
        "Scan 2 Dir")
            echo "You chose the second option to scan a directory"
	    read -p "Enter directory name to scan :" dirName
	    if [ -d "$dirName" ]; then
		echo "Directory ${dirName} exists perfroming scan"
		clamscan -r "$dirName"
	    else
		echo "Directory ${dirName} does not exist"
            fi
	    ;;
        "Scan 3 FS")
            echo "you chose choice $REPLY which is $opt"
	    clamav -r --bell  /
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
