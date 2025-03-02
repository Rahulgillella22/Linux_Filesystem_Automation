# 🚀 Workflow Overview
1)File Monitoring (Using inotifywait)
The script runs in the background, constantly monitoring a specific folder.
It uses inotifywait to detect when new files are created.
2)File Detection & Filtering
Once a file is created, the script checks if its name follows a specific pattern (e.g., class1_s_*, class2_s_*).
Only valid files are processed.
3)Email Notification (Using mutt)
If a matching file is found, an email is sent to a predefined recipient (class in-charge) with details.
The script uses SMTP authentication stored in .muttrc.
4)Continuous Execution & Automation
The script runs continuously in the background.
It can also be automated using nohup (for persistent execution) or cron (for scheduled execution).


# Installation & Setup
Linux OS (Ubuntu, Debian, Kali, etc.)
Installed packages: mutt, inotify-tools
A Gmail account with App Password enabled

# create a directory and add the bash script file 
(can modify the script)

# Configure the muttrc file (I added that file and replace with your own credentials) 

for editing file
```sh
nano ~/.muttrc

To save the changes
Press CTRL + X (to exit).
Press Y (to confirm saving).
Press Enter (to save and exit).


# Run the Bash script

``` sh
nohup ./rewritesendmail.sh &

