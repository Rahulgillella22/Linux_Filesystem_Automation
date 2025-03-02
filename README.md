# Linux Filesystem Automation  

## Overview  

This project automates email notifications for universities and schools whenever a new file (e.g., student records, reports, schedules) is created in a monitored directory. It ensures that each class in-charge receives relevant files automatically without manual intervention.  

## Features  

 **File Monitoring:** Uses `inotifywait` to detect new files.  
 **Class-wise Email Routing:** Sends files to the respective class in-charge.  
 **Automated Email Sending:** Uses `mutt` with Gmail SMTP for email automation.  
 **File Renaming After Sending:** Prevents duplicate emails by renaming sent files.  
 **Persistent Execution:** Runs continuously in the background using `nohup`.  

---

## 🚀 How It Works  

1️⃣ **Monitoring:**  
   - The script continuously watches a specific directory for new files.  
   - It identifies newly created files that follow the class naming convention (`classX_s_*`).  

2️⃣ **Processing & Emailing:**  
   - Extracts the class name from the filename.  
   - Matches the class with the assigned in-charge email.  
   - Uses `mutt` to send the file as an email attachment.  

3️⃣ **File Handling:**  
   - After sending the email, the script renames the file (`_s` to `_sent`) to avoid reprocessing.  

4️⃣ **Background Execution:**  
   - The script runs persistently using `nohup`, ensuring uninterrupted operation even if the terminal is closed.  

---

## 🛠 Installation & Setup  

### Prerequisites  

- Linux OS (Ubuntu, Debian, Kali, etc.)  
- Installed packages: `mutt`, `inotify-tools`  
- A Gmail account with **App Password** enabled  

---

### 🔧 Configuration  

1️⃣ **Open the `muttrc` file for editing:**  
   ```sh
   nano ~/.muttrc
   ```

2️⃣ **Save and exit nano:**

Press CTRL + X (to exit).
Press Y (to confirm saving).
Press Enter (to save and exit).

3️⃣ **Run the script**
```sh
nohup ./rewritesendmail.sh &
```



