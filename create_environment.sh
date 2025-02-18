#!/usr/bin/env bash

#Getting the user name
read -p "Enter your fullnames: " username

parent_dir="submission_reminder_${username}"

mkdir -p "$parent_dir/app"
mkdir -p "$parent_dir/modules"
mkdir -p "$parent_dir/assets"
mkdir -p "$parent_dir/config"

touch "$parent_dir/app/reminder.sh"
touch "$parent_dir/modules/functions.sh"
touch "$parent_dir/assets/submissions.txt"
touch "$parent_dir/config/config.env"
touch "$parent_dir/startup.sh"
touch "$parent_dir/README.md"

#Adding scripts in the configuration environment
cat << 'EOF' > "$parent_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

#Adding content in the submission file
cat << 'EOF' > "$parent_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Blessing, Linux, not submitted
Christian Regnante, Shell Navigation, not submitted
Placide Shami, Shell Navigation, submitted
Hirwa Armstrong, Shell Navigation, not submitted
Christian Regnante, Linux, not submitted
Christian Regnante, Shell Basics, not submitted
Anissa, Git, not submitted
Divine, Shell Basics, submitted
Divine, Linux, not submitted
Chinemerem, Linux, not submitted
Chinemerem, Git, submitted
EOF

#Adding scripts in the functions file in the 
cat << 'EOF' > "$parent_dir/modules/functions.sh"
#!/usr/bin/env bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF

#Adding scripts in the reminder file in the app folder
cat << 'EOF' > "$parent_dir/app/reminder.sh"
#!/usr/bin/env bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

#Creating the startup shell script to automate the application
cat > "$parent_dir/startup.sh" << 'EOF'
#!/usr/bin/env bash

"./app/reminder.sh"
# Final message if it worked!
echo 
echo "_____Reminder application executed successfully!_____"
EOF

#A readme file inside the submission reminder folder
cat << EOF > "$parent_dir/README.md"
         submission_reminder_${username} Directory

Contains five files that all support to perform a reminder application.
With a reminder notification of 2 days before the due date of the assignment.
EOF

chmod +x "$parent_dir/modules/functions.sh"
chmod +x "$parent_dir/startup.sh"
chmod +x "$parent_dir/app/reminder.sh"

echo "$parent_dir created successfully!"
echo "Setup Completed, All Good!!"