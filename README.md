1. Creating two variables for the name and date format
2. Checking the existence of apache2 packages, if not available, install the same and enable the service
3. Then archiving the logs from the /var/log/apache2 folder and uploading this to S3 bucket
4. Creating the inventory file in the /var/www/html and appending the log file information
5. Checking the cron job, if not exist, create a new job to the the automation.sh script.
