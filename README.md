Creating two variables for the name and date format
Checking the existence of apache2 packages, if not available, install the same and enable the service
Then archiving the logs from the /var/log/apache2 folder and uploading this to S3 bucket
Creating the inventory file in the /var/www/html and appending the log file information
Checking the cron job, if not exist, create a new job to the the automation.sh script.
