# toolKit-clamDF
Project for 3rd year DF - FIR

ClamAV Automation Script 

 - This script provides an automated way to scan files, directories, or the entire file system using ClamAV, a powerful open-source antivirus engine. It offers a user-friendly menu for selecting scanning options and includes functionality for handling infected files and generating logs.

## Prerequisites

- ClamAV Installed: Ensure ClamAV is installed and updated on your system. You can install ClamAV using the following command:
 > sudo apt install clamav

- Script Permissions: Ensure the script has execute permissions:
 > chmod +x script_name.sh

##################################################################

## Usage

Clone or download the script to your local machine.

Run the script using:

 > ./script_name.sh

###################################################################

## Follow the menu prompts to select an option:

 - Scan 1 file: Enter the file name to scan it.

 - Scan 2 Directory: Enter the directory name for a recursive scan.

 - Scan 3 File System: Perform a full scan of the system.

#######################################################################

## Quarantine Directory

- The script automatically creates a quarantine directory named karantin in the script's working directory.

- Any infected files detected during a scan will be moved to this directory.

## Log Directory

 - Logs are saved in the AntiVirusLogs directory.

 - Each log file is named with the current timestamp for easy identification (e.g., scan-YYYY-MM-DD-HH-MM-SS.log).

#######################################################################

## Testing (to actually see if a script works)

- You can safely test the script using the EICAR test file, a harmless file designed to simulate a virus detection:

- Create the EICAR test file:

 >_ echo "X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*" > eicar.txt

Use the script to scan the eicar.txt file. (use option 1 on the toolkit)

Verify that the file is detected as infected and moved to the quarantine directory.
Quit: Exit the script.

#########################################################################

## Disclaimer

- This script is intended for educational purposes and personal use only. Ensure you understand the functionality of ClamAV before deploying this script in production environments.
