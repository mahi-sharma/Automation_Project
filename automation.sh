myname=monika
s3_bucket=upgrad-monika
timestamp=$(date '+%d%m%Y-%H%M%S')
sudo apt update -y
sudo apt list -a apache2
pgrep -x apache2
if [ $? != 0 ]
then
echo "package is not available..we will install now"
sudo apt install apache2 -y
sudo service apache2 start
sudo systemctl enable apache2
fi
tar -cvf /tmp/${myname}-httpd-logs-${timestamp}.tar /var/log/apache2/*.log
aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
FILE=/var/www/html/inventory.html
if test -f "$FILE";
then
echo "$FILE exists."
sudo chmod 777 $FILE
sudo ls -ltrh /tmp/*tar | awk -F '[ -.]' '{print $16"-"$17, "\t" $18"-"$19,"\t" $20,"\t" $10}' >> /var/www/html/inventory.html
sudo rm -rf /tmp/*.tar
else
sudo touch $FILE
sudo chmod 777 $FILE
sudo ls -ltrh /tmp/*tar | awk -F '[ -.]' '{print $16"-"$17, "\t" $18"-"$19,"\t" $20,"\t" $10}' >> /var/www/html/inventory.html
sudo rm -rf /tmp/*.tar
fi
sudo crontab -l
if [ $? != 0 ]
then
sudo echo "* * * * * root /root/Automation_Project/automation.sh" > /etc/cron.d/automation
sudo crontab /etc/cron.d/automation
fi
