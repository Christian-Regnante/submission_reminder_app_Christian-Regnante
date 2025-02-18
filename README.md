  <ins>***Submission Reminder App***</ins>
A Linux-Bash scripting based reminder application that helps students manage their assignments and submit them on time. It automatically tracks submissions and notifies students who haven’t completed their work.

  **Features**
**Automated Submission Tracking** – Scans the assignment file to identify students with pending submissions.  
**Custom Reminders** – Provides timely reminders for students with upcoming or overdue assignments.  
**Easy Setup** – A single script creates the necessary environment in seconds.  
**Configurable Settings** – Easily update assignment details, such as names and due dates, through the configuration file.  

  **How to Install
1️⃣ Clone the Repository

        git clone https://github.com/Christian-Regnante/submission_reminder_app_Christian-Regnante.git

2️⃣ Run the Setup Script
Inside the submission_reminder_app_Christian-Regnante directory
Execute the script to create the necessary directory structure and files:

Before change permssions with exexute mode in order to run the create_environment.sh

        chmod +x create_environment.sh
        ./create_environment.sh

3️⃣ Run the Reminder App
After setup is complete, navigate to the new created directory and start the app:

        cd submission_reminder_yourName
        ./startup.sh

  **Application Explained
Reads Submission Data
The submissions.txt file contains a list of students and their submission status.

Checks for Pending Assignments
The app compares student records against the assignment requirements and generates reminders.

Displays Reminders
The script outputs a list of students who have not submitted their assignments.

Configuration
Modify the config.env file to customize settings:

# IMPORTANT:
# You can edit both confing.env and submission.txt
# Add your desired Inputs

  🔹 Output Example
After running ./startup.sh, the script will display:

        Assignment: Shell Navigation
        Days remaining to submit: 2 days
        --------------------------------------------
        Checking submissions in ./assets/submissions.txt
        Reminder: Chinemerem has not submitted the Shell Navigation assignment!
        Reminder: Divine has not submitted the Shell Navigation assignment!
        Reminder: Christian Regnante has not submitted the Shell Navigation assignment!
        Reminder: Hirwa Armstrong has not submitted the Shell Navigation assignment!
        Reminder application executed successfully!
        
        ---------------------------------------------------------------------------------------------------
