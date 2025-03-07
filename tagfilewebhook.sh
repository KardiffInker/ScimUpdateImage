#!/bin/bash

PreviousTagFile="/var/tmp/last_docker_tag.txt"
WebhookURL=""

# Get the latest Stable tag
LatestTag=$(curl -s "https://hub.docker.com/v2/repositories/1password/scim/tags?page_size=2" | jq -r '.results[1].name')

#Check for new tag exists
if [ "$LatestTag" != "$(cat $PreviousTagFile 2>/dev/null)" ]; then
    echo "$LatestTag" > "$PreviousTagFile"
    
    #Send webhook
    curl -X POST -d "A new version of the 1password/scim Docker container has been released. Version number: $LatestTag" "$WebhookURL"
fi
