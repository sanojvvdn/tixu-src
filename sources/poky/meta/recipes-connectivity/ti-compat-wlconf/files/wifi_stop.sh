#!/bin/sh

if !( ifconfig  | grep wlan0 > /dev/null 2>&1 )
then
        echo "Wi-Fi is already Down"
else
	ifconfig wlan0 0.0.0.0
        ifconfig wlan0 down
        killall hostapd > /dev/null 2>&1
        killall wpa_supplicant > /dev/null 2>&1
fi

