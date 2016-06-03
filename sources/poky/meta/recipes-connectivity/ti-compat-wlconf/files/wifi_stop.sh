#!/bin/sh

if !( ifconfig  | grep wlan0 > /dev/null 2>&1 )
then
        echo "Wi-Fi is already Down"
else
	ifconfig wlan0 0.0.0.0
        ifconfig wlan0 down
        killall hostapd
        killall wpa_supplicant
fi

