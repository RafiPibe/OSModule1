#!/bin/bash

# Constants
IMAGE_URL="https://blog.tripcetera.com/id/wp-content/uploads/2019/04/borobudur.jpg"
SLEEP_TIME="10h"

# Variables
day_now=$(date +"%d")
startfolder=1
finalfolder=1

# Main loop
while true
do
  # Get current hour
  hour=$(date +"%H")
  if [ "$hour" = "00" ]
  then 
    hour=1
  fi
  
  # Create new folder if needed
  folder_name="kumpulan_$finalfolder"
  if [ ! -d "$folder_name" ]
  then
    mkdir "$folder_name"
    num=1
    while [ $num -le $hour ]
    do
      wget -O "$folder_name/perjalanan_$num.jpg" "$IMAGE_URL"
      num=$((num+1))
    done
  fi
  
  # Zip folders if a new day has started
  current_day=$(date +"%d")
  if [ "$current_day" -ne "$day_now" ]
  then
    for ((num=startfolder; num<=finalfolder; num=num+1))
    do
      zip -r "devil_$num.zip" "kumpulan_$num"
    done
    startfolder=$((finalfolder+1))
    day_now=$current_day
  fi
  
  finalfolder=$((finalfolder+1))
  
  # Wait for the specified time
  sleep "$SLEEP_TIME"
done
