# Scim Get Updated Image Version Information
A script which checks for a new version of the 1password/scim Docker version and sends this to a webhook
1. Modify the script to include your webhook as teh WebhookURL value
```   
WebhookURL="" Webhook URL value goes here
```  
2. Save the Script
Save your script and make it executable:
```
sudo chmod +x /usr/local/bin/check_docker_update.sh
```

3. Edit the Crontab
Open the crontab editor:
```
crontab -e
```

4. Add the Cron Job
Add this line at the bottom to schedule the script to run once daily at 9 AM:
```
0 9 * * * /usr/local/bin/check_docker_update.sh >> /var/log/docker_update.log 2>&1
```
