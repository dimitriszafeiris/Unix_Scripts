#!/bin/bash
# Script searches for a new notification in a simple index.html page and notify user.

echo "Starting loop."
while true 
do
	timestamp=`date`
	echo "##### Start searching at $timestamp #####"
	
	echo "Download index content."
	wget https://www.webpageyouwanttosearch.com/
	sleep 5s

	echo "Creating date to check content."
	dateToCheck=`date +%d-%m-%Y`

	echo "Checking if $dateToCheck exists in index.html."
	cat index.html | grep $dateToCheck
	res=$?

	if [ $res -eq 0 ]; then
		echo "I found it...! Wake up and exit..."
		#Start a youtube video in order to notify user
		firefox https://www.youtube.com/video
		#Send an email in order to notify user
		echo "This is email body" | mail -s "This is email subject" someone@email.com

		echo "Remove index.html and exit."
		rm index.html
		exit 0
	else
		echo "Nothing yet. Sleep and search again in half an hour."
    fi

	rm index.html
	sleep 30m
	echo "##### End searching #####"
done