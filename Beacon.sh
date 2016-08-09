#!/usr/bin/bash

# Waits for bluetooth to start
while true
do
  DEVICES=$(hcitool dev)
  DEVICES=${DEVICES:10}
  if [ -z "$DEVICES" ]
  then
    echo "Waiting..."
    continue
  else
    echo "Done waiting!"
    break
  fi
done

sudo hciconfig hci0 up
sudo hciconfig hcio noscanc
sudo python /home/pi/Beacon.py
