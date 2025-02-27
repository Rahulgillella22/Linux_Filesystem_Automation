#!/bin/bash

# Directory path to check for files
directory_path="$HOME/Desktop/project"

# Define associative array with class names and respective email addresses
declare -A class_emails=(
    ["class1"]="rahulgillella05@gmail.com"
    ["class2"]="245122749025@mvsrec.edu.in"
    ["class3"]="rahulgillella05@gmail.com"
    ["class4"]="rahulgillella05@gmail.com"
    ["class5"]="245122749025@mvsrec.edu.in"
    ["class6"]="f@gmail.com"
    ["class7"]="g@gmail.com"
    ["class8"]="h@gmail.com"
    ["class9"]="i@gmail.com"
    ["class10"]="j@gmail.com"
)

# Start monitoring the directory for new files
inotifywait -m -e create "$directory_path" | while read -r directory event file; do
    # Check if the file name matches the class pattern
    for class_file in "${!class_emails[@]}"; do
        if [[ "$file" == "${class_file}_s_"* ]]; then
            recipient="${class_emails[$class_file]}"
            subject="File Notification for $class_file"
            body="Please find the attached file for $class_file: $directory$file"

            # Send the email with mutt
            if echo "$body" | mutt -s "$subject" -a "$directory$file" -- "$recipient"; then
                echo "Email sent to $recipient with attachment: $directory$file"

                # Rename the file after sending the email
                new_file_name="${file/_s_/_}_sent"
                if mv "$directory$file" "$directory$new_file_name"; then
                    echo "File renamed to: $new_file_name"
                else
                    echo "Failed to rename file: $file"
                fi
            else
                echo "Failed to send email to $recipient with attachment: $file"
            fi
        fi
    done
done
